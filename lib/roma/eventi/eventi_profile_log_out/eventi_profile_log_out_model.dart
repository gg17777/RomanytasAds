import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'eventi_profile_log_out_widget.dart' show EventiProfileLogOutWidget;
import 'package:flutter/material.dart';

class EventiProfileLogOutModel
    extends FlutterFlowModel<EventiProfileLogOutWidget> {
  ///  Local state fields for this page.

  bool descrizione = false;

  bool pagina = false;

  List<DocumentReference> myFriendsHere = [];
  void addToMyFriendsHere(DocumentReference item) => myFriendsHere.add(item);
  void removeFromMyFriendsHere(DocumentReference item) =>
      myFriendsHere.remove(item);
  void removeAtIndexFromMyFriendsHere(int index) =>
      myFriendsHere.removeAt(index);
  void insertAtIndexInMyFriendsHere(int index, DocumentReference item) =>
      myFriendsHere.insert(index, item);
  void updateMyFriendsHereAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      myFriendsHere[index] = updateFn(myFriendsHere[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (incrementViews)] action in EventiProfileLogOut widget.
  ApiCallResponse? apiResultjtr;
  // Stores action output result for [Custom Action - friendsParticipating] action in EventiProfileLogOut widget.
  List<DocumentReference>? myFriendsParticipating;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  String currentPageLink = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
