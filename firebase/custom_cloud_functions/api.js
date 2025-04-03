const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const db = admin.firestore();
const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors({ origin: true }));

app.post("/addFriend", async (req, res) => {
  try {
    const { userId, friendId } = req.body;
    if (!userId || !friendId) {
      return res.status(400).json({ error: "Missing userId or friendId" });
    }

    const userRef = db.collection("users").doc(userId);
    const friendRef = db.collection("users").doc(friendId);

    await db.runTransaction(async (transaction) => {
      const userDoc = await transaction.get(userRef);
      const friendDoc = await transaction.get(friendRef);

      if (!userDoc.exists || !friendDoc.exists) {
        throw new Error("User or Friend not found.");
      }

      const userFriends = new Set(userDoc.data().friends || []);
      const friendFriends = new Set(friendDoc.data().friends || []);

      userFriends.add(friendId);
      friendFriends.add(userId);

      transaction.update(userRef, { friends: Array.from(userFriends) });
      transaction.update(friendRef, { friends: Array.from(friendFriends) });
    });

    res.status(200).json({ message: "Friend added successfully." });
  } catch (error) {
    console.error("Error adding friend:", error);
    res.status(500).json({ error: error.message });
  }
});

app.post("/removeFriend", async (req, res) => {
  try {
    const { userId, friendId } = req.body;
    if (!userId || !friendId) {
      return res.status(400).json({ error: "Missing userId or friendId" });
    }

    const userRef = db.collection("users").doc(userId);
    const friendRef = db.collection("users").doc(friendId);

    await db.runTransaction(async (transaction) => {
      const userDoc = await transaction.get(userRef);
      const friendDoc = await transaction.get(friendRef);

      if (!userDoc.exists || !friendDoc.exists) {
        throw new Error("User or Friend not found.");
      }

      const userFriends = new Set(userDoc.data().friends || []);
      const friendFriends = new Set(friendDoc.data().friends || []);

      userFriends.delete(friendId);
      friendFriends.delete(userId);

      transaction.update(userRef, { friends: Array.from(userFriends) });
      transaction.update(friendRef, { friends: Array.from(friendFriends) });
    });

    res.status(200).json({ message: "Friend removed successfully." });
  } catch (error) {
    console.error("Error removing friend:", error);
    res.status(500).json({ error: error.message });
  }
});

app.get("/commonFriends", async (req, res) => {
  try {
    const { userId, otherUserId } = req.query;
    if (!userId || !otherUserId) {
      return res.status(400).json({ error: "Missing userId or otherUserId" });
    }

    const userDoc = await db.collection("users").doc(userId).get();
    const otherUserDoc = await db.collection("users").doc(otherUserId).get();

    if (!userDoc.exists || !otherUserDoc.exists) {
      return res.status(404).json({ error: "User not found" });
    }

    const userFriends = new Set(userDoc.data().friends || []);
    const otherUserFriends = new Set(otherUserDoc.data().friends || []);

    const commonFriends = [...userFriends].filter((friend) =>
      otherUserFriends.has(friend),
    );

    res.status(200).json({ commonFriends });
  } catch (error) {
    console.error("Error getting common friends:", error);
    res.status(500).json({ error: error.message });
  }
});

app.get("/friendSuggestions", async (req, res) => {
  try {
    const userId = req.query.userId;
    if (!userId) {
      return res.status(400).json({ error: "Missing userId parameter" });
    }

    const userDoc = await db.collection("users").doc(userId).get();
    if (!userDoc.exists) {
      return res.status(404).json({ error: "User not found" });
    }

    const userData = userDoc.data();
    const userFriends = new Set(userData.friends || []);
    const userUni = userData.uni;
    const didntLikeSuggestions = new Set(userData.didntLikeSuggestions || []);

    let suggestedFriends = new Map(); // { userId: mutualFriendsCount }

    if (userFriends.size > 0) {
      // Batch fetch all friend documents
      const friendsDocs = await db
        .collection("users")
        .where("__name__", "in", Array.from(userFriends))
        .get();

      friendsDocs.forEach((friendDoc) => {
        const friendFriends = friendDoc.data().friends || [];
        friendFriends.forEach((friendOfFriendId) => {
          if (
            friendOfFriendId !== userId &&
            !userFriends.has(friendOfFriendId) &&
            !didntLikeSuggestions.has(friendOfFriendId)
          ) {
            suggestedFriends.set(
              friendOfFriendId,
              (suggestedFriends.get(friendOfFriendId) || 0) + 1,
            );
          }
        });
      });
    }

    // Filter users who have at least 2 mutual friends
    let finalSuggestions = [...suggestedFriends.entries()]
      .filter(([_, count]) => count >= 2)
      .sort((a, b) => b[1] - a[1]) // Sort by mutual friends count (descending)
      .map(([userId]) => userId);

    // If no users with at least 2 mutual friends, fallback to university-based suggestions
    if (finalSuggestions.length === 0 && userUni) {
      const uniUsersSnapshot = await db
        .collection("users")
        .where("uni", "==", userUni)
        .get();

      finalSuggestions = uniUsersSnapshot.docs
        .map((doc) => doc.id)
        .filter(
          (uniUserId) =>
            uniUserId !== userId &&
            !userFriends.has(uniUserId) &&
            !didntLikeSuggestions.has(uniUserId),
        );

      // Shuffle university-based suggestions
      finalSuggestions.sort(() => Math.random() - 0.5);
    }

    return res.status(200).json({ suggestedFriends: finalSuggestions });
  } catch (error) {
    console.error("Error fetching friend suggestions:", error);
    return res.status(500).json({ error: "Internal Server Error" });
  }
});

exports.api = functions.https.onRequest(app);
