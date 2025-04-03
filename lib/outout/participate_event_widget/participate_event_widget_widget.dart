import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/alreadyparticipating_widget.dart';
import '/components/no_photo_my_highlights_widget.dart';
import '/components/no_photo_swipe_widget.dart';
import '/components/sei_in_lista_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'participate_event_widget_model.dart';
export 'participate_event_widget_model.dart';

class ParticipateEventWidgetWidget extends StatefulWidget {
  const ParticipateEventWidgetWidget({
    super.key,
    required this.eventiDoc,
    required this.eventoRef,
    required this.listDocExist,
    required this.eventData,
  });

  final EventiRecord? eventiDoc;
  final DocumentReference? eventoRef;
  final bool? listDocExist;
  final DateTime? eventData;

  @override
  State<ParticipateEventWidgetWidget> createState() =>
      _ParticipateEventWidgetWidgetState();
}

class _ParticipateEventWidgetWidgetState
    extends State<ParticipateEventWidgetWidget> with TickerProviderStateMixin {
  late ParticipateEventWidgetModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParticipateEventWidgetModel());

    _model.switchPhotoValue =
        currentUserPhoto != '' ? true : false;
    _model.switchSwipeValue =
        currentUserPhoto != '' ? true : false;
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
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30.0,
              child: Divider(
                height: 30.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
            if (widget.eventiDoc?.functionPhotoAI ?? true)
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
                                    'PARTICIPATE_EVENT_WIDGET_Row_n6h5h1bl_ON');
                                await Future.wait([
                                  Future(() async {
                                    logFirebaseEvent(
                                        'Row_update_component_state');
                                    _model.photoDescription =
                                        !_model.photoDescription;
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    if (_model.photoDescription) {
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
                          if (_model.photoDescription)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PARTICIPATE_EVENT_WIDGET_Text_mc4598im_O');
                                await Future.wait([
                                  Future(() async {
                                    logFirebaseEvent(
                                        'Text_update_component_state');
                                    _model.photoDescription =
                                        !_model.photoDescription;
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    if (_model.photoDescription) {
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
                  AuthUserStreamWidget(
                    builder: (context) => Switch.adaptive(
                      value: _model.switchPhotoValue!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchPhotoValue = newValue);
                        if (newValue) {
                          logFirebaseEvent(
                              'PARTICIPATE_EVENT_WIDGET_SwitchPhoto_ON_');
                          logFirebaseEvent('SwitchPhoto_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            featurePhotoAI: true,
                          ));
                        } else {
                          logFirebaseEvent(
                              'PARTICIPATE_EVENT_WIDGET_SwitchPhoto_ON_');
                          logFirebaseEvent('SwitchPhoto_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            featurePhotoAI: false,
                          ));
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor: FlutterFlowTheme.of(context).primary,
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).alternate,
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
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
                                  'PARTICIPATE_EVENT_WIDGET_Row_o84ppaml_ON');
                              await Future.wait([
                                Future(() async {
                                  logFirebaseEvent(
                                      'Row_update_component_state');
                                  _model.swipeDescription =
                                      !_model.swipeDescription;
                                  safeSetState(() {});
                                }),
                                Future(() async {
                                  if (_model.swipeDescription) {
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
                        if (_model.swipeDescription)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PARTICIPATE_EVENT_WIDGET_Text_89xizei4_O');
                              await Future.wait([
                                Future(() async {
                                  logFirebaseEvent(
                                      'Text_update_component_state');
                                  _model.swipeDescription =
                                      !_model.swipeDescription;
                                  safeSetState(() {});
                                }),
                                Future(() async {
                                  if (_model.swipeDescription) {
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
                              'Fai swipe tra i partecipanti e trova il tuo match - un boost in più per far succedere cose',
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
                AuthUserStreamWidget(
                  builder: (context) => Switch.adaptive(
                    value: _model.switchSwipeValue!,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.switchSwipeValue = newValue);
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ],
            ),
            if (widget.eventiDoc!.lista && !widget.listDocExist!)
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
                                    'PARTICIPATE_EVENT_WIDGET_Row_pt0hceaj_ON');
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
                                    'PARTICIPATE_EVENT_WIDGET_Text_es8c7hmw_O');
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 50.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PARTICIPATE_EVENT_WIDGET_Container_7kg5n');
                  logFirebaseEvent('Container_custom_action');
                  _model.isUserParti =
                      await actions.isUserParticipatingInAnotherEventOnSameDay(
                    currentUserReference!,
                    widget.eventiDoc!,
                  );
                  if (!_model.isUserParti!.isPart) {
                    if ((currentUserPhoto == '') &&
                        _model.switchPhotoValue! &&
                        widget.eventiDoc!.functionPhotoAI) {
                      logFirebaseEvent('Container_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: NoPhotoMyHighlightsWidget(),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else if ((currentUserPhoto == '') &&
                        _model.switchSwipeValue!) {
                      logFirebaseEvent('Container_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: NoPhotoSwipeWidget(),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      logFirebaseEvent('Container_backend_call');

                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'participatingCount': FieldValue.increment(1),
                          },
                        ),
                      });
                      logFirebaseEvent('Container_backend_call');

                      await EventiParticiaptingRecord.createDoc(
                              widget.eventoRef!)
                          .set(createEventiParticiaptingRecordData(
                        userParticipatingEventRef: currentUserReference,
                        privateAccount: valueOrDefault<bool>(
                            currentUserDocument?.privateAccount, false),
                        sex: valueOrDefault(currentUserDocument?.sex, ''),
                        matchSex:
                            valueOrDefault(currentUserDocument?.matchSex, ''),
                        noSwiping: !_model.switchSwipeValue!,
                        eventDate: widget.eventiDoc?.data,
                        featurePhotoAi: _model.switchPhotoValue,
                        photoUrl: currentUserPhoto,
                        eventID: widget.eventoRef,
                        inApp: true,
                        countXuser: valueOrDefault(
                            currentUserDocument?.participatingCount, 0),
                        eventName: widget.eventiDoc?.titolo,
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
                      if (!widget.listDocExist! &&
                          widget.eventiDoc!.lista &&
                          _model.switchListaValue!) {
                        logFirebaseEvent('Container_bottom_sheet');
                        Navigator.pop(context);
                        logFirebaseEvent('Container_backend_call');

                        await ListaEventiRecord.createDoc(widget.eventoRef!)
                            .set(createListaEventiRecordData(
                          nome: valueOrDefault(currentUserDocument?.nome, ''),
                          cognome:
                              valueOrDefault(currentUserDocument?.cognome, ''),
                          createdBy: currentUserReference?.id,
                          appName: 'romanytas',
                          userRef: currentUserReference,
                          entrato: false,
                          eventDate: widget.eventiDoc?.data,
                        ));
                        logFirebaseEvent('Container_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Color(0x43000000),
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
                        logFirebaseEvent('Container_haptic_feedback');
                        HapticFeedback.lightImpact();
                        logFirebaseEvent('Container_bottom_sheet');
                        Navigator.pop(context);
                      }
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
                            eventDoc: widget.eventiDoc!,
                            action: (noSwiping, featureAi, inLista) async {
                              logFirebaseEvent('_custom_action');
                              await actions
                                  .removeUserFromExistingEventOnSameDay(
                                currentUserReference!,
                                widget.eventiDoc!,
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
                                      widget.eventoRef!)
                                  .set(createEventiParticiaptingRecordData(
                                userParticipatingEventRef: currentUserReference,
                                privateAccount: valueOrDefault<bool>(
                                    currentUserDocument?.privateAccount, false),
                                sex: valueOrDefault(
                                    currentUserDocument?.sex, ''),
                                matchSex: valueOrDefault(
                                    currentUserDocument?.matchSex, ''),
                                noSwiping: noSwiping,
                                eventDate: widget.eventData,
                                featurePhotoAi: valueOrDefault<bool>(
                                    currentUserDocument?.featurePhotoAI, false),
                                photoUrl: currentUserPhoto,
                                eventID: widget.eventoRef,
                                inApp: true,
                                countXuser: valueOrDefault(
                                    currentUserDocument?.participatingCount, 0),
                                eventName: widget.eventiDoc?.titolo,
                                userName:
                                    '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')}',
                                createdTime: getCurrentTimestamp,
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
                              if (!widget.listDocExist! &&
                                  widget.eventiDoc!.lista &&
                                  _model.switchListaValue!) {
                                logFirebaseEvent('_bottom_sheet');
                                Navigator.pop(context);
                                logFirebaseEvent('_backend_call');

                                await ListaEventiRecord.createDoc(
                                        widget.eventoRef!)
                                    .set(createListaEventiRecordData(
                                  nome: valueOrDefault(
                                      currentUserDocument?.nome, ''),
                                  cognome: valueOrDefault(
                                      currentUserDocument?.cognome, ''),
                                  createdBy: currentUserReference?.id,
                                  appName: 'romanytas',
                                  userRef: currentUserReference,
                                  entrato: false,
                                  eventDate: widget.eventiDoc?.data,
                                ));
                                logFirebaseEvent('_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x43000000),
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

                    logFirebaseEvent('Container_bottom_sheet');
                    Navigator.pop(context);
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
