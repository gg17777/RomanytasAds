import '/bottom_nav/bottom_nav_eventi/bottom_nav_eventi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mostre_list_widget.dart' show MostreListWidget;
import 'package:flutter/material.dart';

class MostreListModel extends FlutterFlowModel<MostreListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
