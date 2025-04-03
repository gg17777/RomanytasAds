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

Future<bool> hasUserLikedEvent(
    DocumentReference eventRef, String swipedID) async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query the swiped user's "likes" subcollection for any like under this event
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('users')
        .doc(swipedID) // Swiped user's likes collection
        .collection('likes')
        .where('eventID', isEqualTo: eventRef) // Check if this event exists
        .limit(1) // Optimize query
        .get();

    // If at least one like exists under this event, return true
    return querySnapshot.docs.isNotEmpty;
  } catch (error) {
    print("Error checking if user has been liked in event: $error");
    return false; // Assume no likes in case of an error
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
