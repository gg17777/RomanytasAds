import '/flutter_flow/flutter_flow_util.dart';
import 'segnalazione_widget.dart' show SegnalazioneWidget;
import 'package:flutter/material.dart';

class SegnalazioneModel extends FlutterFlowModel<SegnalazioneWidget> {
  ///  Local state fields for this page.

  String? versionNumber;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getVersionNumber] action in Segnalazione widget.
  String? versionNumbe;
  // State field(s) for text widget.
  FocusNode? textFocusNode;
  TextEditingController? textTextController;
  String? Function(BuildContext, String?)? textTextControllerValidator;
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
  }
}
