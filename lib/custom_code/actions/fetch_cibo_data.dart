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

// Define the cibo_Type class
class cibo_Type {
  final LatLng? latlng;
  final String? name;
  final String? description;
  final bool? zozzoni;

  cibo_Type({
    required this.latlng,
    required this.name,
    required this.description,
    required this.zozzoni,
  });
}

// Conversion function from cibo_Type to CiboTypeStruct
CiboTypeStruct convertToCiboTypeStruct(cibo_Type cibo) {
  return CiboTypeStruct(
      latlng: cibo.latlng ?? LatLng(0.0, 0.0),
      name: cibo.name ?? '',
      description: cibo.description ?? '',
      zozzoni: cibo.zozzoni ?? false);
}

Future fetchCiboData() async {
  // Add your function code here!
  try {
    // Check if ciboLocal is not empty
    // if (FFAppState().ciboLocal.isNotEmpty) {
    //   print('ciboLocal is not empty. Stopping action.');
    //   return;
    // }

    // Reference to the "Cibo" collection
    CollectionReference ciboCollection =
        FirebaseFirestore.instance.collection('Cibo');

    // Query all documents in the "Cibo" collection
    QuerySnapshot querySnapshot = await ciboCollection.get();

    // Initialize an empty list to hold the cibo_Type objects
    List<cibo_Type> ciboList = [];

    // Loop through each document in the query snapshot
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      LatLng? latlng;
      String? name;
      String? description;
      bool? zozzoni;

      // Check if the document data is not null and contains the "indirizzo" field
      if (doc.data() != null &&
          (doc.data() as Map<String, dynamic>).containsKey('indirizzo')) {
        GeoPoint geoPoint = doc['indirizzo'];
        latlng = LatLng(geoPoint.latitude, geoPoint.longitude);
        // Print the latlng to debug
        print('Fetched latlng: ${latlng.latitude}, ${latlng.longitude}');
      } else {
        latlng = null;
        print('Document ${doc.id} does not contain indirizzo field.');
      }

      // Check if the document data is not null and contains the "Nome" field
      if (doc.data() != null &&
          (doc.data() as Map<String, dynamic>).containsKey('Nome')) {
        name = doc['Nome'];
        // Print the name to debug
        print('Fetched name: $name');
      } else {
        name = null;
        print('Document ${doc.id} does not contain Nome field.');
      }

      // Check if the document data is not null and contains the "Descrizione" field
      if (doc.data() != null &&
          (doc.data() as Map<String, dynamic>).containsKey('Descrizione')) {
        description = doc['Descrizione'];
        // Print the description to debug
        print('Fetched description: $description');
      } else {
        description = null;
        print('Document ${doc.id} does not contain Descrizione field.');
      }

      // Fetch the "zozzoni" field
      if (doc.data() != null &&
          (doc.data() as Map<String, dynamic>).containsKey('zozzoni')) {
        zozzoni = doc['zozzoni'];
        print('Fetched zozzoni: $zozzoni');
      } else {
        zozzoni = null;
        print('Document ${doc.id} does not contain zozzoni field.');
      }

      // Create a new cibo_Type object with the extracted fields
      cibo_Type ciboItem = cibo_Type(
          latlng: latlng,
          name: name,
          description: description,
          zozzoni: zozzoni // Add this line
          );

      // Add the cibo_Type object to the list
      ciboList.add(ciboItem);
    }

    // Convert the list of cibo_Type objects to CiboTypeStruct objects
    List<CiboTypeStruct> ciboStructList =
        ciboList.map(convertToCiboTypeStruct).toList();

    // Update the app state with the list of CiboTypeStruct objects
    FFAppState().ciboLocal = ciboStructList;

    // Print the number of items fetched to debug
    print('Total cibo fetched: ${ciboStructList.length}');

    // Print the contents of the app state to debug
    printCiboAppStateContents();
  } catch (e) {
    // Handle any errors that occur during the fetch process
    print("Error fetching cibo data: $e");
  }
}

// Method to print the contents of the ciboLocal app state variable
void printCiboAppStateContents() {
  print('AppState ciboLocal contents:');
  for (var cibo in FFAppState().ciboLocal) {
    if (cibo.latlng != null) {
      print('LatLng: ${cibo.latlng!.latitude}, ${cibo.latlng!.longitude}');
    } else {
      print('LatLng: null');
    }
    if (cibo.name != null) {
      print('Name: ${cibo.name}');
    } else {
      print('Name: null');
    }
    if (cibo.description != null) {
      print('Description: ${cibo.description}');
    } else {
      print('Description: null');
    }
    if (cibo.zozzoni != null) {
      print('Zozzoni: ${cibo.zozzoni}');
    } else {
      print('Zozzoni: null');
    }
  }
}
