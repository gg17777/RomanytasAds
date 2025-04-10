import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_events_copy_widget.dart' show MyEventsCopyWidget;
import 'package:flutter/material.dart';

class MyEventsCopyModel extends FlutterFlowModel<MyEventsCopyWidget> {
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
