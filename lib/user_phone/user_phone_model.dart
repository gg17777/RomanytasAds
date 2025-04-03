import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_phone_widget.dart' show UserPhoneWidget;
import 'package:flutter/material.dart';

class UserPhoneModel extends FlutterFlowModel<UserPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - fetchContacts] action in Container widget.
  List<UsersRecord>? allUsersContacts;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
