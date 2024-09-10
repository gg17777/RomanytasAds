import '/bottom_nav/bottom_nav_eventi/bottom_nav_eventi_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mappa_mostre_widget.dart' show MappaMostreWidget;
import 'package:flutter/material.dart';

class MappaMostreModel extends FlutterFlowModel<MappaMostreWidget> {
  ///  Local state fields for this page.

  DateTime? curDay;

  DateTime? curMonth;

  DateTime? curYear;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for bottomNavEventi component.
  late BottomNavEventiModel bottomNavEventiModel;

  @override
  void initState(BuildContext context) {
    bottomNavEventiModel = createModel(context, () => BottomNavEventiModel());
  }

  @override
  void dispose() {
    bottomNavEventiModel.dispose();
  }
}
