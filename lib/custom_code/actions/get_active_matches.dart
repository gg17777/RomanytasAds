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

Future<List<MatchesRecord>> getActiveMatches(String userID) async {
  try {
    // Get a reference to Firestore
    final firestore = FirebaseFirestore.instance;

    // Get current timestamp
    final DateTime now = DateTime.now();

    // Query matches where the user is part of the "users" list
    final matchesQuery = await firestore
        .collection('matches')
        .where('users',
            arrayContains: firestore.collection('users').doc(userID))
        .get();

    print('active matches: $matchesQuery');

    // Filter matches where the event has not ended
    final activeMatches = matchesQuery.docs.where((doc) {
      final eventEndTime = (doc.data()['eventEndTime'] as Timestamp?)?.toDate();
      return eventEndTime != null && eventEndTime.isAfter(now);
    }).toList();

    var matches =
        activeMatches.map((e) => MatchesRecord.fromSnapshot(e)).toList();
    print('Error fetching active matches: $matches');
    return matches;
  } catch (e) {
    print('Error fetching active matches: $e');
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
