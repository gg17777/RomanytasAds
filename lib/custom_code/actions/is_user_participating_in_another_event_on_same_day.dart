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

Future<IsParticipatingStruct> isUserParticipatingInAnotherEventOnSameDay(
    DocumentReference userRef, EventiRecord newEvent) async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Extract new event date
    final DateTime? newEventDate = newEvent.data;
    if (newEventDate == null)
      return IsParticipatingStruct(
        isPart: false,
      );
    ; // If no date, no conflict

    // Query events where the user is participating
    final QuerySnapshot<Map<String, dynamic>> userEventsSnapshot =
        await firestore
            .collectionGroup('eventiParticiapting') // Get from all events
            .where('userParticipatingEventRef', isEqualTo: userRef)
            .get();

    for (var participationDoc in userEventsSnapshot.docs) {
      final eventDocRef =
          participationDoc.reference.parent.parent; // Get event doc ref

      if (eventDocRef == null) continue;

      final eventDoc = await eventDocRef.get();
      final eventData = eventDoc.data();

      if (eventData == null) continue; // Skip if no data

      // Extract existing event date
      final DateTime? eventDate =
          (eventData['Data'] as Timestamp?)?.toDate(); // Existing event date

      if (eventDate == null) continue;

      // Convert both dates to YYYY-MM-DD format for comparison
      final String formattedExistingEventDate =
          "${eventDate.year}-${eventDate.month}-${eventDate.day}";
      final String formattedNewEventDate =
          "${newEventDate.year}-${newEventDate.month}-${newEventDate.day}";

      // If the event has the same date, block participation
      if (formattedExistingEventDate == formattedNewEventDate) {
        return IsParticipatingStruct(isPart: true, event: eventDocRef);
      }
    }

    return IsParticipatingStruct(
      isPart: false,
    );
  } catch (error) {
    print("Error checking event participation conflict: $error");
    return IsParticipatingStruct(
      isPart: false,
    );
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
