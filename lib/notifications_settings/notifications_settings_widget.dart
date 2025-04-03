import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'notifications_settings_model.dart';
export 'notifications_settings_model.dart';

class NotificationsSettingsWidget extends StatefulWidget {
  const NotificationsSettingsWidget({super.key});

  static String routeName = 'notifications_settings';
  static String routePath = 'notifications_settings';

  @override
  State<NotificationsSettingsWidget> createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> {
  late NotificationsSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'notifications_settings'});
    _model.switchValue1 =
        valueOrDefault<bool>(currentUserDocument?.matchesNotifications, false);
    _model.switchValue2 =
        valueOrDefault<bool>(currentUserDocument?.likesNotifications, false);
    _model.switchValue3 = valueOrDefault<bool>(
        currentUserDocument?.friendsRequestsNotifications, false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_Icon_hdvqf6yl_ON_');
                            logFirebaseEvent('Icon_navigate_back');
                            context.safePop();
                          },
                          child: Icon(
                            Icons.chevron_left_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 66.0, 0.0, 0.0),
                    child: Text(
                      'Notifiche',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).primary,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Text(
                'Se non vuoi ricevere nuove notifiche ogni volta che il tuo account riceve un\'interazione puoi scegliere qui quali ricevere.',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).alternate,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: Text(
                'Le modifiche verrano applicate solamente ai nuovi eventi a cui participerai, non a quelli a cui stai già partecipando',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondary,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NOTIFICATIONS_SETTINGS_Row_ap04etqz_ON_T');
                  logFirebaseEvent('Row_navigate_to');

                  context.pushNamed(ModifyDataProfileWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.connect_without_contact,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 26.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Matches',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Switch.adaptive(
                        value: _model.switchValue1!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.switchValue1 = newValue);
                          if (newValue) {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_Switch_gdaqqqix_O');
                            logFirebaseEvent('Switch_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              matchesNotifications: true,
                            ));
                          } else {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_Switch_gdaqqqix_O');
                            logFirebaseEvent('Switch_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              matchesNotifications: false,
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
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NOTIFICATIONS_SETTINGS_Row_vbbjmetj_ON_T');
                  logFirebaseEvent('Row_navigate_to');

                  context.pushNamed(ModifyDataProfileWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Likes',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Switch.adaptive(
                        value: _model.switchValue2!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.switchValue2 = newValue);
                          if (newValue) {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_Switch_sq3h74ib_O');
                            logFirebaseEvent('Switch_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              likesNotifications: true,
                            ));
                          } else {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_Switch_sq3h74ib_O');
                            logFirebaseEvent('Switch_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              likesNotifications: false,
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
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NOTIFICATIONS_SETTINGS_Row_anz2lqop_ON_T');
                  logFirebaseEvent('Row_navigate_to');

                  context.pushNamed(ModifyDataProfileWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.userFriends,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Richieste di amicizia',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Switch.adaptive(
                        value: _model.switchValue3!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.switchValue3 = newValue);
                          if (newValue) {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_Switch_f79vhhme_O');
                            logFirebaseEvent('Switch_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              friendsRequestsNotifications: true,
                            ));
                          } else {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_Switch_f79vhhme_O');
                            logFirebaseEvent('Switch_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              friendsRequestsNotifications: false,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
