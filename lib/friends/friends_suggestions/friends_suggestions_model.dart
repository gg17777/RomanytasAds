import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import 'friends_suggestions_widget.dart' show FriendsSuggestionsWidget;
import 'package:flutter/material.dart';

class FriendsSuggestionsModel
    extends FlutterFlowModel<FriendsSuggestionsWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> suggestions = [];
  void addToSuggestions(UsersRecord item) => suggestions.add(item);
  void removeFromSuggestions(UsersRecord item) => suggestions.remove(item);
  void removeAtIndexFromSuggestions(int index) => suggestions.removeAt(index);
  void insertAtIndexInSuggestions(int index, UsersRecord item) =>
      suggestions.insert(index, item);
  void updateSuggestionsAtIndex(int index, Function(UsersRecord) updateFn) =>
      suggestions[index] = updateFn(suggestions[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFriendsSuggestions] action in friendsSuggestions widget.
  List<UsersRecord>? gottenUsers;
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
