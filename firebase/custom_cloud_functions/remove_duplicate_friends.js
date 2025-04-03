const functions = require("firebase-functions");
const admin = require("firebase-admin");

const db = admin.firestore();

exports.removeDuplicateFriends = functions
  .runWith({ memory: "2GB", timeoutSeconds: 540 })
  .pubsub.schedule("every 24 hours")
  .onRun(async (context) => {
    console.log("Starting duplicate removal...");

    try {
      // Fetch all users with a 'friends' field
      const usersSnapshot = await db
        .collection("users")
        .where("friends", ">", [])
        .get();
      if (usersSnapshot.empty) {
        console.log("No users found with friends list.");
        return;
      }

      const batch = db.batch();
      usersSnapshot.forEach((userDoc) => {
        const userId = userDoc.id;
        const friends = userDoc.data().friends;

        if (!Array.isArray(friends) || friends.length === 0) {
          console.log(
            `Skipping user ${userId} - Invalid or empty friends list.`,
          );
          return;
        }

        const uniqueFriends = [...new Set(friends)]; // Remove duplicates

        if (uniqueFriends.length !== friends.length) {
          console.log(
            `Updating user ${userId}: Removed ${friends.length - uniqueFriends.length} duplicates.`,
          );
          batch.update(userDoc.ref, { friends: uniqueFriends });
        }
      });

      await batch.commit();
      console.log("Duplicate removal completed successfully.");
    } catch (error) {
      console.error("Error removing duplicate friends:", error);
    }
  });
