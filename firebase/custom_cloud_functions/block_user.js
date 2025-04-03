const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const cors = require("cors")({ origin: true }); // Enable CORS for all origins

exports.blockUser = functions.https.onRequest(async (req, res) => {
  cors(req, res, async () => {
    if (req.method !== "POST") {
      return res.status(405).send({ error: "Method Not Allowed" });
    }

    const { userId: authUserId, blockedUserId } = req.body;

    if (!authUserId || !blockedUserId || authUserId === blockedUserId) {
      return res.status(400).send({ error: "Invalid user IDs provided." });
    }

    try {
      const db = admin.firestore();
      const authUserRef = db.collection("users").doc(authUserId);
      const blockedUserRef = db.collection("users").doc(blockedUserId);

      let statusMessage = "";

      await db.runTransaction(async (transaction) => {
        const authUserDoc = await transaction.get(authUserRef);
        const blockedUserDoc = await transaction.get(blockedUserRef);

        if (!authUserDoc.exists || !blockedUserDoc.exists) {
          throw new Error("One or both users do not exist.");
        }

        const authUserData = authUserDoc.data();
        const blockedUserData = blockedUserDoc.data();

        const authUserRefObj = authUserRef; // User reference for myBlocks
        const blockedUserRefObj = blockedUserRef; // User reference for blockedUsers

        const myBlocks = authUserData.myBlocks || [];
        const blockedUsers = blockedUserData.blockedUsers || [];

        const isBlocked = myBlocks.some((ref) => ref.id === blockedUserId);

        if (isBlocked) {
          // Unblock the user
          transaction.update(authUserRef, {
            myBlocks: admin.firestore.FieldValue.arrayRemove(blockedUserRefObj),
          });
          transaction.update(blockedUserRef, {
            blockedUsers:
              admin.firestore.FieldValue.arrayRemove(authUserRefObj),
          });
          statusMessage = "User successfully unblocked.";
        } else {
          // Block the user
          transaction.update(authUserRef, {
            myBlocks: admin.firestore.FieldValue.arrayUnion(blockedUserRefObj),
          });
          transaction.update(blockedUserRef, {
            blockedUsers: admin.firestore.FieldValue.arrayUnion(authUserRefObj),
          });
          statusMessage = "User successfully blocked.";
        }
      });

      return res.status(200).send({ success: true, message: statusMessage });
    } catch (error) {
      console.error("Error toggling block status:", error);
      return res.status(500).send({ error: "Failed to toggle block status." });
    }
  });
});
