import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_likes_widget.dart' show AllLikesWidget;
import 'package:flutter/material.dart';

class AllLikesModel extends FlutterFlowModel<AllLikesWidget> {
  ///  Local state fields for this page.

  bool loading = true;

  List<MatchesRecord> matches = [];
  void addToMatches(MatchesRecord item) => matches.add(item);
  void removeFromMatches(MatchesRecord item) => matches.remove(item);
  void removeAtIndexFromMatches(int index) => matches.removeAt(index);
  void insertAtIndexInMatches(int index, MatchesRecord item) =>
      matches.insert(index, item);
  void updateMatchesAtIndex(int index, Function(MatchesRecord) updateFn) =>
      matches[index] = updateFn(matches[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getActiveMatches] action in all_likes widget.
  List<MatchesRecord>? retrievedMatches;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
