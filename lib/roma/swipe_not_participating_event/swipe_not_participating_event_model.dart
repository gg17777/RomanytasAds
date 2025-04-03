import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'swipe_not_participating_event_widget.dart'
    show SwipeNotParticipatingEventWidget;
import 'package:flutter/material.dart';

class SwipeNotParticipatingEventModel
    extends FlutterFlowModel<SwipeNotParticipatingEventWidget> {
  ///  Local state fields for this component.

  bool swipeDescrizione = false;

  bool photoDescrizione = false;

  bool listaDescription = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for SwitchLista widget.
  bool? switchListaValue;
  // Stores action output result for [Custom Action - isUserParticipatingInAnotherEventOnSameDay] action in Container widget.
  IsParticipatingStruct? isUserParti;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
