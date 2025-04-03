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

import 'package:url_launcher/url_launcher.dart';

import 'package:package_info_plus/package_info_plus.dart';

Future<String> getAppVersion() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<void> showUpdateDialog(
    BuildContext context, String playStoreUrl, String appStoreUrl) async {
  try {
    // Fetch the latest version from Firebase
    final latestVersionDoc =
        await FirebaseFirestore.instance.collection('config').doc('app').get();

    if (!latestVersionDoc.exists) {
      throw Exception("Version document not found in Firebase");
    }

    final String latestVersion = latestVersionDoc['latest-version'];
    final String currentVersion = await getAppVersion();

    // Compare versions
    if (needsUpdate(currentVersion, latestVersion)) {
      // Show a non-cancelable dialog
      await showDialog(
        context: context,
        barrierDismissible: false, // Non-cancelable
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
            ),
            title: Text('Aggiornamento necessario'),
            content: Text(
              'Per continuare ad utilizzare l’app è necessario scaricare il nuovo aggiornamento',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Redirect to App Store or Play Store
                  // Replace with your app's store URL
                  launchUrl(
                    Uri.parse(Theme.of(context).platform == TargetPlatform.iOS
                        ? appStoreUrl
                        : playStoreUrl),
                  );
                },
                child: Text('Aggiorna ora'),
              ),
            ],
          );
        },
      );
    }
  } catch (error) {
    debugPrint('Error checking for updates: $error');
  }
}

bool needsUpdate(String currentVersion, String latestVersion) {
  List<int> current = currentVersion.split('.').map(int.parse).toList();
  List<int> latest = latestVersion.split('.').map(int.parse).toList();

  for (int i = 0; i < latest.length; i++) {
    if (i >= current.length || current[i] < latest[i]) {
      return true; // Outdated version
    } else if (current[i] > latest[i]) {
      return false; // Up-to-date
    }
  }
  return false;
}
