import '/bottom_nav/bottom_nav_profilo/bottom_nav_profilo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profilo_widget.dart' show ProfiloWidget;
import 'package:flutter/material.dart';

class ProfiloModel extends FlutterFlowModel<ProfiloWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for bottomNavProfilo component.
  late BottomNavProfiloModel bottomNavProfiloModel;

  @override
  void initState(BuildContext context) {
    bottomNavProfiloModel = createModel(context, () => BottomNavProfiloModel());
  }

  @override
  void dispose() {
    bottomNavProfiloModel.dispose();
  }
}
