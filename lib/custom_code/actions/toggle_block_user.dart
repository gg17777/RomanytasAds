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
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> toggleBlockUser(String blockedUserId) async {
  try {
    // Get current user
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not authenticated.");

    // Get current user's UID
    String authUserId = user.uid;

    // Cloud Function URL (replace with your actual URL)
    const String cloudFunctionUrl =
        "https://us-central1-romanita-5nlemi.cloudfunctions.net/blockUser";

    // Make HTTP POST request
    final response = await http.post(
      Uri.parse(cloudFunctionUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "userId": authUserId, // Sending current user's ID in body
        "blockedUserId": blockedUserId,
      }),
    );

    // Handle response
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(responseData['message']); // "User successfully blocked/unblocked."
      return true;
    } else {
      throw Exception(responseData['error']);
    }
  } catch (error) {
    print("Error blocking/unblocking user: $error");
  }
  return false;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
