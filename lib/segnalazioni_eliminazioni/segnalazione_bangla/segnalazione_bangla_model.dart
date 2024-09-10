import '/bottom_nav/bottom_nav_bangla/bottom_nav_bangla_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'segnalazione_bangla_widget.dart' show SegnalazioneBanglaWidget;
import 'package:flutter/material.dart';

class SegnalazioneBanglaModel
    extends FlutterFlowModel<SegnalazioneBanglaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for bottomNavBangla component.
  late BottomNavBanglaModel bottomNavBanglaModel;

  @override
  void initState(BuildContext context) {
    bottomNavBanglaModel = createModel(context, () => BottomNavBanglaModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomNavBanglaModel.dispose();
  }
}
