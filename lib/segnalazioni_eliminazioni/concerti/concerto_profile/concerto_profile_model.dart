import '/backend/api_requests/api_calls.dart';
import '/bottom_nav/bottom_nav_eventi/bottom_nav_eventi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'concerto_profile_widget.dart' show ConcertoProfileWidget;
import 'package:flutter/material.dart';

class ConcertoProfileModel extends FlutterFlowModel<ConcertoProfileWidget> {
  ///  Local state fields for this page.

  bool text = false;

  bool descrizione = false;

  String pagina = 'Info';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (incrementViews)] action in ConcertoProfile widget.
  ApiCallResponse? apiResulta4x;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for bottomNavEventi component.
  late BottomNavEventiModel bottomNavEventiModel;
  String currentPageLink = '';

  @override
  void initState(BuildContext context) {
    bottomNavEventiModel = createModel(context, () => BottomNavEventiModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    bottomNavEventiModel.dispose();
  }
}
