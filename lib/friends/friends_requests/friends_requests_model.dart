import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'friends_requests_widget.dart' show FriendsRequestsWidget;
import 'package:flutter/material.dart';

class FriendsRequestsModel extends FlutterFlowModel<FriendsRequestsWidget> {
  ///  Local state fields for this page.

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
