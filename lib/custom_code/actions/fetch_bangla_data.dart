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

// Define the bangla_Type class
class bangla_Type {
  final LatLng? latlng;
  final DateTime? date_time;

  bangla_Type({required this.latlng, required this.date_time});
}

// Conversion function from bangla_Type to BanglaTypeStruct
BanglaTypeStruct convertToBanglaTypeStruct(bangla_Type bangla) {
  return BanglaTypeStruct(
    latlng: bangla.latlng ??
        LatLng(0.0, 0.0), // Provide a default value if latlng is null
    dateTime: bangla.date_time ??
        DateTime(1970, 1, 1), // Provide a default value if date_time is null
  );
}

Future fetchBanglaData() async {
  // Add your function code here!
  try {
    if (FFAppState().banglaLocal.isNotEmpty) {
      print('banglaLocal is not empty. Stopping action.');
      return;
    }

    // Reference to the "bangla" collection
    CollectionReference banglaCollection =
        FirebaseFirestore.instance.collection('bangla');

    // Query all documents in the "bangla" collection
    QuerySnapshot querySnapshot = await banglaCollection.get();

    // Initialize an empty list to hold the bangla_Type objects
    List<bangla_Type> banglaList = [];

    // Loop through each document in the query snapshot
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      LatLng? latlng;
      DateTime? date_time;

      // Check if the document data is not null and contains the "latlng" field
      if (doc.data() != null &&
          (doc.data() as Map<String, dynamic>).containsKey('indirizzo')) {
        GeoPoint geoPoint = doc['indirizzo'];
        latlng = LatLng(geoPoint.latitude, geoPoint.longitude);
        // Print the latlng to debug
        print('Fetched latlng: ${latlng.latitude}, ${latlng.longitude}');
      } else {
        latlng = null;
        print('Document ${doc.id} does not contain latlng field.');
      }

      // Check if the document data is not null and contains the "date_time" field
      if (doc.data() != null &&
          (doc.data() as Map<String, dynamic>).containsKey('orario')) {
        Timestamp timestamp = doc['orario'];
        date_time = timestamp.toDate();
        // Print the date_time to debug
        print('Fetched date_time: $date_time');
      } else {
        date_time = null;
        print('Document ${doc.id} does not contain date_time field.');
      }

      // Create a new bangla_Type object with the extracted latlng and date_time
      bangla_Type banglaItem =
          bangla_Type(latlng: latlng, date_time: date_time);

      // Add the bangla_Type object to the list
      banglaList.add(banglaItem);
    }

    // Convert the list of bangla_Type objects to BanglaTypeStruct objects
    List<BanglaTypeStruct> banglaStructList =
        banglaList.map(convertToBanglaTypeStruct).toList();

    // Update the app state with the list of BanglaTypeStruct objects
    FFAppState().banglaLocal = banglaStructList;

    // Print the number of items fetched to debug
    print('Total bangla fetched: ${banglaStructList.length}');

    // Print the contents of the app state to debug
    printBanglaAppStateContents();
  } catch (e) {
    // Handle any errors that occur during the fetch process
    print("Error fetching bangla data: $e");
  }
}

// Method to print the contents of the banglaLocal app state variable
void printBanglaAppStateContents() {
  print('AppState banglaLocal contents:');
  for (var bangla in FFAppState().banglaLocal) {
    if (bangla.latlng != null) {
      print('LatLng: ${bangla.latlng!.latitude}, ${bangla.latlng!.longitude}');
    } else {
      print('LatLng: null');
    }
    if (bangla.dateTime != null) {
      print('DateTime: ${bangla.dateTime}');
    } else {
      print('DateTime: null');
    }
  }
}
