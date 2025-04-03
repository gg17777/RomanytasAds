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

import 'package:fast_contacts/fast_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> _requestContactPermission() async {
  var status = await Permission.contacts.status;
  if (status.isGranted) {
    return true;
  } else if (status.isDenied || status.isPermanentlyDenied) {
    // Show a dialog or message if needed
    status = await Permission.contacts.request();
    return status.isGranted;
  }
  return false;
}

// Method to get contacts and filter users by partial phone number match
Future<List<UsersRecord>> fetchContacts() async {
  var db = FirebaseFirestore.instance;
  bool isGranted = await _requestContactPermission();

  if (isGranted) {
    try {
      // Step 1: Retrieve contact numbers from phone contacts
      var contacts = await FastContacts.getAllContacts();

      // Step 2: Normalize contact numbers
      var allNumbers = contacts
          .where((contact) => contact.phones.isNotEmpty)
          .map((contact) => normalizePhoneNumber(contact.phones.first.number))
          .where((number) => number.isNotEmpty) // Remove empty results
          .toList();

      // Step 3: Retrieve all users from Firestore
      var usersQuery = await db.collection("users").get();
      List<UsersRecord> matchedUsers = [];

      // Step 4: Filter users by checking if any normalized contact number
      // is a substring of the normalized user's phone number
      for (var doc in usersQuery.docs) {
        var userRecord = UsersRecord.fromSnapshot(doc);
        var userPhone = normalizePhoneNumber(userRecord.phoneNumber);

        bool hasMatchingContact = allNumbers.any((contactNumber) {
          // Check if contact number matches a portion of the user phone
          return (userPhone == contactNumber) &&
              FirebaseAuth.instance.currentUser?.uid != userRecord.uid;
        });

        if (hasMatchingContact) {
          matchedUsers.add(userRecord);
        }
      }

      return matchedUsers;
    } catch (e) {
      print("Error fetching contacts: $e");
      return [];
    }
  } else {
    print("Contact permission denied");
    return [];
  }
}

// Helper function to normalize phone numbers
String normalizePhoneNumber(String phoneNumber) {
  // Remove all non-numeric characters
  String normalized = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Remove leading zeros (if any) and country code indicators
  if (normalized.startsWith("0")) {
    normalized = normalized.replaceFirst(RegExp(r'^0+'), '');
  }

  // Normalize common country codes (example: +39 for the Rome, etc.)
  if (normalized.startsWith("39") && normalized.length > 10) {
    normalized = normalized.substring(2); // Remove US country code
  }

  return normalized;
}
