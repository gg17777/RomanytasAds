import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_matches_widget.dart' show AllMatchesWidget;
import 'package:flutter/material.dart';

class AllMatchesModel extends FlutterFlowModel<AllMatchesWidget> {
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

  // Stores action output result for [Custom Action - getActiveMatches] action in all_matches widget.
  List<MatchesRecord>? retrievedMatches;
  // Stores action output result for [Bottom Sheet - match_settings] action in Icon widget.
  bool? reloadMatchesData;
  // Stores action output result for [Custom Action - getActiveMatches] action in Icon widget.
  List<MatchesRecord>? retrievedMatchesNew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
