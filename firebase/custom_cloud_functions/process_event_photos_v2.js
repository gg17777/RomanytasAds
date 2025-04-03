const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const AWS = require("aws-sdk");
const axios = require("axios");

// Initialize AWS Rekognition
const rekognition = new AWS.Rekognition({
  region: "us-west-2", // Replace with your desired region
  accessKeyId: "AKIAYOHUDJTYFNV7QZE3",
  secretAccessKey: "sBRlcshkOjZ6r3oTOU7GcO+4Z7PnvSMGnQt9zDmK",
});

const QUEUE_COLLECTION = "processing_queue";
const MAX_CONCURRENT_JOBS = 3; // Adjust as needed

// Download image as byte array
async function downloadImageAsBytes(imageUrl) {
  try {
    const response = await axios.get(imageUrl, { responseType: "arraybuffer" });
    if (!response.data || response.data.length === 0) {
      throw new Error("Image data is empty.");
    }
    return Buffer.from(response.data, "binary");
  } catch (error) {
    console.error("Error downloading image:", error.message);
    throw new Error("Failed to fetch image: " + imageUrl);
  }
}

// Detect faces in an image
async function detectFaces(imageBytes) {
  const params = { Image: { Bytes: imageBytes }, Attributes: ["DEFAULT"] };
  try {
    const response = await rekognition.detectFaces(params).promise();
    return response.FaceDetails;
  } catch (error) {
    console.error("Error detecting faces:", error);
    throw error;
  }
}

// Compare two faces
async function compareFaces(sourceImageBytes, targetImageBytes) {
  const params = {
    SourceImage: { Bytes: sourceImageBytes },
    TargetImage: { Bytes: targetImageBytes },
    SimilarityThreshold: 70,
  };
  try {
    const response = await rekognition.compareFaces(params).promise();
    return response.FaceMatches;
  } catch (error) {
    console.error("Error comparing faces:", error);
    throw error;
  }
}

// Add image to queue
async function addToQueue(eventId, photoId, imageUrl) {
  const queueRef = admin
    .firestore()
    .collection(QUEUE_COLLECTION)
    .doc(`${eventId}_${photoId}`);
  await queueRef.set({
    eventId,
    photoId,
    imageUrl,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    processing: false,
  });
}

// Get next unprocessed queue item
async function getNextQueueItem() {
  const queueRef = admin
    .firestore()
    .collection(QUEUE_COLLECTION)
    .where("processing", "==", false)
    .orderBy("createdAt")
    .limit(1);

  const snapshot = await queueRef.get();
  if (!snapshot.empty) {
    return snapshot.docs[0];
  }
  return null;
}

exports.processEventPhotosV2 = functions
  .runWith({ timeoutSeconds: 540, memory: "2GB" })
  .firestore.document("Eventi/{eventId}/photos_event/{photoId}")
  .onCreate(async (snapshot, context) => {
    const { eventId, photoId } = context.params;
    const photoData = snapshot.data();
    const imageUrl = photoData.image;

    if (!imageUrl) {
      console.warn(`No image URL found for photo ${photoId}`);
      return;
    }

    // Add to queue
    await addToQueue(eventId, photoId, imageUrl);

    // Check active jobs
    const activeJobsSnapshot = await admin
      .firestore()
      .collection(QUEUE_COLLECTION)
      .where("processing", "==", true)
      .get();
    if (activeJobsSnapshot.size >= MAX_CONCURRENT_JOBS) {
      console.log(`Max concurrent jobs reached. Queueing ${photoId}`);
      return;
    }

    // Start processing queue
    await processNextInQueue();
  });

// Process the next queued image
async function processNextInQueue() {
  const queueItem = await getNextQueueItem();
  if (!queueItem) {
    console.log("No more images in queue");
    return;
  }

  const { eventId, photoId, imageUrl } = queueItem.data();
  const queueDocRef = admin
    .firestore()
    .collection(QUEUE_COLLECTION)
    .doc(queueItem.id);

  // Mark as processing to prevent duplicate work
  await queueDocRef.update({ processing: true });

  try {
    // Fetch event participants
    const participantsSnapshot = await admin
      .firestore()
      .collection(`Eventi/${eventId}/eventiParticiapting`)
      .get();

    if (participantsSnapshot.empty) {
      console.warn(`No participants found for event ${eventId}`);
      return;
    }

    const participants = participantsSnapshot.docs.map((doc) => doc.data());

    // Download event photo
    const eventPhotoBytes = await downloadImageAsBytes(imageUrl);

    // Detect faces in the event photo
    const detectedFaces = await detectFaces(eventPhotoBytes);

    if (detectedFaces.length === 0) {
      console.log(`No faces detected in photo ${photoId}`);
      return;
    }

    const foundUsers = [];
    const usersToNotify = [];

    for (const participant of participants) {
      if (!participant.photo_url) continue;

      // Download participant's profile photo
      const participantPhotoBytes = await downloadImageAsBytes(
        participant.photo_url,
      );

      // 🔍 Detect face in participant's profile photo first
      const participantFaces = await detectFaces(participantPhotoBytes);
      if (participantFaces.length === 0) {
        console.warn(
          `No face detected in participant ${participant.userParticipatingEventRef}  profile photo: ${participant.photo_url}`,
        );
        continue; // Skip this participant
      }

      // Compare detected faces
      for (const faceDetail of detectedFaces) {
        const faceMatches = await compareFaces(
          participantPhotoBytes,
          eventPhotoBytes,
        );
        if (faceMatches.length > 0) {
          const userRef = participant.userParticipatingEventRef;
          foundUsers.push(userRef);

          if (participant.feature_photo_ai !== false) {
            usersToNotify.push(userRef.path);
          }
          break; // Move to the next participant
        }
      }
    }

    // Update Firestore
    await admin
      .firestore()
      .doc(`Eventi/${eventId}/photos_event/${photoId}`)
      .update({
        users_in_photos: foundUsers,
        created_time: admin.firestore.FieldValue.serverTimestamp(),
      });

    // Send notifications
    if (usersToNotify.length > 0) {
      await admin
        .firestore()
        .collection("ff_push_notifications")
        .add({
          initial_page_name: "myPhotos",
          notification_sound: "default",
          notification_title: "📸 Nuova foto disponibile!",
          notification_text: "C’è una nuova foto della tua ultima serata!",
          num_sent: "0",
          user_refs: usersToNotify.join(","),
          target_audience: "All",
          parameter_data: JSON.stringify({ eventId: eventId }),
          status: "started",
          timestamp: admin.firestore.FieldValue.serverTimestamp(),
        });
    }
    console.log(`Successfully processed photo ${photoId} for event ${eventId}`);
  } catch (error) {
    console.error(`Error processing photo ${photoId}:`, error);
  } finally {
    // Delete processed queue item
    await queueDocRef.delete();
    // Clone the next photo to photos_event to trigger a new function instance
    // Get the next photo in the queue
    const nextItem = await getNextQueueItem();
    if (nextItem) {
      const nextData = nextItem.data();
      const newDocRef = admin
        .firestore()
        .doc(`Eventi/${nextData.eventId}/photos_event/${nextData.photoId}`);

      // Ensure the document is fully deleted before recreating
      await newDocRef
        .delete()
        .catch(() =>
          console.log(`No existing doc to delete for ${nextData.photoId}`),
        );

      // Recreate the document with minimal fields to trigger onCreate
      await newDocRef.set({ image: nextData.imageUrl });

      console.log(`Recreated ${nextData.photoId} to trigger new instance.`);
    }
  }
}
