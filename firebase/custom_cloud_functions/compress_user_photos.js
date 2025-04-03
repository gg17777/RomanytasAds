const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const { Storage } = require("@google-cloud/storage");
const sharp = require("sharp");
const path = require("path");
const os = require("os");
const fs = require("fs");

const storage = new Storage();
const db = admin.firestore();

const { URL } = require("url");

function getFilePathFromUrl(photoUrl, bucketName) {
  try {
    const url = new URL(photoUrl);
    const pathname = decodeURIComponent(url.pathname);
    const filePath = pathname.replace(`/v0/b/${bucketName}/o/`, "");
    return filePath;
  } catch (error) {
    console.error("⚠️ Invalid photo URL:", photoUrl, error);
    return null;
  }
}

exports.compressUserPhotos = functions
  .runWith({ memory: "2GB", timeoutSeconds: 540 }) // Increase memory & timeout
  .pubsub.schedule("every 24 hours")
  .onRun(async () => {
    console.log("🚀 Starting batch compression of user photos...");

    try {
      const batchSize = 50; // Number of users per batch
      let lastDoc = null;

      do {
        let query = db
          .collection("users")
          .orderBy("photo_url")
          .limit(batchSize);
        if (lastDoc) query = query.startAfter(lastDoc);

        const snapshot = await query.get();
        if (snapshot.empty) break;

        lastDoc = snapshot.docs[snapshot.docs.length - 1]; // Save last document for pagination

        // Process images in parallel
        await Promise.all(
          snapshot.docs.map(async (doc) => {
            const userData = doc.data();
            if (!userData.photo_url)
              return console.log(`⚠️ No photo for user ${doc.id}`);

            const bucketName = "romanita-5nlemi.appspot.com";
            const filePath = getFilePathFromUrl(userData.photo_url, bucketName);
            if (!filePath)
              return console.log(`⚠️ Invalid URL for user ${doc.id}`);

            const bucket = storage.bucket(bucketName);
            const file = bucket.file(filePath);
            try {
              const [metadata] = await file.getMetadata();
              if (metadata.metadata?.compressed === "true")
                return console.log(`✅ ${filePath} already compressed`);

              const tempFilePath = path.join(
                os.tmpdir(),
                path.basename(filePath),
              );
              const compressedFilePath = path.join(
                os.tmpdir(),
                `compressed_${path.basename(filePath)}`,
              );

              await file.download({ destination: tempFilePath });
              await sharp(tempFilePath)
                .resize({ width: 1024 })
                .jpeg({ quality: 75 })
                .toFile(compressedFilePath);

              await bucket.upload(compressedFilePath, {
                destination: filePath,
                metadata: {
                  contentType: "image/jpeg",
                  metadata: { compressed: "true" },
                },
              });

              console.log(`✅ Compressed & updated ${filePath}`);

              fs.unlinkSync(tempFilePath);
              fs.unlinkSync(compressedFilePath);
            } catch (error) {
              console.error(`❌ Failed to process ${filePath}:`, error);
            }
          }),
        );
      } while (lastDoc); // Continue until all users are processed

      console.log("🎉 Completed compression for all users.");
    } catch (error) {
      console.error("❌ Error in batch compression:", error);
    }

    return null;
  });
