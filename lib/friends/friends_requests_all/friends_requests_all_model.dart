import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import 'friends_requests_all_widget.dart' show FriendsRequestsAllWidget;
import 'package:flutter/material.dart';

class FriendsRequestsAllModel
    extends FlutterFlowModel<FriendsRequestsAllWidget> {
  ///  State fields for stateful widgets in this page.

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
