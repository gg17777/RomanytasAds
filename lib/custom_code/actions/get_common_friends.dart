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

const String cloudFunctionBaseUrl =
    "https://us-central1-romanita-5nlemi.cloudfunctions.net/api";

Future<List<String>> getCommonFriends(String userId, String otherUserId) async {
  final response = await http.get(
    Uri.parse(
        "$cloudFunctionBaseUrl/commonFriends?userId=$userId&otherUserId=$otherUserId"),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return List<String>.from(data['commonFriends']);
  } else {
    print("Error fetching common friends: ${response.body}");
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
