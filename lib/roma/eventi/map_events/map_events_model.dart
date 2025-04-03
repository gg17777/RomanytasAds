import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/index.dart';
import 'map_events_widget.dart' show MapEventsWidget;
import 'package:flutter/material.dart';

class MapEventsModel extends FlutterFlowModel<MapEventsWidget> {
  ///  Local state fields for this page.

  DateTime? curDay;

  DateTime? curMonth;

  DateTime? curYear;

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
