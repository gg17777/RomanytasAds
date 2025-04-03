import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'match_settings_model.dart';
export 'match_settings_model.dart';

class MatchSettingsWidget extends StatefulWidget {
  const MatchSettingsWidget({
    super.key,
    required this.matchDoc,
  });

  final MatchesRecord? matchDoc;

  @override
  State<MatchSettingsWidget> createState() => _MatchSettingsWidgetState();
}

class _MatchSettingsWidgetState extends State<MatchSettingsWidget>
    with TickerProviderStateMixin {
  late MatchSettingsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchSettingsModel());

    animationsMap.addAll({
      'rowOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.95, 0.95),
          ),
        ],
      ),
      'rowOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.95, 0.95),
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
    return StreamBuilder<MatchesRecord>(
      stream: MatchesRecord.getDocument(widget.matchDoc!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 25.0,
              height: 25.0,
              child: SpinKitFadingCircle(
                color: FlutterFlowTheme.of(context).alternate,
                size: 25.0,
              ),
            ),
          );
        }

        final containerMatchesRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          height: !containerMatchesRecord.iAmHereFeature
                  .contains(currentUserReference)
              ? 155.0
              : 140.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onPanDown: (details) async {
                  logFirebaseEvent('MATCH_SETTINGS_Divider_l4czevss_ON_PAN_D');
                  logFirebaseEvent('Divider_bottom_sheet');
                  Navigator.pop(context);
                },
                child: SizedBox(
                  width: 20.0,
                  child: Divider(
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  if (!containerMatchesRecord.iAmHereFeature
                      .contains(currentUserReference))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 10.0, 15.0, 10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MATCH_SETTINGS_COMP_Row_hp9eprw1_ON_TAP');
                          if (!containerMatchesRecord.iAmHereFeature
                              .contains(currentUserReference)) {
                            logFirebaseEvent('Row_haptic_feedback');
                            HapticFeedback.mediumImpact();
                            logFirebaseEvent('Row_backend_call');

                            await widget.matchDoc!.reference.update({
                              ...mapToFirestore(
                                {
                                  'i_am_here_feature': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });
                            logFirebaseEvent('Row_trigger_push_notification');
                            triggerPushNotification(
                              notificationTitle: 'Il tuo match è arrivato!',
                              notificationText: () {
                                if (valueOrDefault(
                                        currentUserDocument?.sex, '') ==
                                    'Uomo') {
                                  return '${valueOrDefault(currentUserDocument?.nome, '')} è arrivato all\'evento';
                                } else if (valueOrDefault(
                                        currentUserDocument?.sex, '') ==
                                    'Donna') {
                                  return '${valueOrDefault(currentUserDocument?.nome, '')} è arrivata all\'evento';
                                } else {
                                  return '${valueOrDefault(currentUserDocument?.nome, '')} è arrivatə all\'evento';
                                }
                              }(),
                              notificationSound: 'default',
                              userRefs: [
                                functions.returnDifferentUserRef(
                                    containerMatchesRecord.users.toList())!
                              ],
                              initialPageName: 'main_matches_page',
                              parameterData: {},
                            );
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Text(
                                () {
                                  if (valueOrDefault(
                                          currentUserDocument?.sex, '') ==
                                      'Uomo') {
                                    return 'Sono arrivato all\'evento';
                                  } else if (valueOrDefault(
                                          currentUserDocument?.sex, '') ==
                                      'Donna') {
                                    return 'Sono arrivata all\'evento';
                                  } else {
                                    return 'Sono arrivatə all\'evento';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Icon(
                              Icons.telegram_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['rowOnActionTriggerAnimation1']!,
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 70.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MATCH_SETTINGS_COMP_Row_e5syk60c_ON_TAP');
                        logFirebaseEvent('Row_haptic_feedback');
                        HapticFeedback.lightImpact();
                        logFirebaseEvent('Row_backend_call');
                        await widget.matchDoc!.reference.delete();
                        logFirebaseEvent('Row_update_app_state');

                        _model.updatePage(() {});
                        logFirebaseEvent('Row_bottom_sheet');
                        Navigator.pop(context, true);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Annulla match',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF94040D),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Icon(
                            Icons.delete_rounded,
                            color: Color(0xFF94040D),
                            size: 24.0,
                          ),
                        ],
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['rowOnActionTriggerAnimation2']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
