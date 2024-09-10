const admin = require("firebase-admin/app");
admin.initializeApp();

const incrementViews = require("./increment_views.js");
exports.incrementViews = incrementViews.incrementViews;
