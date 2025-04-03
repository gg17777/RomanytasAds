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

Future markAllBlinkAsViewed() async {
  try {
    var auth = FirebaseAuth.instance;
    // Get the current user reference
    final currentUserRef = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid);

    // Query the `blink` collection where `blinked` is equal to the current user reference
    final querySnapshot = await FirebaseFirestore.instance
        .collection('blink')
        .where('blinked', isEqualTo: currentUserRef)
        .get();

    // Loop through the documents and update the `viewed` field to true
    for (var doc in querySnapshot.docs) {
      await doc.reference.update({'viewed': true});
    }

    print('Successfully marked documents as viewed.');
  } catch (e) {
    print('Error updating documents: $e');
  }
}
