import '/flutter_flow/flutter_flow_util.dart';
import 'segnalazione_widget.dart' show SegnalazioneWidget;
import 'package:flutter/material.dart';

class SegnalazioneModel extends FlutterFlowModel<SegnalazioneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for text widget.
  FocusNode? textFocusNode;
  TextEditingController? textTextController;
  String? Function(BuildContext, String?)? textTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFocusNode?.dispose();
    textTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
