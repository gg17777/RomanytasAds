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

Future<List<ConcertiInEvidenzaRecord>> fetchVisibleEvents(String city) async {
  final now = DateTime.now();
  final todayStart = DateTime(now.year, now.month, now.day); // 12:00 AM today
  final yesterdayStart =
      todayStart.subtract(Duration(days: 1)); // 12:00 AM yesterday
  final todayCutoff = todayStart.add(Duration(hours: 3)); // 3:00 AM today
  try {
    // Fetch all events from the database
    final querySnapshot = await FirebaseFirestore.instance
        .collection('concertiInEvidenza')
        .where('city', isEqualTo: city)
        .orderBy('Data', descending: false)
        .get();

    // Filter events
    final visibleEvents = querySnapshot.docs.where((doc) {
      final eventDate = (doc['Data'] as Timestamp).toDate();

      // Include events from yesterday if now is before 3:00 AM today
      if ((eventDate.isAfter(yesterdayStart) ||
              eventDate.isAtSameMomentAs(yesterdayStart)) &&
          eventDate.isBefore(todayStart) &&
          now.isBefore(todayCutoff)) {
        return true;
      }

      // Include all events from 12:00 AM today onwards
      return eventDate.isAfter(todayStart) ||
          eventDate.isAtSameMomentAs(todayStart);
    }).toList();

    // Map filtered documents into your model
    final list = visibleEvents
        .map((e) => ConcertiInEvidenzaRecord.fromSnapshot(e))
        .toList();

    for (var doc in visibleEvents) {
      print(doc.data()); // Debug: Print the filtered data
    }

    return list;
  } catch (error) {
    print('Error fetching events: $error');
    return [];
  }
}
