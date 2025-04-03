import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_photo_profile_widget.dart' show NewPhotoProfileWidget;
import 'package:flutter/material.dart';

class NewPhotoProfileModel extends FlutterFlowModel<NewPhotoProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
