import '/bottom_nav/bottom_nav_nasoni/bottom_nav_nasoni_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nasoni_map_widget.dart' show NasoniMapWidget;
import 'package:flutter/material.dart';

class NasoniMapModel extends FlutterFlowModel<NasoniMapWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
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
