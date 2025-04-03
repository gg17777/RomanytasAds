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

Future<void> markAllMatchesAsViewed(String userID) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // Get the user reference
    final DocumentReference userRef = firestore.collection('users').doc(userID);

    // Reference to the "matches" collection
    final matchesRef = firestore.collection('matches');

    // Fetch all matches where the user is involved
    final matchesQuery = await matchesRef
        .where('users',
            arrayContains: userRef) // Check if user is in 'users' list
        .get();

    // Batch update to add the userRef to the "viewedBy" list
    final batch = firestore.batch();
    for (final doc in matchesQuery.docs) {
      final List<dynamic> viewedByList = doc.data()['viewedBy'] ?? [];

      // Ensure viewedByList contains only DocumentReferences
      final List<DocumentReference> viewedByRefs = viewedByList
          .whereType<DocumentReference>() // Filter to keep only references
          .toList();

      // Check if the userRef is already in the list
      if (!viewedByRefs.contains(userRef)) {
        viewedByRefs.add(userRef);
        batch.update(doc.reference, {'viewedBy': viewedByRefs});
      }
    }

    await batch.commit();
    print('All matches marked as viewed successfully.');
  } catch (e) {
    print('Error marking matches as viewed: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
