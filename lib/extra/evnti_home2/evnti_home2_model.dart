import '/bottom_nav/bottom_nav_eventi/bottom_nav_eventi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'evnti_home2_widget.dart' show EvntiHome2Widget;
import 'package:flutter/material.dart';

class EvntiHome2Model extends FlutterFlowModel<EvntiHome2Widget> {
  ///  State fields for stateful widgets in this page.

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
