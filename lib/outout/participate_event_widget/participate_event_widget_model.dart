import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'participate_event_widget_widget.dart' show ParticipateEventWidgetWidget;
import 'package:flutter/material.dart';

class ParticipateEventWidgetModel
    extends FlutterFlowModel<ParticipateEventWidgetWidget> {
  ///  Local state fields for this component.

  bool swipeDescription = false;

  bool photoDescription = false;

  bool listaDescription = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SwitchPhoto widget.
  bool? switchPhotoValue;
  // State field(s) for SwitchSwipe widget.
  bool? switchSwipeValue;
  // State field(s) for SwitchLista widget.
  bool? switchListaValue;
  // Stores action output result for [Custom Action - isUserParticipatingInAnotherEventOnSameDay] action in Container widget.
  IsParticipatingStruct? isUserParti;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
