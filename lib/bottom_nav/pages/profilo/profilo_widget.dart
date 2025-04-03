import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'profilo_model.dart';
export 'profilo_model.dart';

class ProfiloWidget extends StatefulWidget {
  const ProfiloWidget({super.key});

  static String routeName = 'Profilo';
  static String routePath = 'profilo';

  @override
  State<ProfiloWidget> createState() => _ProfiloWidgetState();
}

class _ProfiloWidgetState extends State<ProfiloWidget> {
  late ProfiloModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfiloModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profilo'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILO_PAGE_Profilo_ON_INIT_STATE');
      logFirebaseEvent('Profilo_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('Profilo_update_app_state');
      FFAppState().page = 'profile';
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 70.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PROFILO_PAGE_Text_rshs2pwt_ON_TAP');
                                    logFirebaseEvent('Text_navigate_to');

                                    context
                                        .pushNamed(FriendsListWidget.routeName);
                                  },
                                  child: Text(
                                    '${(currentUserDocument?.friends.toList() ?? []).length.toString()}${(currentUserDocument?.friends.toList() ?? []).length == 1 ? ' amico' : ' amici'}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PROFILO_PAGE_Container_ibronwxr_ON_TAP');
                                      if (isiOS) {
                                        logFirebaseEvent('Container_share');
                                        await Share.share(
                                          'Scarica anche tu OutOut! https://apps.apple.com/it/app/romanytas/id6502392562',
                                          sharePositionOrigin:
                                              getWidgetBoundingBox(context),
                                        );
                                        logFirebaseEvent(
                                            'Container_backend_call');

                                        await CountInvitaAmiciRecord.collection
                                            .doc()
                                            .set(
                                                createCountInvitaAmiciRecordData(
                                              date: getCurrentTimestamp,
                                              device: 'iOS',
                                            ));
                                      } else {
                                        logFirebaseEvent('Container_share');
                                        await Share.share(
                                          'Scarica anche tu OutOut! https://play.google.com/store/apps/details?id=com.mycompany.romanita&hl=en',
                                          sharePositionOrigin:
                                              getWidgetBoundingBox(context),
                                        );
                                        logFirebaseEvent(
                                            'Container_backend_call');

                                        await CountInvitaAmiciRecord.collection
                                            .doc()
                                            .set(
                                                createCountInvitaAmiciRecordData(
                                              date: getCurrentTimestamp,
                                              device: 'Android',
                                            ));
                                      }
                                    },
                                    child: Container(
                                      width: 120.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Invita amici',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (loggedIn)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PROFILO_PAGE_Icon_qnmbr6gb_ON_TAP');
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(SettingsWidget.routeName);
                              },
                              child: Icon(
                                Icons.menu_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PROFILO_PAGE_Stack_dukh8xgr_ON_TAP');
                                    if (loggedIn) {
                                      logFirebaseEvent('Stack_navigate_to');

                                      context.pushNamed(
                                          NewPhotoProfileWidget.routeName);
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 3.0,
                                              ),
                                            ),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PROFILO_PAGE_CircleImage_ee0bft5t_ON_TAP');
                                                  if (loggedIn) {
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                        NewPhotoProfileWidget
                                                            .routeName);
                                                  }
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/1as520apcp2z/profilo_eaqf.png',
                                                    ),
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.65,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.5,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (loggedIn)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault(
                                              currentUserDocument?.nome, ''),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault(
                                                currentUserDocument?.cognome,
                                                ''),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFILO_PAGE_Text_t7g0ashe_ON_TAP');
                                        logFirebaseEvent('Text_navigate_to');

                                        context.pushNamed(
                                            ModifyBioWidget.routeName);
                                      },
                                      child: Text(
                                        valueOrDefault(
                                                        currentUserDocument
                                                            ?.bioProfile,
                                                        '') !=
                                                    ''
                                            ? valueOrDefault(
                                                currentUserDocument?.bioProfile,
                                                '')
                                            : 'Aggiungi una bio al tuo profilo',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.bioProfile,
                                                              '') !=
                                                          ''
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.university,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PROFILO_PAGE_Text_8ozs18e5_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_navigate_to');

                                            context.pushNamed(
                                                ModifyUniWidget.routeName);
                                          },
                                          child: Text(
                                            valueOrDefault(
                                                            currentUserDocument
                                                                ?.uni,
                                                            '') !=
                                                        ''
                                                ? valueOrDefault(
                                                    currentUserDocument?.uni,
                                                    '')
                                                : 'Aggiungi Uni',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.uni,
                                                                  '') !=
                                                              ''
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 30.0, 20.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PROFILO_PAGE_Container_0qd9uyb9_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                              MyEventsWidget.routeName);
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'I miei eventi',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PROFILO_PAGE_Container_jj0pe8nb_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                              SynchroniseContactsAgainWidget
                                                  .routeName);
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'Trova amici',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 110.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.bottomNavOutOutModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BottomNavOutOutWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
