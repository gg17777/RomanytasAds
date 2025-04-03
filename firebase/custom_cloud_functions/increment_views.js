const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const cors = require("cors")({ origin: true });

exports.incrementViews = functions.https.onRequest((req, res) => {
  // Handle CORS preflight requests
  cors(req, res, () => {
    // Only allow POST requests
    if (req.method !== "POST") {
      return res.status(405).send("Method Not Allowed");
    }
    const { collectionId, docId } = req.body;

    // Validate input
    if (!collectionId || !docId) {
      return res.status(400).send("Invalid input");
    }

    // Check if the collection is one of the specified collections
    if (
      ["Eventi", "Serate", "Concerti", "Mostre", "concertiInEvidenza"].includes(
        collectionId,
      )
    ) {
      const docRef = admin.firestore().collection(collectionId).doc(docId);

      docRef
        .update({
          views: admin.firestore.FieldValue.increment(1),
        })
        .then(() => res.status(200).send("Views incremented successfully"))
        .catch((error) => {
          console.error("Error updating document", error);
          res.status(500).send("Error updating document");
        });
    } else {
      res.status(400).send("Collection not monitored");
    }
  });
});
