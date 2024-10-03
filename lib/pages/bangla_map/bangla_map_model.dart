import '/backend/backend.dart';
import '/bottom_nav/bottom_nav_bangla/bottom_nav_bangla_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
  // Model for bottomNavBangla component.
  late BottomNavBanglaModel bottomNavBanglaModel;

  @override
  void initState(BuildContext context) {
    bottomNavBanglaModel = createModel(context, () => BottomNavBanglaModel());
  }

  @override
  void dispose() {
    bottomNavBanglaModel.dispose();
  }
}
