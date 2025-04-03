const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const { Storage } = require("@google-cloud/storage");
const sharp = require("sharp");
const path = require("path");
const os = require("os");
const fs = require("fs");

const storage = new Storage();

exports.compressImage = functions.storage
  .object()
  .onFinalize(async (object) => {
    const bucket = storage.bucket(object.bucket);
    const filePath = object.name;
    const contentType = object.contentType;

    // Ignore non-images
    if (!contentType || !contentType.startsWith("image/")) {
      console.log("❌ Not an image file. Skipping...");
      return null;
    }

    // Prevent reprocessing the already compressed file
    if (object.metadata?.compressed === "true") {
      console.log("⚠️ Already compressed. Skipping...");
      return null;
    }

    const fileName = path.basename(filePath);
    const tempFilePath = path.join(os.tmpdir(), fileName);
    const compressedFilePath = path.join(os.tmpdir(), `compressed_${fileName}`);

    // Download image
    await bucket.file(filePath).download({ destination: tempFilePath });
    console.log(`✅ Downloaded ${fileName}`);

    // Get initial file size
    const initialSize = fs.statSync(tempFilePath).size;
    console.log(`📏 Initial file size: ${(initialSize / 1024).toFixed(2)} KB`);

    // // Compress image using sharp
    // await sharp(tempFilePath)
    //   .resize({ width: 1024 }) // Resize width (optional)
    //   .jpeg({ quality: 75 }) // Adjust compression level
    //   .toFile(compressedFilePath);
    await sharp(tempFilePath)
      .rotate()
      .resize({ width: 1024 })
      .jpeg({ quality: 75 })
      .withMetadata() // Preserve metadata
      .toFile(compressedFilePath);

    console.log(`✅ Compressed image saved`);

    // Get final file size
    const finalSize = fs.statSync(compressedFilePath).size;
    console.log(`📉 Final file size: ${(finalSize / 1024).toFixed(2)} KB`);

    // Upload and overwrite the original image
    await bucket.upload(compressedFilePath, {
      destination: filePath, // Overwrite original file
      metadata: {
        contentType: "image/jpeg",
        metadata: {
          compressed: "true", // Prevent reprocessing
          firebaseStorageDownloadTokens:
            object.metadata?.firebaseStorageDownloadTokens ||
            "auto-generated-token",
        },
      },
    });

    console.log(`✅ Overwritten ${filePath} with compressed version`);

    // Clean up temporary files
    fs.unlinkSync(tempFilePath);
    fs.unlinkSync(compressedFilePath);

    return null;
  });
