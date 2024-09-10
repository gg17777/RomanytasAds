import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD4DNMICzskTZKEiL7X1WqQbkIkVXPBnvY",
            authDomain: "romanita-5nlemi.firebaseapp.com",
            projectId: "romanita-5nlemi",
            storageBucket: "romanita-5nlemi.appspot.com",
            messagingSenderId: "288434930634",
            appId: "1:288434930634:web:c6e27daa520ebe639dc533"));
  } else {
    await Firebase.initializeApp();
  }
}
