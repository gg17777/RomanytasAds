import '/backend/api_requests/api_calls.dart';
import '/bottom_nav/bottom_nav_eventi/bottom_nav_eventi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'discoteca_profile_widget.dart' show DiscotecaProfileWidget;
import 'package:flutter/material.dart';

class DiscotecaProfileModel extends FlutterFlowModel<DiscotecaProfileWidget> {
  ///  Local state fields for this page.

  bool text = false;

  bool descrizione = false;

  String descrizione2 = 'metà';

  bool pagina = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (incrementViews)] action in DiscotecaProfile widget.
  ApiCallResponse? apiResults1b;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for bottomNavEventi component.
  late BottomNavEventiModel bottomNavEventiModel;
  String currentPageLink = '';

  @override
  void initState(BuildContext context) {
    bottomNavEventiModel = createModel(context, () => BottomNavEventiModel());
  }

  @override
  void dispose() {
    bottomNavEventiModel.dispose();
  }
}
