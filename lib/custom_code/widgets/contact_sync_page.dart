// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fast_contacts/fast_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactSyncService {
  // Method to request contact permission
  Future<bool> _requestContactPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Show a dialog or message if needed
      status = await Permission.contacts.request();
      return status.isGranted;
    }
    return false;
  }

  // Method to get contacts
  Future<List<Contact>> fetchContacts() async {
    bool isGranted = await _requestContactPermission();
    if (isGranted) {
      try {
        return await FastContacts.getAllContacts();
      } catch (e) {
        print("Error fetching contacts: $e");
        return [];
      }
    } else {
      print("Contact permission denied");
      return [];
    }
  }
}

class ContactSyncPage extends StatefulWidget {
  const ContactSyncPage({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<ContactSyncPage> createState() => _ContactSyncPageState();
}

class _ContactSyncPageState extends State<ContactSyncPage> {
  List<Contact> _contacts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  // Load contacts with permission check
  Future<void> _loadContacts() async {
    _contacts = await ContactSyncService().fetchContacts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white,
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _contacts.isEmpty
              ? const Center(child: Text("No contacts found"))
              : ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    final contact = _contacts[index];
                    return ListTile(
                      title: Text(
                          contact.structuredName?.displayName ?? "No Name"),
                      subtitle: Text(contact.phones.isNotEmpty
                          ? contact.phones.first.number
                          : "No phone number"),
                    );
                  },
                ),
    );
  }
}
