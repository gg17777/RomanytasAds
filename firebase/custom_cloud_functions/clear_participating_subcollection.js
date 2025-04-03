const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const db = admin.firestore();

exports.clearParticipatingSubcollection = functions.pubsub
  .schedule("0 3 * * *") // Run every day at 3:00 AM Rome time
  .timeZone("Europe/Rome") // Set to Rome timezone
  .onRun(async (context) => {
    const meetUpPlacesRef = db.collection("meetUpPlaces");

    try {
      // Fetch all documents in the `meetUpPlaces` collection
      const snapshot = await meetUpPlacesRef.get();

      // For each document, get the subcollection `participatingMeetUpPlaces` and delete its documents
      const clearPromises = snapshot.docs.map(async (doc) => {
        const participatingSubcollectionRef = doc.ref.collection(
          "participatingMeetUpPlaces",
        );

        // Get all documents in the `participatingMeetUpPlaces` subcollection
        const participatingSnapshot = await participatingSubcollectionRef.get();

        // Delete each document in the subcollection
        const deletePromises = participatingSnapshot.docs.map((subDoc) =>
          subDoc.ref.delete(),
        );

        return Promise.all(deletePromises); // Wait for all deletions in this subcollection
      });

      // Wait for all clear operations across all `meetUpPlaces` documents
      await Promise.all(clearPromises);

      console.log(
        "Cleared all documents in `participatingMeetUpPlaces` subcollections.",
      );
    } catch (error) {
      console.error(
        "Error clearing `participatingMeetUpPlaces` subcollections: ",
        error,
      );
    }
  });
