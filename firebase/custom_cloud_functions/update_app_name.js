const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const db = admin.firestore();

exports.updateAppName = functions
  .runWith({ memory: "2GB", timeoutSeconds: 540 })
  .pubsub.schedule("every 24 hours")
  .onRun(async (context) => {
    try {
      const usersSnapshot = await db.collection("users").get();
      const batch = db.batch();

      usersSnapshot.forEach((doc) => {
        const userData = doc.data();
        if (!userData.app_name) {
          // Checks if app_name is null or undefined
          batch.update(doc.ref, { app_name: "romanytas" });
        }
      });

      await batch.commit();
      console.log("Successfully updated user documents");
    } catch (error) {
      console.error("Error updating user documents: ", error);
    }
    return null;
  });
