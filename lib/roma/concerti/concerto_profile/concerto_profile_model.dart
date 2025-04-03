import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'concerto_profile_widget.dart' show ConcertoProfileWidget;
import 'package:flutter/material.dart';

class ConcertoProfileModel extends FlutterFlowModel<ConcertoProfileWidget> {
  ///  Local state fields for this page.

  bool descrizione = false;

  bool pagina = false;

  List<DocumentReference> myFriendsHereConcert = [];
  void addToMyFriendsHereConcert(DocumentReference item) =>
      myFriendsHereConcert.add(item);
  void removeFromMyFriendsHereConcert(DocumentReference item) =>
      myFriendsHereConcert.remove(item);
  void removeAtIndexFromMyFriendsHereConcert(int index) =>
      myFriendsHereConcert.removeAt(index);
  void insertAtIndexInMyFriendsHereConcert(int index, DocumentReference item) =>
      myFriendsHereConcert.insert(index, item);
  void updateMyFriendsHereConcertAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      myFriendsHereConcert[index] = updateFn(myFriendsHereConcert[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (incrementViews)] action in ConcertoProfile widget.
  ApiCallResponse? apiResulta4x;
  // Stores action output result for [Custom Action - friendsParticipatingConcert] action in ConcertoProfile widget.
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
