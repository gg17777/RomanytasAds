import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/index.dart';
import 'friends_map_widget.dart' show FriendsMapWidget;
import 'package:flutter/material.dart';

class FriendsMapModel extends FlutterFlowModel<FriendsMapWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  List<CustomMarkerStruct> customMarkers = [];
  void addToCustomMarkers(CustomMarkerStruct item) => customMarkers.add(item);
  void removeFromCustomMarkers(CustomMarkerStruct item) =>
      customMarkers.remove(item);
  void removeAtIndexFromCustomMarkers(int index) =>
      customMarkers.removeAt(index);
  void insertAtIndexInCustomMarkers(int index, CustomMarkerStruct item) =>
      customMarkers.insert(index, item);
  void updateCustomMarkersAtIndex(
          int index, Function(CustomMarkerStruct) updateFn) =>
      customMarkers[index] = updateFn(customMarkers[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFriendsMapData] action in friendsMap widget.
  List<CustomMarkerStruct>? friendsMap;
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
