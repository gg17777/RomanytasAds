import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_events_widget.dart' show MyEventsWidget;
import 'package:flutter/material.dart';

class MyEventsModel extends FlutterFlowModel<MyEventsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
