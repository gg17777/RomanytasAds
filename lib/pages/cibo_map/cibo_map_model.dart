import '/bottom_nav/bottom_nav_cibo/bottom_nav_cibo_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cibo_map_widget.dart' show CiboMapWidget;
import 'package:flutter/material.dart';

class CiboMapModel extends FlutterFlowModel<CiboMapWidget> {
  ///  Local state fields for this page.

  bool zozzoni = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for bottomNavCibo component.
  late BottomNavCiboModel bottomNavCiboModel;

  @override
  void initState(BuildContext context) {
    bottomNavCiboModel = createModel(context, () => BottomNavCiboModel());
  }

  @override
  void dispose() {
    bottomNavCiboModel.dispose();
  }
}
