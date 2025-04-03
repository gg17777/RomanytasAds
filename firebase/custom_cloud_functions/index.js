const admin = require("firebase-admin/app");
admin.initializeApp();

const incrementViews = require("./increment_views.js");
exports.incrementViews = incrementViews.incrementViews;
const clearParticipatingSubcollection = require("./clear_participating_subcollection.js");
exports.clearParticipatingSubcollection =
  clearParticipatingSubcollection.clearParticipatingSubcollection;
const blockUser = require("./block_user.js");
exports.blockUser = blockUser.blockUser;
const addUserToLikes = require("./add_user_to_likes.js");
exports.addUserToLikes = addUserToLikes.addUserToLikes;
const compressImage = require("./compress_image.js");
exports.compressImage = compressImage.compressImage;
const addUserToSecretLikes = require("./add_user_to_secret_likes.js");
exports.addUserToSecretLikes = addUserToSecretLikes.addUserToSecretLikes;
const compressUserPhotos = require("./compress_user_photos.js");
exports.compressUserPhotos = compressUserPhotos.compressUserPhotos;
const api = require("./api.js");
exports.api = api.api;
const migrateFriendsToNewStructure = require("./migrate_friends_to_new_structure.js");
exports.migrateFriendsToNewStructure =
  migrateFriendsToNewStructure.migrateFriendsToNewStructure;
const removeDuplicateFriends = require("./remove_duplicate_friends.js");
exports.removeDuplicateFriends = removeDuplicateFriends.removeDuplicateFriends;
const updateAppName = require("./update_app_name.js");
exports.updateAppName = updateAppName.updateAppName;
const processEventPhotosV2 = require("./process_event_photos_v2.js");
exports.processEventPhotosV2 = processEventPhotosV2.processEventPhotosV2;
