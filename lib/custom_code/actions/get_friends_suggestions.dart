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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

const String cloudFunctionUrl =
    "https://us-central1-romanita-5nlemi.cloudfunctions.net/api/friendSuggestions";

Future<List<UsersRecord>> getFriendsSuggestions(String userId) async {
  try {
    final Uri uri = Uri.parse("$cloudFunctionUrl?userId=$userId");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> uids = jsonDecode(response.body)['suggestedFriends'];

      if (uids.isEmpty) return [];

      final usersQuery = await FirebaseFirestore.instance
          .collection("users")
          .where("uid", whereIn: uids)
          .get();

      return usersQuery.docs
          .map((doc) => UsersRecord.fromSnapshot(doc))
          .toList();
    } else {
      print("Error fetching friend suggestions: ${response.body}");
      return [];
    }
  } catch (e) {
    print("Error in getFriendSuggestions: $e");
    return [];
  }
}
