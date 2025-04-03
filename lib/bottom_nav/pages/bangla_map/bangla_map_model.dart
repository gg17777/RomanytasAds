import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/index.dart';
import 'bangla_map_widget.dart' show BanglaMapWidget;
import 'package:flutter/material.dart';

class BanglaMapModel extends FlutterFlowModel<BanglaMapWidget> {
  ///  Local state fields for this page.

  NasoniTypeStruct? nasoni;
  void updateNasoniStruct(Function(NasoniTypeStruct) updateFn) {
    updateFn(nasoni ??= NasoniTypeStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
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
