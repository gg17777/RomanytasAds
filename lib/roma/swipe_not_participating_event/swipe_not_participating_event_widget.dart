import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/alreadyparticipating_widget.dart';
import '/components/sei_in_lista_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'swipe_not_participating_event_model.dart';
export 'swipe_not_participating_event_model.dart';

class SwipeNotParticipatingEventWidget extends StatefulWidget {
  const SwipeNotParticipatingEventWidget({
    super.key,
    required this.eventRef,
    required this.eventName,
    required this.eventDoc,
  });

  final DocumentReference? eventRef;
  final String? eventName;
  final EventiRecord? eventDoc;

  @override
  State<SwipeNotParticipatingEventWidget> createState() =>
      _SwipeNotParticipatingEventWidgetState();
}

class _SwipeNotParticipatingEventWidgetState
    extends State<SwipeNotParticipatingEventWidget>
    with TickerProviderStateMixin {
  late SwipeNotParticipatingEventModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeNotParticipatingEventModel());

    _model.switchValue1 = true;
    _model.switchValue2 = true;
    _model.switchListaValue = true;
    animationsMap.addAll({
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 450.0.ms,
            begin: 0.0,
            end: 0.5,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 450.0.ms,
            begin: 0.0,
            end: 0.5,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 450.0.ms,
            begin: 0.0,
            end: 0.5,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 1.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 30.0,
              child: Divider(
                height: 30.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 10.0),
              child: Text(
                'Non è possibile accedere alla funzionalità di match making senza partecipare all\'evento.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).tertiary,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            if (widget.eventDoc?.functionPhotoAI ?? true)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SWIPE_NOT_PARTICIPATING_EVENT_Row_yl1ga2');
                                await Future.wait([
                                  Future(() async {
                                    logFirebaseEvent(
                                        'Row_update_component_state');
                                    _model.photoDescrizione =
                                        !_model.photoDescrizione;
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    if (_model.photoDescrizione) {
                                      logFirebaseEvent('Row_widget_animation');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'iconOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    } else {
                                      logFirebaseEvent('Row_widget_animation');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'iconOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                    }
                                  }),
                                ]);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Funzione MyHighlights',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'iconOnActionTriggerAnimation1']!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_model.photoDescrizione)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SWIPE_NOT_PARTICIPATING_EVENT_Text_509yv');
                                await Future.wait([
                                  Future(() async {
                                    logFirebaseEvent(
                                        'Text_update_component_state');
                                    _model.photoDescrizione =
                                        !_model.photoDescrizione;
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    if (_model.photoDescrizione) {
                                      logFirebaseEvent('Text_widget_animation');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'iconOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    } else {
                                      logFirebaseEvent('Text_widget_animation');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'iconOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                    }
                                  }),
                                ]);
                              },
                              child: Text(
                                'Ricevi le foto dell\'evento in cui sei presente',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Switch.adaptive(
                    value: _model.switchValue1!,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.switchValue1 = newValue);
                      if (newValue) {
                        logFirebaseEvent(
                            'SWIPE_NOT_PARTICIPATING_EVENT_Switch_xes');
                        logFirebaseEvent('Switch_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          featurePhotoAI: true,
                        ));
                      } else {
                        logFirebaseEvent(
                            'SWIPE_NOT_PARTICIPATING_EVENT_Switch_xes');
                        logFirebaseEvent('Switch_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          featurePhotoAI: false,
                        ));
                      }
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ],
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SWIPE_NOT_PARTICIPATING_EVENT_Row_7pl992');
                              await Future.wait([
                                Future(() async {
                                  logFirebaseEvent(
                                      'Row_update_component_state');
                                  _model.swipeDescrizione =
                                      !_model.swipeDescrizione;
                                  safeSetState(() {});
                                }),
                                Future(() async {
                                  if (_model.swipeDescrizione) {
                                    logFirebaseEvent('Row_widget_animation');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                  } else {
                                    logFirebaseEvent('Row_widget_animation');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse();
                                    }
                                  }
                                }),
                              ]);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Funzione Match Making',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconOnActionTriggerAnimation2']!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_model.swipeDescrizione)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SWIPE_NOT_PARTICIPATING_EVENT_Text_cnc9c');
                              await Future.wait([
                                Future(() async {
                                  logFirebaseEvent(
                                      'Text_update_component_state');
                                  _model.swipeDescrizione =
                                      !_model.swipeDescrizione;
                                  safeSetState(() {});
                                }),
                                Future(() async {
                                  if (_model.swipeDescrizione) {
                                    logFirebaseEvent('Text_widget_animation');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                  } else {
                                    logFirebaseEvent('Text_widget_animation');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse();
                                    }
                                  }
                                }),
                              ]);
                            },
                            child: Text(
                              'Fai swipe tra i partecipanti - un match equivale solamente ad un \"Sei carino, vienimi a parlare\"',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Switch.adaptive(
                  value: _model.switchValue2!,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.switchValue2 = newValue);
                  },
                  activeColor: FlutterFlowTheme.of(context).primary,
                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                  inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                  inactiveThumbColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ],
            ),
            if (widget.eventDoc?.lista ?? true)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SWIPE_NOT_PARTICIPATING_EVENT_Row_iamt9t');
                                await Future.wait([
                                  Future(() async {
                                    logFirebaseEvent(
                                        'Row_update_component_state');
                                    _model.listaDescription =
                                        !_model.listaDescription;
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    if (_model.listaDescription) {
                                      logFirebaseEvent('Row_widget_animation');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'iconOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    } else {
                                      logFirebaseEvent('Row_widget_animation');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'iconOnActionTriggerAnimation3']!
                                            .controller
                                            .reverse();
                                      }
                                    }
                                  }),
                                ]);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Entra in lista',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'iconOnActionTriggerAnimation3']!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_model.listaDescription)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SWIPE_NOT_PARTICIPATING_EVENT_Text_x3v4i');
                                await Future.wait([
                                  Future(() async {
                                    logFirebaseEvent(
                                        'Text_update_component_state');
                                    _model.listaDescription =
                                        !_model.listaDescription;
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    if (_model.listaDescription) {
                                      logFirebaseEvent('Text_widget_animation');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'iconOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    } else {
                                      logFirebaseEvent('Text_widget_animation');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'iconOnActionTriggerAnimation3']!
                                            .controller
                                            .reverse();
                                      }
                                    }
                                  }),
                                ]);
                              },
                              child: Text(
                                'Per accedere all\'evento è necessario essere in lista. All\'ingresso devi solamente dire \"Lista OutOut\"',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Switch.adaptive(
                    value: _model.switchListaValue!,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.switchListaValue = newValue);
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ],
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 50.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('SWIPE_NOT_PARTICIPATING_EVENT_Container_');
                  logFirebaseEvent('Container_custom_action');
                  _model.isUserParti =
                      await actions.isUserParticipatingInAnotherEventOnSameDay(
                    currentUserReference!,
                    widget.eventDoc!,
                  );
                  if (!_model.isUserParti!.isPart) {
                    logFirebaseEvent('Container_backend_call');

                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'participatingCount': FieldValue.increment(1),
                        },
                      ),
                    });
                    logFirebaseEvent('Container_backend_call');

                    await EventiParticiaptingRecord.createDoc(widget.eventRef!)
                        .set(createEventiParticiaptingRecordData(
                      userParticipatingEventRef: currentUserReference,
                      privateAccount: valueOrDefault<bool>(
                          currentUserDocument?.privateAccount, false),
                      sex: valueOrDefault(currentUserDocument?.sex, ''),
                      matchSex:
                          valueOrDefault(currentUserDocument?.matchSex, ''),
                      noSwiping: !_model.switchValue2!,
                      eventDate: widget.eventDoc?.data,
                      featurePhotoAi: _model.switchValue1,
                      eventID: widget.eventRef,
                      photoUrl: currentUserPhoto,
                      inApp: true,
                      countXuser: valueOrDefault(
                          currentUserDocument?.participatingCount, 0),
                      eventName: widget.eventName,
                      createdTime: getCurrentTimestamp,
                      userName:
                          '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')}',
                      userEmail: currentUserEmail,
                      uploaded: valueOrDefault<bool>(
                              currentUserDocument?.uploaded, false)
                          ? true
                          : false,
                      matchesNotifications: valueOrDefault<bool>(
                          currentUserDocument?.matchesNotifications, false),
                      likesNotifications: valueOrDefault<bool>(
                          currentUserDocument?.likesNotifications, false),
                    ));
                    logFirebaseEvent('Container_haptic_feedback');
                    HapticFeedback.lightImpact();
                    logFirebaseEvent('Container_bottom_sheet');
                    Navigator.pop(context);
                    if (widget.eventDoc!.lista && _model.switchListaValue!) {
                      logFirebaseEvent('Container_backend_call');

                      await ListaEventiRecord.createDoc(widget.eventRef!)
                          .set(createListaEventiRecordData(
                        nome: valueOrDefault(currentUserDocument?.nome, ''),
                        cognome:
                            valueOrDefault(currentUserDocument?.cognome, ''),
                        createdBy: currentUserReference?.id,
                        appName: 'romanytas',
                        userRef: currentUserReference,
                      ));
                    }
                  } else {
                    logFirebaseEvent('Container_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: AlreadyparticipatingWidget(
                            eventDoc: widget.eventDoc!,
                            action: (noSwiping, featureAi, inLista) async {
                              logFirebaseEvent('_custom_action');
                              await actions
                                  .removeUserFromExistingEventOnSameDay(
                                currentUserReference!,
                                widget.eventDoc!,
                              );
                              logFirebaseEvent('_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'participatingCount':
                                        FieldValue.increment(1),
                                  },
                                ),
                              });
                              logFirebaseEvent('_backend_call');

                              await EventiParticiaptingRecord.createDoc(
                                      widget.eventRef!)
                                  .set(createEventiParticiaptingRecordData(
                                userParticipatingEventRef: currentUserReference,
                                privateAccount: valueOrDefault<bool>(
                                    currentUserDocument?.privateAccount, false),
                                sex: valueOrDefault(
                                    currentUserDocument?.sex, ''),
                                matchSex: valueOrDefault(
                                    currentUserDocument?.matchSex, ''),
                                noSwiping: noSwiping,
                                eventDate: widget.eventDoc?.data,
                                featurePhotoAi: featureAi,
                                photoUrl: currentUserPhoto,
                                inApp: true,
                                countXuser: valueOrDefault(
                                    currentUserDocument?.participatingCount, 0),
                                eventID: widget.eventRef,
                                eventName: widget.eventName,
                                createdTime: getCurrentTimestamp,
                                userName:
                                    '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')}',
                                userEmail: currentUserEmail,
                                uploaded: valueOrDefault<bool>(
                                        currentUserDocument?.uploaded, false)
                                    ? true
                                    : false,
                                matchesNotifications: valueOrDefault<bool>(
                                    currentUserDocument?.matchesNotifications,
                                    false),
                                likesNotifications: valueOrDefault<bool>(
                                    currentUserDocument?.likesNotifications,
                                    false),
                              ));
                              if (widget.eventDoc!.lista &&
                                  _model.switchListaValue!) {
                                logFirebaseEvent('_bottom_sheet');
                                Navigator.pop(context);
                                logFirebaseEvent('_backend_call');

                                await ListaEventiRecord.createDoc(
                                        widget.eventRef!)
                                    .set(createListaEventiRecordData(
                                  nome: valueOrDefault(
                                      currentUserDocument?.nome, ''),
                                  cognome: valueOrDefault(
                                      currentUserDocument?.cognome, ''),
                                  createdBy: currentUserReference?.id,
                                  appName: 'romanytas',
                                  userRef: currentUserReference,
                                  entrato: false,
                                  eventDate: widget.eventDoc?.data,
                                ));
                                logFirebaseEvent('_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SeiInListaWidget(),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                logFirebaseEvent('_haptic_feedback');
                                HapticFeedback.lightImpact();
                                logFirebaseEvent('_bottom_sheet');
                                Navigator.pop(context);
                              }
                            },
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  }

                  safeSetState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Partecipa',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
