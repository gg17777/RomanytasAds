import '/bottom_nav/bottom_nav_nasoni/bottom_nav_nasoni_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'segnalazione_cibo_widget.dart' show SegnalazioneCiboWidget;
import 'package:flutter/material.dart';

class SegnalazioneCiboModel extends FlutterFlowModel<SegnalazioneCiboWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Model for bottomNavNasoni component.
  late BottomNavNasoniModel bottomNavNasoniModel;

  @override
  void initState(BuildContext context) {
    bottomNavNasoniModel = createModel(context, () => BottomNavNasoniModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomNavNasoniModel.dispose();
  }
}
