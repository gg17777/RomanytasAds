const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const db = admin.firestore();

exports.migrateFriendsToNewStructure = functions
  .runWith({ memory: "2GB", timeoutSeconds: 540 })
  .pubsub.schedule("every 24 hours")
  .onRun(async (context) => {
    console.log("Starting friends migration...");

    const friendsMap = new Map(); // Stores userId -> [friendIds]

    try {
      // Fetch all friends documents across all users
      const friendsSnapshot = await db.collectionGroup("friends").get();
      friendsSnapshot.forEach((doc) => {
        const userId = doc.ref.parent.parent.id; // Get user ID from subcollection
        const friendId = doc.data().userFriendRef?.id; // Extract user ID from reference field

        if (!friendId) {
          console.warn(`Skipping doc ${doc.id} - invalid userFriendRef`);
          return;
        }

        if (!friendsMap.has(userId)) {
          friendsMap.set(userId, []);
        }
        friendsMap.get(userId).push(friendId);
      });

      // Fetch all user docs in a single batch to avoid per-user get() calls
      const userIds = Array.from(friendsMap.keys());
      const userRefs = userIds.map((id) => db.collection("users").doc(id));
      const userDocs = await db.getAll(...userRefs);

      // Batch update users
      const batch = db.batch();
      userDocs.forEach((userDoc, index) => {
        if (!userDoc.exists) {
          console.warn(`Skipping user ${userIds[index]} - document not found.`);
          return;
        }

        if (userDoc.data().friends) {
          console.log(
            `Skipping migration: User ${userIds[index]} already has friends list.`,
          );
          return;
        }

        batch.update(userRefs[index], {
          friends: friendsMap.get(userIds[index]),
        });
      });

      await batch.commit();
      console.log("Friends migration completed successfully.");
    } catch (error) {
      console.error("Error migrating friends:", error);
    }
  });
