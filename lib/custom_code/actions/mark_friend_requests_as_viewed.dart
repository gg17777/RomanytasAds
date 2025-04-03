// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future markFriendRequestsAsViewed() async {
  var user = FirebaseAuth.instance.currentUser?.uid;
  var db = FirebaseFirestore.instance;

  if (user != null) {
    var userRef = db.collection("users").doc(user);
    var friendRequests = await db
        .collection("friendsRequest")
        .where("Requestee", isEqualTo: userRef)
        .get();
    for (var doc in friendRequests.docs) {
      await doc.reference.update({"viewed": true});
    }
  }
}
