import '/flutter_flow/flutter_flow_util.dart';
import 'change_email_widget.dart' show ChangeEmailWidget;
import 'package:flutter/material.dart';

class ChangeEmailModel extends FlutterFlowModel<ChangeEmailWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
