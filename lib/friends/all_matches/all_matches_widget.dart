import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/match_settings_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'all_matches_model.dart';
export 'all_matches_model.dart';

class AllMatchesWidget extends StatefulWidget {
  const AllMatchesWidget({super.key});

  static String routeName = 'all_matches';
  static String routePath = 'allMatches';

  @override
  State<AllMatchesWidget> createState() => _AllMatchesWidgetState();
}

class _AllMatchesWidgetState extends State<AllMatchesWidget> {
  late AllMatchesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllMatchesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'all_matches'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ALL_MATCHES_all_matches_ON_INIT_STATE');
      logFirebaseEvent('all_matches_update_page_state');
      _model.loading = true;
      safeSetState(() {});
      logFirebaseEvent('all_matches_custom_action');
      _model.retrievedMatches = await actions.getActiveMatches(
        currentUserUid,
      );
      logFirebaseEvent('all_matches_update_page_state');
      _model.loading = false;
      _model.matches = _model.retrievedMatches!.toList().cast<MatchesRecord>();
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: FlutterFlowTheme.of(context).primary,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ALL_MATCHES_keyboard_arrow_left_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'MATCH',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  if (!_model.loading) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 0.0),
                            child: Text(
                              'I match vengono automaticamente eliminati alla fine dell\'evento a cui li si è ottenuti',
                              textAlign: TextAlign.center,
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
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 30.0, 20.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final matchess = _model.matches.toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      30.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: matchess.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 20.0),
                                    itemBuilder: (context, matchessIndex) {
                                      final matchessItem =
                                          matchess[matchessIndex];
                                      return StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            matchessItem
                                                .users
                                                .where((e) =>
                                                    e != currentUserReference)
                                                .toList()
                                                .firstOrNull!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 25.0,
                                                height: 25.0,
                                                child: SpinKitFadingCircle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 25.0,
                                                ),
                                              ),
                                            );
                                          }

                                          final containerUsersRecord =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ALL_MATCHES_CircleImage_6ra2h137_ON_TAP');
                                                        logFirebaseEvent(
                                                            'CircleImage_navigate_to');

                                                        context.pushNamed(
                                                          UserProfileSearchedWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'userRef':
                                                                serializeParam(
                                                              functions.returnDifferentUserRef(
                                                                  matchessItem
                                                                      .users
                                                                      .toList()),
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            containerUsersRecord
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ALL_MATCHES_PAGE_Text_yu2yp50i_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_navigate_to');

                                                              context.pushNamed(
                                                                UserProfileSearchedWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'userRef':
                                                                      serializeParam(
                                                                    functions.returnDifferentUserRef(
                                                                        matchessItem
                                                                            .users
                                                                            .toList()),
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Text(
                                                              '${containerUsersRecord.nome} ${containerUsersRecord.cognome}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        17.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ALL_MATCHES_PAGE_Text_3ayoyxwc_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_navigate_to');

                                                              context.pushNamed(
                                                                EventiProfileWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'eventoRef':
                                                                      serializeParam(
                                                                    functions.returnEventDocReference(
                                                                        matchessItem
                                                                            .eventID),
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'goBack':
                                                                      serializeParam(
                                                                    'matches',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Text(
                                                              matchessItem
                                                                  .eventName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (matchessItem.iAmHereFeature
                                                    .contains(functions
                                                        .returnDifferentUserRef(
                                                            matchessItem.users
                                                                .toList())))
                                                  Text(
                                                    'Arrivato\nall\'evento',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ALL_MATCHES_PAGE_Icon_nvc284op_ON_TAP');
                                                        var _shouldSetState =
                                                            false;
                                                        logFirebaseEvent(
                                                            'Icon_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    MatchSettingsWidget(
                                                                  matchDoc:
                                                                      matchessItem,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(() =>
                                                                _model.reloadMatchesData =
                                                                    value));

                                                        _shouldSetState = true;
                                                        if (_model
                                                            .reloadMatchesData!) {
                                                          logFirebaseEvent(
                                                              'Icon_update_page_state');
                                                          _model.loading = true;
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'Icon_custom_action');
                                                          _model.retrievedMatchesNew =
                                                              await actions
                                                                  .getActiveMatches(
                                                            currentUserUid,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'Icon_update_page_state');
                                                          _model.loading =
                                                              false;
                                                          _model.matches = _model
                                                              .retrievedMatchesNew!
                                                              .toList()
                                                              .cast<
                                                                  MatchesRecord>();
                                                          safeSetState(() {});
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.sort_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Caricando i tuoi match...',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
