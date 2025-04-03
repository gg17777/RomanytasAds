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

import 'dart:math' as math;

Future<List<CustomMarkerStruct>> getFriendsMapData(
  int numberOfMarkersToReturn,
  LatLng currentLocation,
) async {
  // Add your function code here!
  /// MODIFY CODE ONLY BELOW THIS LINE

  List<CustomMarkerStruct> list = [];
  list.addAll(await getSerateAndEventiMarkers());
  double haversineDistance(LatLng point1, LatLng point2) {
    const R = 6371e3; // Earth radius in meters

    double toRadians(double degree) {
      return degree * math.pi / 180.0;
    }

    double dLat = toRadians(point2.latitude - point1.latitude);
    double dLon = toRadians(point2.longitude - point1.longitude);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(toRadians(point1.latitude)) *
            math.cos(toRadians(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    double distance = R * c; // Distance in meters

    return distance;
  }

  list.sort((a, b) {
    double distanceA =
        (a.position?.latitude != null && a.position?.longitude != null)
            ? haversineDistance(currentLocation,
                LatLng(a.position!.latitude, a.position!.longitude))
            : double.maxFinite;
    double distanceB =
        (b.position?.latitude != null && b.position?.longitude != null)
            ? haversineDistance(currentLocation,
                LatLng(b.position!.latitude, b.position!.longitude))
            : double.maxFinite;
    return distanceA.compareTo(distanceB);
  });

  var markers = list.toList();
  return markers.map((e) {
    return CustomMarkerStruct(
        id: e.id.toString(),
        position:
            getLatLng(e.position?.latitude ?? 0, e.position?.longitude ?? 0),
        type: e.type);
  }).toList();
}

Future<List<CustomMarkerStruct>> getSerateAndEventiMarkers() async {
  final currentTime = DateTime.now();
  DateTime endOfDay = DateTime(
      currentTime.year, currentTime.month, currentTime.day, 23, 59, 59);

  final eventiCollection = await FirebaseFirestore.instance
      .collection('Eventi')
      .where("Data", isGreaterThanOrEqualTo: currentTime)
      .where("verificato", isEqualTo: true)
      .orderBy("Data", descending: false)
      .get();

  final serateCollection = await FirebaseFirestore.instance
      .collection('Serate')
      .where("Data", isGreaterThanOrEqualTo: endOfDay)
      .where("verificato", isEqualTo: true)
      .orderBy("Data", descending: false)
      .get();

  final meetUpPlacesCollection =
      await FirebaseFirestore.instance.collection('meetUpPlaces').get();

  var eventiList = eventiCollection.docs.map((doc) {
    // Convert Firestore doc to EventiRecord
    final record = EventiRecord.fromSnapshot(doc);

    // Create CustomMarkerStruct
    return CustomMarkerStruct(
        position: record.indirizzo, // Assuming Indirizzo is of type LatLng
        id: doc.id, // Document ID as the id
        type: "Eventi");
  }).toList();

  var serateList = serateCollection.docs.map((doc) {
    // Convert Firestore doc to EventiRecord
    final record = SerateRecord.fromSnapshot(doc);

    // Create CustomMarkerStruct
    return CustomMarkerStruct(
        position: record.indirizzo, // Assuming Indirizzo is of type LatLng
        id: doc.id, // Document ID as the id
        type: "Serate");
  }).toList();

  var meetUpList = meetUpPlacesCollection.docs.map((doc) {
    // Convert Firestore doc to EventiRecord
    final record = MeetUpPlacesRecord.fromSnapshot(doc);

    // Create CustomMarkerStruct
    return CustomMarkerStruct(
        position: record.location, // Assuming Indirizzo is of type LatLng
        id: doc.id, // Document ID as the id
        type: "meetUpPlaces");
  }).toList();

  return [...eventiList, ...serateList, ...meetUpList];
}
