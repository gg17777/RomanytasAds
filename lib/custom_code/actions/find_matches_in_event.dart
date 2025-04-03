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

Future<List<DocumentReference>> findMatchesInEvent(
  String eventID,
  String currentUserID,
) async {
  try {
    // Get a reference to Firestore
    final firestore = FirebaseFirestore.instance;

    // Step 1: Get all users that the current user has swiped on in this event
    final userSwipedQuery = await firestore
        .collection('Eventi')
        .doc(eventID)
        .collection('swipeActions')
        .where('swiperID', isEqualTo: currentUserID)
        .get();

    // Extract swiped users (as DocumentReferences)
    final Set<DocumentReference> usersSwipedOn = userSwipedQuery.docs
        .map((doc) => doc.data()['swipedID'] as DocumentReference)
        .toSet();

    // Step 2: Find where currentUserID appears as swipedID in this event
    final userWasSwipedQuery = await firestore
        .collection('Eventi')
        .doc(eventID)
        .collection('swipeActions')
        .where('swipedID',
            isEqualTo: firestore.collection('Users').doc(currentUserID))
        .get();

    // Extract users who swiped on the current user
    final Set<String> usersWhoSwipedOnUser = userWasSwipedQuery.docs
        .map((doc) => doc.data()['swiperID'] as String)
        .toSet();

    // Step 3: Find mutual matches (both swiped on each other)
    final List<DocumentReference> matches = usersSwipedOn.where((userRef) {
      return usersWhoSwipedOnUser
          .contains(userRef.id); // Check if the user also swiped back
    }).toList();

    return matches;
  } catch (e) {
    print('Error finding matches in event $eventID: $e');
    return [];
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
