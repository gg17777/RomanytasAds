import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/index.dart';
import 'segnalazione_bangla_widget.dart' show SegnalazioneBanglaWidget;
import 'package:flutter/material.dart';

class SegnalazioneBanglaModel
    extends FlutterFlowModel<SegnalazioneBanglaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for bottomNavOutOut component.
  late BottomNavOutOutModel bottomNavOutOutModel;

  @override
  void initState(BuildContext context) {
    bottomNavOutOutModel = createModel(context, () => BottomNavOutOutModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomNavOutOutModel.dispose();
  }
}
