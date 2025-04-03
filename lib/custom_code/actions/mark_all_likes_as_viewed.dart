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

Future<void> markAllLikesAsViewed(String userID) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // Reference to the user's "likes" subcollection
    final likesRef =
        firestore.collection('users').doc(userID).collection('likes');

    // Fetch all unviewed likes
    final likesQuery = await likesRef.where('viewed', isEqualTo: false).get();

    // Batch update to mark all as viewed
    final batch = firestore.batch();
    for (final doc in likesQuery.docs) {
      batch.update(doc.reference, {'viewed': true});
    }

    await batch.commit();
    print('All likes marked as viewed successfully.');
  } catch (e) {
    print('Error marking likes as viewed: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
