import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'alreadyparticipating_model.dart';
export 'alreadyparticipating_model.dart';

class AlreadyparticipatingWidget extends StatefulWidget {
  const AlreadyparticipatingWidget({
    super.key,
    required this.action,
    required this.eventDoc,
  });

  final Future Function(bool noSwiping, bool featureAi, bool inLista)? action;
  final EventiRecord? eventDoc;

  @override
  State<AlreadyparticipatingWidget> createState() =>
      _AlreadyparticipatingWidgetState();
}

class _AlreadyparticipatingWidgetState extends State<AlreadyparticipatingWidget>
    with TickerProviderStateMixin {
  late AlreadyparticipatingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlreadyparticipatingModel());

    _model.switchPhotoValue = true;
    _model.switchSwipeValue = true;
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
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
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
            Text(
              'Non puoi partecipare a più eventi conteporaneamente lo stesso giorno',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).tertiary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            if (widget.eventDoc?.functionPhotoAI ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
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
                                      'ALREADYPARTICIPATING_Row_y7roqy53_ON_TAP');
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
                                        logFirebaseEvent(
                                            'Row_widget_animation');
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation1'] !=
                                            null) {
                                          await animationsMap[
                                                  'iconOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      } else {
                                        logFirebaseEvent(
                                            'Row_widget_animation');
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ALREADYPARTICIPATING_Text_d1tssxrj_ON_TA');
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
                                          logFirebaseEvent(
                                              'Text_widget_animation');
                                          if (animationsMap[
                                                  'iconOnActionTriggerAnimation1'] !=
                                              null) {
                                            await animationsMap[
                                                    'iconOnActionTriggerAnimation1']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Text_widget_animation');
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
                              ),
                          ],
                        ),
                      ),
                    ),
                    Switch.adaptive(
                      value: _model.switchPhotoValue!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchPhotoValue = newValue);
                        if (newValue) {
                          logFirebaseEvent(
                              'ALREADYPARTICIPATING_SwitchPhoto_ON_TOGG');
                          logFirebaseEvent('SwitchPhoto_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            featurePhotoAI: true,
                          ));
                        } else {
                          logFirebaseEvent(
                              'ALREADYPARTICIPATING_SwitchPhoto_ON_TOGG');
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
                  ],
                ),
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
                                  'ALREADYPARTICIPATING_Row_fwfga1r1_ON_TAP');
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
                                  'ALREADYPARTICIPATING_Text_zhkvp76j_ON_TA');
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
                                          .reverse();
                                    }
                                  } else {
                                    logFirebaseEvent('Text_widget_animation');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0);
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
                Switch.adaptive(
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
                                    'ALREADYPARTICIPATING_Row_qgcoo8bv_ON_TAP');
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
                                    'ALREADYPARTICIPATING_Text_cc7dw5zq_ON_TA');
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
                  logFirebaseEvent('ALREADYPARTICIPATING_Container_grob1bgl_');
                  logFirebaseEvent('Container_execute_callback');
                  await widget.action?.call(
                    !_model.switchSwipeValue!,
                    _model.switchPhotoValue!,
                    _model.switchListaValue!,
                  );
                  logFirebaseEvent('Container_haptic_feedback');
                  HapticFeedback.lightImpact();
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
                      'Scambia partecipazione',
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
