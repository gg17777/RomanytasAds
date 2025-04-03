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

import 'dart:math';

Future<List<SwipeStruct>> getUnswipedParticipants(
  String eventID,
  String currentUserID,
) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // Fetch current user document
    final currentUserDoc =
        await firestore.collection('users').doc(currentUserID).get();
    final currentUserData = currentUserDoc.data();
    final currentUserSex = currentUserData?['sex'] as String? ?? "";
    final currentUserMatchSex = currentUserData?['match_sex'] as String? ?? "";
    final List<dynamic> blockedUsers =
        (currentUserData?['blockedUsers'] as List<dynamic>?) ?? [];

    // Fetch IDs of users the current user has swiped for this event
    final swipeActionsQuery = await firestore
        .collection('Eventi')
        .doc(eventID)
        .collection('swipeActions')
        .where('swiperID', isEqualTo: currentUserID)
        .get();

    final swipedUserRefs = swipeActionsQuery.docs
        .map((doc) => doc.data()['swipedID'] as DocumentReference)
        .toList();

    // Fetch all participants in the event
    final participantsQuery = await firestore
        .collection('Eventi')
        .doc(eventID)
        .collection('eventiParticiapting')
        .get();

    List<SwipeStruct> participants = participantsQuery.docs.map((doc) {
      final data = doc.data();
      return SwipeStruct(
          userRef: data['userParticipatingEventRef'] as DocumentReference,
          sex: data['sex'] as String? ?? "",
          matchSex: data['match_sex'] as String? ?? "",
          privateAccount: data['private_account'] as bool? ?? false,
          noSwiping: data['no_swiping'] as bool? ?? false,
          matchesNotifications:
              (data["matches_notifications"] as bool?) ?? true,
          likesNotifications: (data["likes_notifications"] as bool?) ?? true);
    }).toList();

    // Randomize participants
    participants.shuffle(Random());

    // Fetch custom ads
    final adsQuery = await firestore.collection('custom_ads').get();
    final List<SwipeStruct> ads = adsQuery.docs.map((doc) {
      final data = doc.data();
      return SwipeStruct(
          userRef: null,
          isAd: true,
          adLink: data['adLink'] as String?,
          adImage: data['image'] as String?,
          city: data["city"] == null ? null : List<String>.from(data["city"]),
          adRef: doc.reference,
          headline: data["headline"] as String?,
          primaryText: data["primary_text"] as String?,
          clicks: data["clicks"] as int?,
          views: data["views"] as int?);
    }).toList();

    final String appStateCity =
        FFAppState().city; // Get the city from FlutterFlow AppState

    ads.removeWhere(
        (ad) => ad.city.isNotEmpty && !ad.city.contains(appStateCity));

    final List<SwipeStruct> result = [];
    final Random random = Random();
    int count = 0;

    for (final participant in participants) {
      if (participant.privateAccount || participant.noSwiping) continue;
      final bool isMatch = _matchesCriteria(
        currentUserSex,
        currentUserMatchSex,
        participant.sex,
        participant.matchSex,
      );

      if (!swipedUserRefs.contains(participant.userRef) &&
          participant.userRef?.id != currentUserID &&
          !blockedUsers.contains(participant.userRef?.id) &&
          isMatch) {
        result.add(participant);
        count++;

        // Insert a random ad every 5 users
        if (count % 5 == 0 && ads.isNotEmpty) {
          result.add(ads[random.nextInt(ads.length)]);
        }
      }
    }

    return result;
  } catch (e) {
    print('Error fetching unswiped participants: $e');
    return [];
  }
}

bool _matchesCriteria(
  String currentUserSex,
  String currentUserMatchSex,
  String participantSex,
  String participantMatchSex,
) {
  return (currentUserSex == "Uomo" &&
          currentUserMatchSex == "Donna" &&
          participantSex == "Donna" &&
          (participantMatchSex == "Uomo" ||
              participantMatchSex == "Entrambi")) ||
      (currentUserSex == "Donna" &&
          currentUserMatchSex == "Uomo" &&
          participantSex == "Uomo" &&
          (participantMatchSex == "Donna" ||
              participantMatchSex == "Entrambi")) ||
      (currentUserSex == "Uomo" &&
          currentUserMatchSex == "Uomo" &&
          participantSex == "Uomo" &&
          (participantMatchSex == "Uomo" ||
              participantMatchSex == "Entrambi")) ||
      (currentUserSex == "Donna" &&
          currentUserMatchSex == "Donna" &&
          participantSex == "Donna" &&
          (participantMatchSex == "Donna" ||
              participantMatchSex == "Entrambi")) ||
      (currentUserSex == "Uomo" &&
          currentUserMatchSex == "Entrambi" &&
          ((participantSex == "Uomo" &&
                  (participantMatchSex == "Uomo" ||
                      participantMatchSex == "Entrambi")) ||
              (participantSex == "Donna" &&
                  (participantMatchSex == "Uomo" ||
                      participantMatchSex == "Entrambi")))) ||
      (currentUserSex == "Donna" &&
          currentUserMatchSex == "Entrambi" &&
          ((participantSex == "Donna" &&
                  (participantMatchSex == "Donna" ||
                      participantMatchSex == "Entrambi")) ||
              (participantSex == "Uomo" &&
                  (participantMatchSex == "Donna" ||
                      participantMatchSex == "Entrambi")))) ||
      (currentUserSex == "Altro" && participantSex == "Altro");
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
