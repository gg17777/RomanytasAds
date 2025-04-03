import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/index.dart';
import 'segnalazione_nasoni_widget.dart' show SegnalazioneNasoniWidget;
import 'package:flutter/material.dart';

class SegnalazioneNasoniModel
    extends FlutterFlowModel<SegnalazioneNasoniWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Model for bottomNavOutOut component.
  late BottomNavOutOutModel bottomNavOutOutModel;

  @override
  void initState(BuildContext context) {
    bottomNavOutOutModel = createModel(context, () => BottomNavOutOutModel());
  }

  @override
  void dispose() {
    bottomNavOutOutModel.dispose();
  }
}
