const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const cors = require("cors")({ origin: true }); // Import CORS package

exports.addUserToLikes = functions.https.onRequest(async (req, res) => {
  console.log("Function triggered."); // Entry log

  cors(req, res, async () => {
    console.log("CORS handled."); // Log after CORS

    // Only allow POST requests
    if (req.method !== "POST") {
      console.warn("Invalid method:", req.method);
      return res.status(405).send({ error: "Method Not Allowed" });
    }

    const { swiperID, swipedID, eventRef, eventName, eventEndTime } = req.body;
    console.log("Received data:", {
      swiperID,
      swipedID,
      eventRef,
      eventName,
      eventEndTime,
    });

    // Ensure all required data is provided
    if (!swiperID || !swipedID || !eventRef || !eventName || !eventEndTime) {
      console.error("Missing required data.");
      return res.status(400).send({ error: "Missing required data" });
    }

    try {
      const firestore = admin.firestore();
      console.log("Firestore initialized.");

      // Convert IDs to Firestore Document References
      const swiperRef = firestore.collection("users").doc(swiperID);
      const swipedRef = firestore.collection("users").doc(swipedID);
      const eventDocRef = firestore.collection("Eventi").doc(eventRef); // Assuming eventRef is like "events/eventID"
      const eventEndTimestamp = admin.firestore.Timestamp.fromDate(
        new Date(eventEndTime),
      );

      console.log("Document references created.", {
        swiperRef: swiperRef.path,
        swipedRef: swipedRef.path,
        eventDocRef: eventDocRef.path,
        date_time: eventEndTimestamp,
      });

      // Add swiped user to the current user's "likes" subcollection
      await swipedRef.collection("likes").add({
        eventID: eventDocRef, // Store as DocumentReference
        event_name: eventName,
        userRef: swiperRef, // Store swiper as DocumentReference
        date_time: eventEndTimestamp,
        created_time: admin.firestore.FieldValue.serverTimestamp(),
        viewed: false,
      });

      console.log("Swiped user added to likes successfully.");
      return res.status(200).send({ success: true });
    } catch (error) {
      console.error("Error adding user to likes:", error);
      return res.status(500).send({ error: "Error adding user to likes" });
    }
  });
});
