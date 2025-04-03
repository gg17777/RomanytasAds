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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> swipeUser(
  String eventID,
  String swiperID,
  DocumentReference swipedID,
  String swipeDirection,
) async {
  try {
    // Get a reference to Firestore
    final firestore = FirebaseFirestore.instance;

    // Reference to the event document
    final eventRef = firestore.collection('Eventi').doc(eventID);

    // Step 1: Log the swipe action
    await eventRef.collection('swipeActions').add({
      'swiperID': swiperID,
      'swipedID': swipedID,
      'swipeDirection': swipeDirection,
      'timestamp': FieldValue.serverTimestamp(),
    });

    print('Swipe action logged successfully');

    // Fetch event details
    final eventSnapshot = await eventRef.get();
    final eventData = eventSnapshot.data();

    if (eventData == null) {
      print('Event data not found');
      return false;
    }

    final String eventName = eventData['Titolo'] ?? 'Unknown Event';

    // Extract date and time separately
    final DateTime? eventDate = (eventData['Data'] as Timestamp?)?.toDate();
    final DateTime? eventTime =
        (eventData['fineOrario'] as Timestamp?)?.toDate();

    DateTime? eventEndTime;
    if (eventDate != null && eventTime != null) {
      // Merge Date and Time into a single DateTime
      eventEndTime = DateTime(
        eventDate.year,
        eventDate.month,
        eventDate.day,
        eventTime.hour,
        eventTime.minute,
        eventTime.second,
      );

      // Adjust eventEndTime if it finishes between 00:00 and 07:59
      if (eventEndTime.hour >= 0 && eventEndTime.hour < 8) {
        eventEndTime = eventEndTime.add(Duration(days: 1));
      }
    }

    if (swipeDirection.toLowerCase() == 'right') {
      // Step 3: Check if this swipe creates a match
      final matchQuery = await eventRef
          .collection('swipeActions')
          .where('swiperID',
              isEqualTo: swipedID.id) // Swiped user was the swiper
          .where('swipedID',
              isEqualTo: firestore
                  .collection('users')
                  .doc(swiperID)) // Swiper was swiped
          .where('swipeDirection', isEqualTo: 'right') // Must be a right swipe
          .get();

      if (matchQuery.docs.isNotEmpty) {
        // A match is found
        // Step 4: Create a match document
        await firestore.collection('matches').add({
          'users': [
            firestore.collection('users').doc(swiperID),
            swipedID
          ], // List of user refs
          'eventID': eventID,
          'eventName': eventName,
          'eventEndTime': eventEndTime,
          'timestamp': FieldValue.serverTimestamp(),
        });

        print(
            'Match created successfully between $swiperID and ${swipedID.id}');
        return true; // Return true if match found
      } else {
        try {
          // Cloud Function URL (replace with your actual URL)
          const String cloudFunctionUrl =
              "https://us-central1-romanita-5nlemi.cloudfunctions.net/addUserToLikes";

          // Make HTTP POST request
          final response = await http.post(
            Uri.parse(cloudFunctionUrl),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "swiperID": swiperID,
              "swipedID": swipedID.id,
              "eventRef": eventID,
              "eventName": eventName,
              "eventEndTime": eventEndTime?.toIso8601String(),
            }),
          );

          // Handle response
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          if (response.statusCode == 200 && responseData['success'] == true) {
            print('Swiped user added to likes successfully');
          } else {
            throw Exception(responseData['error'] ?? 'Unknown error occurred.');
          }
        } catch (error) {
          print("Error adding user to likes: $error");
        }
      }
    }

    return false; // No match found
  } catch (e) {
    print('Error logging swipe action: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
