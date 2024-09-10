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

import 'package:cloud_firestore/cloud_firestore.dart';

// Define the nasoni_Type class
class nasoni_Type {
  final LatLng? latlng;

  nasoni_Type({required this.latlng});
}

// Conversion function from nasoni_Type to NasoniTypeStruct
NasoniTypeStruct convertToNasoniTypeStruct(nasoni_Type nasoni) {
  return NasoniTypeStruct(
    latlng: nasoni.latlng ??
        LatLng(0.0, 0.0), // Provide a default value if latlng is null
  );
}

Future fetchNasoniData() async {
  // Add your function code here!
  try {
    if (FFAppState().nasoniLocal.isNotEmpty) {
      print('nasoniLocal is not empty. Stopping action.');
      return;
    }

    // Reference to the "nasoni" collection
    CollectionReference nasoniCollection =
        FirebaseFirestore.instance.collection('nasoni');

    // Query all documents in the "nasoni" collection
    QuerySnapshot querySnapshot = await nasoniCollection.get();

    // Initialize an empty list to hold the nasoni_Type objects
    List<nasoni_Type> nasoniList = [];
    int counter = 0;
    // Loop through each document in the query snapshot
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      LatLng? latLng;

      // Check if the document data is not null and contains the "latlng" field
      if (doc.data() != null &&
          (doc.data() as Map<String, dynamic>).containsKey('indirizzo')) {
        GeoPoint geoPoint = doc['indirizzo'];

        latLng = LatLng(geoPoint.latitude, geoPoint.longitude);
        // Print the latlng to debug
        print('Fetched indirizzo: ${latLng.latitude}, ${latLng.longitude}');
      } else {
        latLng = null;
        print(
            'Number ${counter} Document of id ${doc.id} does not contain latlng field.');
      }
      counter++;
      // Create a new nasoni_Type object with the extracted latlng
      nasoni_Type nasoniItem = nasoni_Type(latlng: latLng);

      // Add the nasoni_Type object to the list
      nasoniList.add(nasoniItem);
    }

    // Convert the list of nasoni_Type objects to NasoniTypeStruct objects
    List<NasoniTypeStruct> nasoniStructList =
        nasoniList.map(convertToNasoniTypeStruct).toList();

    // Update the app state with the list of NasoniTypeStruct objects
    FFAppState().nasoniLocal = nasoniStructList;

    // Print the number of items fetched to debug
    print('Total nasoni fetched: ${nasoniStructList.length}');
    print('AppState nasoniLocal contents:');
    for (var nasoni in FFAppState().nasoniLocal) {
      if (nasoni.latlng != null) {
        print(
            'LatLng: ${nasoni.latlng!.latitude}, ${nasoni.latlng!.longitude}');
      } else {
        print('LatLng: null');
      }
    }
  } catch (e) {
    // Handle any errors that occur during the fetch process
    print("Error fetching nasoni data: $e");
  }
}
