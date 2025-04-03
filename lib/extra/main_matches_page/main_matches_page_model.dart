import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/index.dart';
import 'main_matches_page_widget.dart' show MainMatchesPageWidget;
import 'package:flutter/material.dart';

class MainMatchesPageModel extends FlutterFlowModel<MainMatchesPageWidget> {
  ///  Local state fields for this page.

  List<MatchesRecord> matches = [];
  void addToMatches(MatchesRecord item) => matches.add(item);
  void removeFromMatches(MatchesRecord item) => matches.remove(item);
  void removeAtIndexFromMatches(int index) => matches.removeAt(index);
  void insertAtIndexInMatches(int index, MatchesRecord item) =>
      matches.insert(index, item);
  void updateMatchesAtIndex(int index, Function(MatchesRecord) updateFn) =>
      matches[index] = updateFn(matches[index]);

  bool loading = true;

  List<DocumentReference> myFriends = [];
  void addToMyFriends(DocumentReference item) => myFriends.add(item);
  void removeFromMyFriends(DocumentReference item) => myFriends.remove(item);
  void removeAtIndexFromMyFriends(int index) => myFriends.removeAt(index);
  void insertAtIndexInMyFriends(int index, DocumentReference item) =>
      myFriends.insert(index, item);
  void updateMyFriendsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      myFriends[index] = updateFn(myFriends[index]);

  List<UsersRecord> suggestions = [];
  void addToSuggestions(UsersRecord item) => suggestions.add(item);
  void removeFromSuggestions(UsersRecord item) => suggestions.remove(item);
  void removeAtIndexFromSuggestions(int index) => suggestions.removeAt(index);
  void insertAtIndexInSuggestions(int index, UsersRecord item) =>
      suggestions.insert(index, item);
  void updateSuggestionsAtIndex(int index, Function(UsersRecord) updateFn) =>
      suggestions[index] = updateFn(suggestions[index]);

  bool loadingSuggestions = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getActiveMatches] action in main_matches_page widget.
  List<MatchesRecord>? retrievedMatches;
  // Stores action output result for [Custom Action - getFriendsSuggestions] action in main_matches_page widget.
  List<UsersRecord>? gottenUsers;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Bottom Sheet - match_settings] action in Icon widget.
  bool? reloadMatchesData;
  // Stores action output result for [Custom Action - getActiveMatches] action in Icon widget.
  List<MatchesRecord>? retrievedMatchesNew;
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
