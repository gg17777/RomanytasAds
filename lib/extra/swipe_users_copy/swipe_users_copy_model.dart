import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'swipe_users_copy_widget.dart' show SwipeUsersCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeUsersCopyModel extends FlutterFlowModel<SwipeUsersCopyWidget> {
  ///  Local state fields for this page.

  List<SwipeStruct> listUsers = [];
  void addToListUsers(SwipeStruct item) => listUsers.add(item);
  void removeFromListUsers(SwipeStruct item) => listUsers.remove(item);
  void removeAtIndexFromListUsers(int index) => listUsers.removeAt(index);
  void insertAtIndexInListUsers(int index, SwipeStruct item) =>
      listUsers.insert(index, item);
  void updateListUsersAtIndex(int index, Function(SwipeStruct) updateFn) =>
      listUsers[index] = updateFn(listUsers[index]);

  bool loading = true;

  int? swipesLeft = 0;

  SwipeStruct? currentSwipeData;
  void updateCurrentSwipeDataStruct(Function(SwipeStruct) updateFn) {
    updateFn(currentSwipeData ??= SwipeStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUnswipedParticipants] action in swipe_usersCopy widget.
  List<SwipeStruct>? users;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Custom Action - swipeSecretUser] action in SwipeableStack widget.
  bool? hasMatch;
  // Stores action output result for [Custom Action - swipeSecretUser] action in SwipeableStack widget.
  bool? hasMatchRight;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
