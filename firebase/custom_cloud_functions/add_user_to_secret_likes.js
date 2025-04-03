const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const cors = require("cors")({ origin: true }); // Import CORS package

exports.addUserToSecretLikes = functions.https.onRequest(async (req, res) => {
  console.log("Function triggered.");

  cors(req, res, async () => {
    console.log("CORS handled.");

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

    if (!swiperID || !swipedID || !eventRef || !eventName || !eventEndTime) {
      console.error("Missing required data.");
      return res.status(400).send({ error: "Missing required data" });
    }

    try {
      const firestore = admin.firestore();
      console.log("Firestore initialized.");

      const swiperRef = firestore.collection("users").doc(swiperID);
      const swipedRef = firestore.collection("users").doc(swipedID);
      const eventDocRef = firestore.collection("secret_parties").doc(eventRef);
      const eventEndTimestamp = admin.firestore.Timestamp.fromDate(
        new Date(eventEndTime),
      );

      console.log("Document references created.", {
        swiperRef: swiperRef.path,
        swipedRef: swipedRef.path,
        eventDocRef: eventDocRef.path,
        date_time: eventEndTimestamp,
      });

      await swipedRef.collection("likes").add({
        eventID: eventDocRef,
        event_name: eventName,
        userRef: swiperRef,
        date_time: eventEndTimestamp,
        created_time: admin.firestore.FieldValue.serverTimestamp(),
        viewed: false,
      });

      console.log("Swiped user added to secret likes successfully.");
      return res.status(200).send({ success: true });
    } catch (error) {
      console.error("Error adding user to secret likes:", error);
      return res
        .status(500)
        .send({ error: "Error adding user to secret likes" });
    }
  });
});
