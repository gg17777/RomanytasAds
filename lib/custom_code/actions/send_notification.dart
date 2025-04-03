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

Future sendNotification(
    String? userId,
    String? notificationTitle,
    String? notificationText,
    String? initialPageName,
    String? senderId,
    String? notificationImageUrl,
    String? notificationSound,
    dynamic parameterData,
    List<DocumentReference> recipients) async {
  try {
    if (notificationSound == null) notificationSound = 'default';
    if (notificationImageUrl == null) notificationImageUrl = '';

    // Reference to Firestore collection
    final notificationsCollection =
        FirebaseFirestore.instance.collection('ff_user_push_notifications');

    // Create the document data
    Map<String, dynamic> notificationData = {
      'initial_page_name': initialPageName,
      'notification_image_url': notificationImageUrl,
      'notification_sound': notificationSound,
      'notification_text': notificationText,
      'notification_title': notificationTitle,
      'num_sent': 1,
      'parameter_data': parameterData != null ? parameterData : {},
      'sender': '/Users/$senderId',
      'status': 'success',
      'timestamp': FieldValue.serverTimestamp(),
      'user_refs': '/Users/$userId',
    };

    // Add the document to Firestore
    await notificationsCollection.add(notificationData);

    print('Notification sent successfully!');
  } catch (e) {
    print('Failed to send notification: $e');
  }
}
