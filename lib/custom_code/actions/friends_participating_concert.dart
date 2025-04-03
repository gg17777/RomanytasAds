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

Future<List<DocumentReference>> friendsParticipatingConcert(
    DocumentReference concertRef) async {
  // Add your function code here!
  var user = FirebaseAuth.instance.currentUser;
  final peopleParticipating =
      await concertRef.collection("concertiParticipating").get();
  var myFriends = await FirebaseFirestore.instance
      .collection("Users")
      .doc(user?.uid)
      .collection("friends")
      .get();

  var peopleParticipatingParsed = peopleParticipating.docs.map((doc) {
    // Convert Firestore doc to EventiRecord
    return ConcertiParticipatingRecord.fromSnapshot(doc);
  }).toList();

  var myFriendsParsed = myFriends.docs.map((doc) {
    // Convert Firestore doc to EventiRecord
    return FriendsRecord.fromSnapshot(doc);
  }).toList();

  var participatingUserRefs = peopleParticipatingParsed
      .map((e) => e.participatingConcertiUserRef)
      .whereType<DocumentReference<Object?>>()
      .toList();

  var myFriendsRefs = myFriendsParsed
      .map((e) => e.userFriendRef)
      .whereType<DocumentReference<Object?>>()
      .toList();

  // Find intersection of non-null references
  List<DocumentReference<Object?>> friendsParticipatingRefs =
      participatingUserRefs
          .where((ref) => myFriendsRefs.contains(ref))
          .toList();

  return friendsParticipatingRefs;
}
