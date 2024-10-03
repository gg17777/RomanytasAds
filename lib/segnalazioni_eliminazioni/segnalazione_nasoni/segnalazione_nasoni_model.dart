import '/bottom_nav/bottom_nav_nasoni/bottom_nav_nasoni_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'segnalazione_nasoni_widget.dart' show SegnalazioneNasoniWidget;
import 'package:flutter/material.dart';

class SegnalazioneNasoniModel
    extends FlutterFlowModel<SegnalazioneNasoniWidget> {
  ///  State fields for stateful widgets in this page.

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
    bottomNavNasoniModel.dispose();
  }
}
