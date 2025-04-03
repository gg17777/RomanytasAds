import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/delete_friend_widget.dart';
import '/components/delete_like_widget.dart';
import '/components/delete_request2_widget.dart';
import '/components/delete_request_widget.dart';
import '/components/match_settings_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/friends/empty_friends_request_list/empty_friends_request_list_widget.dart';
import '/friends/empty_likes_list/empty_likes_list_widget.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'main_matches_page_model.dart';
export 'main_matches_page_model.dart';

class MainMatchesPageWidget extends StatefulWidget {
  const MainMatchesPageWidget({super.key});

  static String routeName = 'main_matches_page';
  static String routePath = 'main_matches_page';

  @override
  State<MainMatchesPageWidget> createState() => _MainMatchesPageWidgetState();
}

class _MainMatchesPageWidgetState extends State<MainMatchesPageWidget> {
  late MainMatchesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainMatchesPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'main_matches_page'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_MATCHES_main_matches_page_ON_INIT_S');
      logFirebaseEvent('main_matches_page_update_app_state');
      FFAppState().page = 'friends';
      safeSetState(() {});
      logFirebaseEvent('main_matches_page_update_page_state');
      _model.loading = true;
      _model.loadingSuggestions = true;
      safeSetState(() {});
      logFirebaseEvent('main_matches_page_custom_action');
      _model.retrievedMatches = await actions.getActiveMatches(
        currentUserUid,
      );
      logFirebaseEvent('main_matches_page_update_page_state');
      _model.loading = false;
      _model.matches = _model.retrievedMatches!.toList().cast<MatchesRecord>();
      safeSetState(() {});
      logFirebaseEvent('main_matches_page_custom_action');
      _model.gottenUsers = await actions.getFriendsSuggestions(
        currentUserUid,
      );
      logFirebaseEvent('main_matches_page_update_page_state');
      _model.loadingSuggestions = false;
      safeSetState(() {});
      logFirebaseEvent('main_matches_page_update_page_state');
      _model.suggestions = _model.gottenUsers!.toList().cast<UsersRecord>();
      safeSetState(() {});
      logFirebaseEvent('main_matches_page_custom_action');
      await actions.markAllMatchesAsViewed(
        currentUserUid,
      );
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<List<FriendsRequestRecord>>(
          stream: queryFriendsRequestRecord(
            queryBuilder: (friendsRequestRecord) => friendsRequestRecord
                .where(
                  'Requestee',
                  isEqualTo: currentUserReference,
                )
                .orderBy('dateSent', descending: true),
          ),
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
            List<FriendsRequestRecord>
                containerTopGeneralFriendsRequestRecordList = snapshot.data!;

            return Container(
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 70.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MAIN_MATCHES_Text_1mwh96wo_ON_TAP');
                                logFirebaseEvent('Text_navigate_to');

                                context.pushNamed(
                                    FriendsSuggestionsWidget.routeName);
                              },
                              child: Text(
                                'Notifiche',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MAIN_MATCHES_I_TUOI_MATCH_BTN_ON_TAP');
                                      logFirebaseEvent('Button_page_view');
                                      await _model.pageViewController
                                          ?.animateToPage(
                                        0,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'I tuoi match',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.pageViewCurrentIndex == 0
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .accent3,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MAIN_MATCHES_PAGE_PAGE_LIKES_BTN_ON_TAP');
                                      logFirebaseEvent('Button_page_view');
                                      await _model.pageViewController
                                          ?.animateToPage(
                                        1,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Likes',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.pageViewCurrentIndex == 1
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .accent3,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MAIN_MATCHES_RICHIESTE_DI_AMICIZIA_BTN_O');
                                      logFirebaseEvent('Button_page_view');
                                      await _model.pageViewController
                                          ?.animateToPage(
                                        2,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Richieste di amicizia',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.pageViewCurrentIndex == 2
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .accent3,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 500.0,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: PageView(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      onPageChanged: (_) async {
                                        logFirebaseEvent(
                                            'MAIN_MATCHES_PageView_e6dadomx_ON_WIDGET');
                                        logFirebaseEvent(
                                            'PageView_update_page_state');

                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'PageView_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 1000));
                                        if (_model.pageViewCurrentIndex == 2) {
                                          logFirebaseEvent(
                                              'PageView_custom_action');
                                          await actions
                                              .markFriendRequestsAsViewed();
                                          return;
                                        } else if (_model
                                                .pageViewCurrentIndex ==
                                            1) {
                                          logFirebaseEvent(
                                              'PageView_custom_action');
                                          await actions.markAllLikesAsViewed(
                                            currentUserUid,
                                          );
                                          return;
                                        } else if (_model
                                                .pageViewCurrentIndex ==
                                            0) {
                                          logFirebaseEvent(
                                              'PageView_custom_action');
                                          await actions.markAllMatchesAsViewed(
                                            currentUserUid,
                                          );
                                          return;
                                        } else {
                                          return;
                                        }
                                      },
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (!_model.loading) {
                                                    return Builder(
                                                      builder: (context) {
                                                        if (_model.matches
                                                                .length >
                                                            0) {
                                                          return SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          30.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'I match vengono automaticamente eliminati alla fine dell\'evento a cui li si è ottenuti',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: MediaQuery.sizeOf(context)
                                                                              .height >
                                                                          800.0
                                                                      ? 260.0
                                                                      : 180.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            30.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final match = _model
                                                                            .matches
                                                                            .take(4)
                                                                            .toList()
                                                                            .take(4)
                                                                            .toList();

                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              match.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              SizedBox(height: 20.0),
                                                                          itemBuilder:
                                                                              (context, matchIndex) {
                                                                            final matchItem =
                                                                                match[matchIndex];
                                                                            return StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(matchItem.users.where((e) => e != currentUserReference).toList().firstOrNull!),
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

                                                                                final containerUsersRecord = snapshot.data!;

                                                                                return Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_MATCHES_CircleImage_8isx4ltq_ON_TAP');
                                                                                              logFirebaseEvent('CircleImage_navigate_to');

                                                                                              context.pushNamed(
                                                                                                UserProfileSearchedWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'userRef': serializeParam(
                                                                                                    functions.returnDifferentUserRef(matchItem.users.toList()),
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 60.0,
                                                                                              height: 60.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  containerUsersRecord.photoUrl,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                                                                                ),
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('MAIN_MATCHES_Text_scqjohyq_ON_TAP');
                                                                                                    logFirebaseEvent('Text_navigate_to');

                                                                                                    context.pushNamed(
                                                                                                      UserProfileSearchedWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'userRef': serializeParam(
                                                                                                          functions.returnDifferentUserRef(matchItem.users.toList()),
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    '${containerUsersRecord.nome} ${containerUsersRecord.cognome}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          fontSize: 17.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('MAIN_MATCHES_Text_b2d4i43c_ON_TAP');
                                                                                                    logFirebaseEvent('Text_navigate_to');

                                                                                                    context.pushNamed(
                                                                                                      EventiProfileWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'eventoRef': serializeParam(
                                                                                                          functions.returnEventDocReference(matchItem.eventID),
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                        'goBack': serializeParam(
                                                                                                          'matches',
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    matchItem.eventName,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      if (matchItem.iAmHereFeature.contains(functions.returnDifferentUserRef(matchItem.users.toList())))
                                                                                        Text(
                                                                                          'Arrivato\nall\'evento',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_MATCHES_Icon_hrcdzflr_ON_TAP');
                                                                                              var _shouldSetState = false;
                                                                                              logFirebaseEvent('Icon_bottom_sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                enableDrag: false,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return GestureDetector(
                                                                                                    onTap: () {
                                                                                                      FocusScope.of(context).unfocus();
                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                    },
                                                                                                    child: Padding(
                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                      child: MatchSettingsWidget(
                                                                                                        matchDoc: matchItem,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => safeSetState(() => _model.reloadMatchesData = value));

                                                                                              _shouldSetState = true;
                                                                                              if (_model.reloadMatchesData!) {
                                                                                                logFirebaseEvent('Icon_update_page_state');
                                                                                                _model.loading = true;
                                                                                                safeSetState(() {});
                                                                                                logFirebaseEvent('Icon_custom_action');
                                                                                                _model.retrievedMatchesNew = await actions.getActiveMatches(
                                                                                                  currentUserUid,
                                                                                                );
                                                                                                _shouldSetState = true;
                                                                                                logFirebaseEvent('Icon_update_page_state');
                                                                                                _model.loading = false;
                                                                                                _model.matches = _model.retrievedMatchesNew!.toList().cast<MatchesRecord>();
                                                                                                safeSetState(() {});
                                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                                return;
                                                                                              } else {
                                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                                return;
                                                                                              }

                                                                                              if (_shouldSetState) safeSetState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.sort_rounded,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
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
                                                                if (((MediaQuery.sizeOf(context).height <
                                                                            801.0) &&
                                                                        (_model.matches.length >
                                                                            2)) ||
                                                                    ((MediaQuery.sizeOf(context).height >
                                                                            800.0) &&
                                                                        (_model.matches.length >
                                                                            3)))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'MAIN_MATCHES_Text_9u5n47gb_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Text_navigate_to');

                                                                          context
                                                                              .pushNamed(AllMatchesWidget.routeName);
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'vedi tutti i match',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          );
                                                        } else {
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        0.0,
                                                                        30.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'I match vengono automaticamente eliminati alla fine dell\'evento a cui li si è ottenuti',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        100.0,
                                                                        30.0,
                                                                        100.0),
                                                                child: Text(
                                                                  'Nessun nuovo match',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                      },
                                                    );
                                                  } else {
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Caricando i tuoi match...',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              if (_model.suggestions.length > 0)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0,
                                                                30.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Persone che potresti conoscere',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 60.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final suggestionsFriends =
                                                        _model.suggestions
                                                            .toList()
                                                            .take(10)
                                                            .toList();

                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            suggestionsFriends
                                                                .length,
                                                            (suggestionsFriendsIndex) {
                                                          final suggestionsFriendsItem =
                                                              suggestionsFriends[
                                                                  suggestionsFriendsIndex];
                                                          return StreamBuilder<
                                                              List<
                                                                  FriendsRequestRecord>>(
                                                            stream:
                                                                queryFriendsRequestRecord(
                                                              queryBuilder:
                                                                  (friendsRequestRecord) =>
                                                                      friendsRequestRecord
                                                                          .where(
                                                                            'Requester',
                                                                            isEqualTo:
                                                                                suggestionsFriendsItem.reference,
                                                                          )
                                                                          .where(
                                                                            'Requestee',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 25.0,
                                                                    height:
                                                                        25.0,
                                                                    child:
                                                                        SpinKitFadingCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<FriendsRequestRecord>
                                                                  containerSentFriendFriendsRequestRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final containerSentFriendFriendsRequestRecord =
                                                                  containerSentFriendFriendsRequestRecordList
                                                                          .isNotEmpty
                                                                      ? containerSentFriendFriendsRequestRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        FriendsRequestRecord>>(
                                                                  stream:
                                                                      queryFriendsRequestRecord(
                                                                    queryBuilder: (friendsRequestRecord) =>
                                                                        friendsRequestRecord
                                                                            .where(
                                                                              'Requester',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'Requestee',
                                                                              isEqualTo: suggestionsFriendsItem.reference,
                                                                            ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              25.0,
                                                                          child:
                                                                              SpinKitFadingCircle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<FriendsRequestRecord>
                                                                        containerSentAuthFriendsRequestRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final containerSentAuthFriendsRequestRecord = containerSentAuthFriendsRequestRecordList
                                                                            .isNotEmpty
                                                                        ? containerSentAuthFriendsRequestRecordList
                                                                            .first
                                                                        : null;

                                                                    return Container(
                                                                      width:
                                                                          180.0,
                                                                      height:
                                                                          265.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('MAIN_MATCHES_Column_wxcizv6b_ON_TAP');
                                                                                  logFirebaseEvent('Column_navigate_to');

                                                                                  context.pushNamed(
                                                                                    UserProfileSearchedWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'userRef': serializeParam(
                                                                                        suggestionsFriendsItem.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          valueOrDefault<String>(
                                                                                            suggestionsFriendsItem.photoUrl,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/1as520apcp2z/profilo_eaqf.png',
                                                                                          ),
                                                                                          width: 90.0,
                                                                                          height: 160.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          '${suggestionsFriendsItem.nome} ${suggestionsFriendsItem.cognome}',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          if (!(containerSentAuthFriendsRequestRecord != null) && !(currentUserDocument?.friends.toList() ?? []).contains(suggestionsFriendsItem.reference.id)) {
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('MAIN_MATCHES_Container_lekoq33p_ON_TAP');
                                                                                                logFirebaseEvent('Container_backend_call');

                                                                                                await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                                      requester: currentUserReference,
                                                                                                      requestee: suggestionsFriendsItem.reference,
                                                                                                      status: 'pending',
                                                                                                      dateSent: getCurrentTimestamp,
                                                                                                      viewed: false,
                                                                                                    ));
                                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                                HapticFeedback.lightImpact();
                                                                                                logFirebaseEvent('Container_backend_call');

                                                                                                await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                                      type: 'suggestions',
                                                                                                    ));
                                                                                                logFirebaseEvent('Container_trigger_push_notification');
                                                                                                triggerPushNotification(
                                                                                                  notificationTitle: 'Richiesta di amicizia',
                                                                                                  notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                                  notificationImageUrl: currentUserPhoto,
                                                                                                  notificationSound: 'default',
                                                                                                  userRefs: [
                                                                                                    suggestionsFriendsItem.reference
                                                                                                  ],
                                                                                                  initialPageName: 'friendsRequests',
                                                                                                  parameterData: {},
                                                                                                );
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 132.0,
                                                                                                height: 32.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Richiedi amicizia',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          } else if ((currentUserDocument?.friends.toList() ?? []).contains(suggestionsFriendsItem.reference.id)) {
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('MAIN_MATCHES_Container_nygxt37p_ON_TAP');
                                                                                                logFirebaseEvent('Container_bottom_sheet');
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  enableDrag: false,
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () {
                                                                                                        FocusScope.of(context).unfocus();
                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                      },
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                        child: DeleteFriendWidget(
                                                                                                          friendsUserRef: suggestionsFriendsItem.reference,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 110.0,
                                                                                                height: 32.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Siete amici',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          } else if (containerSentAuthFriendsRequestRecord != null) {
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('MAIN_MATCHES_Container_jcpegyy2_ON_TAP');
                                                                                                logFirebaseEvent('Container_bottom_sheet');
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  enableDrag: false,
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () {
                                                                                                        FocusScope.of(context).unfocus();
                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                      },
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                        child: DeleteRequestWidget(
                                                                                                          requestRef: containerSentAuthFriendsRequestRecord.reference,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 132.0,
                                                                                                height: 32.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Richiesta inviata',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          } else if (containerSentAuthFriendsRequestRecord != null) {
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('MAIN_MATCHES_Container_inh20gj7_ON_TAP');
                                                                                                logFirebaseEvent('Container_custom_action');
                                                                                                await actions.addFriend(
                                                                                                  suggestionsFriendsItem.reference.id,
                                                                                                  currentUserReference!.id,
                                                                                                );
                                                                                                logFirebaseEvent('Container_backend_call');

                                                                                                await RequestAcceptedRecord.collection.doc().set(createRequestAcceptedRecordData(
                                                                                                      date: getCurrentTimestamp,
                                                                                                    ));
                                                                                                logFirebaseEvent('Container_trigger_push_notification');
                                                                                                triggerPushNotification(
                                                                                                  notificationTitle: '${suggestionsFriendsItem.nome} ha accettato la tua richiesta di amicizia!',
                                                                                                  notificationText: '',
                                                                                                  notificationSound: 'default',
                                                                                                  userRefs: [
                                                                                                    suggestionsFriendsItem.reference
                                                                                                  ],
                                                                                                  initialPageName: 'Profilo',
                                                                                                  parameterData: {},
                                                                                                );
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 132.0,
                                                                                                height: 32.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Accetta richiesta',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          } else {
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('MAIN_MATCHES_Container_fbjtuh27_ON_TAP');
                                                                                                logFirebaseEvent('Container_backend_call');

                                                                                                await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                                      requester: currentUserReference,
                                                                                                      requestee: suggestionsFriendsItem.reference,
                                                                                                      status: 'pending',
                                                                                                      dateSent: getCurrentTimestamp,
                                                                                                      viewed: false,
                                                                                                    ));
                                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                                HapticFeedback.lightImpact();
                                                                                                logFirebaseEvent('Container_backend_call');

                                                                                                await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                                      type: 'suggestions',
                                                                                                    ));
                                                                                                logFirebaseEvent('Container_trigger_push_notification');
                                                                                                triggerPushNotification(
                                                                                                  notificationTitle: 'Richiesta di amicizia',
                                                                                                  notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                                  notificationImageUrl: currentUserPhoto,
                                                                                                  notificationSound: 'default',
                                                                                                  userRefs: [
                                                                                                    suggestionsFriendsItem.reference
                                                                                                  ],
                                                                                                  initialPageName: 'friendsRequests',
                                                                                                  parameterData: {},
                                                                                                );
                                                                                                logFirebaseEvent('Container_update_page_state');

                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 132.0,
                                                                                                height: 32.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Richiedi amicizia',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('MAIN_MATCHES_Icon_vkgzeph6_ON_TAP');
                                                                                    logFirebaseEvent('Icon_backend_call');

                                                                                    await currentUserReference!.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'didntLikeSuggestions': FieldValue.arrayUnion([
                                                                                            suggestionsFriendsItem.uid
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    logFirebaseEvent('Icon_update_page_state');
                                                                                    _model.removeAtIndexFromSuggestions(suggestionsFriendsIndex);
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.close_sharp,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }).divide(SizedBox(
                                                            width: 15.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        StreamBuilder<List<LikesRecord>>(
                                          stream: queryLikesRecord(
                                            parent: currentUserReference,
                                            queryBuilder: (likesRecord) =>
                                                likesRecord.orderBy(
                                                    'created_time',
                                                    descending: true),
                                            limit: 5,
                                          ),
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
                                            List<LikesRecord>
                                                containerLikesRecordList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Text(
                                                                'I likes scompaiono alla fine dell\'evento a cui li si è ottenuti.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height >
                                                                      750.0
                                                                  ? 250.0
                                                                  : 135.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final like = containerLikesRecordList
                                                                        .toList()
                                                                        .take(4)
                                                                        .toList();
                                                                    if (like
                                                                        .isEmpty) {
                                                                      return EmptyLikesListWidget();
                                                                    }

                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          like.length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          SizedBox(
                                                                              height: 25.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              likeIndex) {
                                                                        final likeItem =
                                                                            like[likeIndex];
                                                                        return Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (likeItem.dateTime! >=
                                                                                getCurrentTimestamp) {
                                                                              return StreamBuilder<UsersRecord>(
                                                                                stream: UsersRecord.getDocument(likeItem.userRef!),
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

                                                                                  final rowUsersRecord = snapshot.data!;

                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('MAIN_MATCHES_Row_5ybyc9l9_ON_TAP');
                                                                                      logFirebaseEvent('Row_navigate_to');

                                                                                      context.pushNamed(
                                                                                        EventiProfileWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'eventoRef': serializeParam(
                                                                                            likeItem.eventID,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'goBack': serializeParam(
                                                                                            'likes',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Icon(
                                                                                                      Icons.favorite_border_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 35.0,
                                                                                                    ),
                                                                                                    Flexible(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Hai ricevuto un like all\'evento (${likeItem.eventName})',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Montserrat',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          dateTimeFormat(
                                                                                            "relative",
                                                                                            rowUsersRecord.createdTime!,
                                                                                            locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              FaIcon(
                                                                                                FontAwesomeIcons.sadCry,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 30.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Hai perso un like all\'evento (${likeItem.eventName})',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          "relative",
                                                                                          likeItem.createdTime!,
                                                                                          locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('MAIN_MATCHES_Icon_ypi5mz6w_ON_TAP');
                                                                                            logFirebaseEvent('Icon_bottom_sheet');
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(context).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: DeleteLikeWidget(
                                                                                                      likeRef: likeItem.reference,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.delete_sweep_outlined,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 30.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }
                                                                          },
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            if (((MediaQuery.sizeOf(context)
                                                                            .height <
                                                                        751.0) &&
                                                                    (containerLikesRecordList
                                                                            .length >
                                                                        2)) ||
                                                                ((MediaQuery.sizeOf(context)
                                                                            .height >
                                                                        750.0) &&
                                                                    (containerLikesRecordList
                                                                            .length >
                                                                        4)))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'MAIN_MATCHES_Text_hzhzmfys_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Text_navigate_to');

                                                                      context.pushNamed(
                                                                          AllLikesWidget
                                                                              .routeName);
                                                                    },
                                                                    child: Text(
                                                                      'vedi tutti i like',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  40.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (_model.suggestions
                                                                  .length >
                                                              0)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        30.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Persone che potresti conoscere',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        20.0,
                                                                        20.0,
                                                                        20.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final suggestionsFriends = _model
                                                                    .suggestions
                                                                    .toList()
                                                                    .take(10)
                                                                    .toList();

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        suggestionsFriends
                                                                            .length,
                                                                        (suggestionsFriendsIndex) {
                                                                      final suggestionsFriendsItem =
                                                                          suggestionsFriends[
                                                                              suggestionsFriendsIndex];
                                                                      return StreamBuilder<
                                                                          List<
                                                                              FriendsRequestRecord>>(
                                                                        stream:
                                                                            queryFriendsRequestRecord(
                                                                          queryBuilder: (friendsRequestRecord) => friendsRequestRecord
                                                                              .where(
                                                                                'Requester',
                                                                                isEqualTo: suggestionsFriendsItem.reference,
                                                                              )
                                                                              .where(
                                                                                'Requestee',
                                                                                isEqualTo: currentUserReference,
                                                                              ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<FriendsRequestRecord>
                                                                              containerSentFriendFriendsRequestRecordList =
                                                                              snapshot.data!;
                                                                          final containerSentFriendFriendsRequestRecord = containerSentFriendFriendsRequestRecordList.isNotEmpty
                                                                              ? containerSentFriendFriendsRequestRecordList.first
                                                                              : null;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                StreamBuilder<List<FriendsRequestRecord>>(
                                                                              stream: queryFriendsRequestRecord(
                                                                                queryBuilder: (friendsRequestRecord) => friendsRequestRecord
                                                                                    .where(
                                                                                      'Requester',
                                                                                      isEqualTo: currentUserReference,
                                                                                    )
                                                                                    .where(
                                                                                      'Requestee',
                                                                                      isEqualTo: suggestionsFriendsItem.reference,
                                                                                    ),
                                                                                singleRecord: true,
                                                                              ),
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
                                                                                List<FriendsRequestRecord> containerSentAuthFriendsRequestRecordList = snapshot.data!;
                                                                                final containerSentAuthFriendsRequestRecord = containerSentAuthFriendsRequestRecordList.isNotEmpty ? containerSentAuthFriendsRequestRecordList.first : null;

                                                                                return Container(
                                                                                  width: 180.0,
                                                                                  height: 270.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent4,
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_MATCHES_Column_h8hpo0xo_ON_TAP');
                                                                                              logFirebaseEvent('Column_navigate_to');

                                                                                              context.pushNamed(
                                                                                                UserProfileSearchedWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'userRef': serializeParam(
                                                                                                    suggestionsFriendsItem.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      valueOrDefault<String>(
                                                                                                        suggestionsFriendsItem.photoUrl,
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/1as520apcp2z/profilo_eaqf.png',
                                                                                                      ),
                                                                                                      width: 90.0,
                                                                                                      height: 160.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Flexible(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      '${suggestionsFriendsItem.nome} ${suggestionsFriendsItem.cognome}',
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            fontSize: 13.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      if (!(containerSentAuthFriendsRequestRecord != null) && !(currentUserDocument?.friends.toList() ?? []).contains(suggestionsFriendsItem.reference.id)) {
                                                                                                        return InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('MAIN_MATCHES_Container_4tk30ry7_ON_TAP');
                                                                                                            logFirebaseEvent('Container_backend_call');

                                                                                                            await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                                                  requester: currentUserReference,
                                                                                                                  requestee: suggestionsFriendsItem.reference,
                                                                                                                  status: 'pending',
                                                                                                                  dateSent: getCurrentTimestamp,
                                                                                                                  viewed: false,
                                                                                                                ));
                                                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                                                            HapticFeedback.lightImpact();
                                                                                                            logFirebaseEvent('Container_backend_call');

                                                                                                            await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                                                  type: 'suggestions',
                                                                                                                ));
                                                                                                            logFirebaseEvent('Container_trigger_push_notification');
                                                                                                            triggerPushNotification(
                                                                                                              notificationTitle: 'Richiesta di amicizia',
                                                                                                              notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                                              notificationImageUrl: currentUserPhoto,
                                                                                                              notificationSound: 'default',
                                                                                                              userRefs: [
                                                                                                                suggestionsFriendsItem.reference
                                                                                                              ],
                                                                                                              initialPageName: 'friendsRequests',
                                                                                                              parameterData: {},
                                                                                                            );
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 133.0,
                                                                                                            height: 32.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  'Richiedi amicizia',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Montserrat',
                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      } else if ((currentUserDocument?.friends.toList() ?? []).contains(suggestionsFriendsItem.reference.id)) {
                                                                                                        return InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('MAIN_MATCHES_Container_mhjcm6u7_ON_TAP');
                                                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                                                            await showModalBottomSheet(
                                                                                                              isScrollControlled: true,
                                                                                                              backgroundColor: Colors.transparent,
                                                                                                              enableDrag: false,
                                                                                                              context: context,
                                                                                                              builder: (context) {
                                                                                                                return GestureDetector(
                                                                                                                  onTap: () {
                                                                                                                    FocusScope.of(context).unfocus();
                                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                  },
                                                                                                                  child: Padding(
                                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                                    child: DeleteFriendWidget(
                                                                                                                      friendsUserRef: suggestionsFriendsItem.reference,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 110.0,
                                                                                                            height: 32.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  'Siete amici',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Montserrat',
                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      } else if (containerSentAuthFriendsRequestRecord != null) {
                                                                                                        return InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('MAIN_MATCHES_Container_s21g18vg_ON_TAP');
                                                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                                                            await showModalBottomSheet(
                                                                                                              isScrollControlled: true,
                                                                                                              backgroundColor: Colors.transparent,
                                                                                                              enableDrag: false,
                                                                                                              context: context,
                                                                                                              builder: (context) {
                                                                                                                return GestureDetector(
                                                                                                                  onTap: () {
                                                                                                                    FocusScope.of(context).unfocus();
                                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                  },
                                                                                                                  child: Padding(
                                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                                    child: DeleteRequestWidget(
                                                                                                                      requestRef: containerSentAuthFriendsRequestRecord.reference,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 132.0,
                                                                                                            height: 32.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  'Richiesta inviata',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Montserrat',
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      } else if (containerSentAuthFriendsRequestRecord != null) {
                                                                                                        return InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('MAIN_MATCHES_Container_ue6k9koc_ON_TAP');
                                                                                                            logFirebaseEvent('Container_custom_action');
                                                                                                            await actions.addFriend(
                                                                                                              suggestionsFriendsItem.reference.id,
                                                                                                              currentUserReference!.id,
                                                                                                            );
                                                                                                            logFirebaseEvent('Container_backend_call');

                                                                                                            await RequestAcceptedRecord.collection.doc().set(createRequestAcceptedRecordData(
                                                                                                                  date: getCurrentTimestamp,
                                                                                                                ));
                                                                                                            logFirebaseEvent('Container_trigger_push_notification');
                                                                                                            triggerPushNotification(
                                                                                                              notificationTitle: '${suggestionsFriendsItem.nome} ha accettato la tua richiesta di amicizia!',
                                                                                                              notificationText: '',
                                                                                                              notificationSound: 'default',
                                                                                                              userRefs: [
                                                                                                                suggestionsFriendsItem.reference
                                                                                                              ],
                                                                                                              initialPageName: 'Profilo',
                                                                                                              parameterData: {},
                                                                                                            );
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 132.0,
                                                                                                            height: 32.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                'Accetta richiesta',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Montserrat',
                                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      } else {
                                                                                                        return InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('MAIN_MATCHES_Container_tudg17gk_ON_TAP');
                                                                                                            logFirebaseEvent('Container_backend_call');

                                                                                                            await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                                                  requester: currentUserReference,
                                                                                                                  requestee: suggestionsFriendsItem.reference,
                                                                                                                  status: 'pending',
                                                                                                                  dateSent: getCurrentTimestamp,
                                                                                                                  viewed: false,
                                                                                                                ));
                                                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                                                            HapticFeedback.lightImpact();
                                                                                                            logFirebaseEvent('Container_backend_call');

                                                                                                            await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                                                  type: 'suggestions',
                                                                                                                ));
                                                                                                            logFirebaseEvent('Container_trigger_push_notification');
                                                                                                            triggerPushNotification(
                                                                                                              notificationTitle: 'Richiesta di amicizia',
                                                                                                              notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                                              notificationImageUrl: currentUserPhoto,
                                                                                                              notificationSound: 'default',
                                                                                                              userRefs: [
                                                                                                                suggestionsFriendsItem.reference
                                                                                                              ],
                                                                                                              initialPageName: 'friendsRequests',
                                                                                                              parameterData: {},
                                                                                                            );
                                                                                                            logFirebaseEvent('Container_update_page_state');

                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 132.0,
                                                                                                            height: 32.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                'Richiedi amicizia',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Montserrat',
                                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('MAIN_MATCHES_Icon_vh7y0a7i_ON_TAP');
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                await currentUserReference!.update({
                                                                                                  ...mapToFirestore(
                                                                                                    {
                                                                                                      'didntLikeSuggestions': FieldValue.arrayUnion([
                                                                                                        suggestionsFriendsItem.uid
                                                                                                      ]),
                                                                                                    },
                                                                                                  ),
                                                                                                });
                                                                                                logFirebaseEvent('Icon_update_page_state');
                                                                                                _model.removeAtIndexFromSuggestions(suggestionsFriendsIndex);
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.close_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            15.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 0.0, 30.0, 0.0),
                                                child: Text(
                                                  'Qui puoi visualizzare le richieste di amicizia che ricevi.',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                                .height >
                                                            750.0
                                                        ? 225.0
                                                        : 155.0,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 10.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final friendsRequest =
                                                          containerTopGeneralFriendsRequestRecordList
                                                              .take(4)
                                                              .toList()
                                                              .take(4)
                                                              .toList();
                                                      if (friendsRequest
                                                          .isEmpty) {
                                                        return Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              EmptyFriendsRequestListWidget(),
                                                        );
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            friendsRequest
                                                                .length,
                                                        itemBuilder: (context,
                                                            friendsRequestIndex) {
                                                          final friendsRequestItem =
                                                              friendsRequest[
                                                                  friendsRequestIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: StreamBuilder<
                                                                UsersRecord>(
                                                              stream: UsersRecord
                                                                  .getDocument(
                                                                      friendsRequestItem
                                                                          .requester!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          25.0,
                                                                      height:
                                                                          25.0,
                                                                      child:
                                                                          SpinKitFadingCircle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final rowUsersRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'MAIN_MATCHES_Row_xun735k7_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Row_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            UserProfileSearchedWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'userRef': serializeParam(
                                                                                rowUsersRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        rowUsersRecord.photoUrl,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                                                                      ),
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        '${rowUsersRecord.nome} ${rowUsersRecord.cognome}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 10.0, 0.0),
                                                                                    child: Text(
                                                                                      dateTimeFormat(
                                                                                        "relative",
                                                                                        friendsRequestItem.dateSent!,
                                                                                        locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('MAIN_MATCHES_CONFERMA_BTN_ON_TAP');
                                                                                logFirebaseEvent('Button_custom_action');
                                                                                await actions.addFriend(
                                                                                  friendsRequestItem.requestee!.id,
                                                                                  friendsRequestItem.requester!.id,
                                                                                );
                                                                                logFirebaseEvent('Button_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('Button_backend_call');
                                                                                await friendsRequestItem.reference.delete();
                                                                                logFirebaseEvent('Button_backend_call');

                                                                                await RequestAcceptedRecord.collection.doc().set(createRequestAcceptedRecordData(
                                                                                      date: getCurrentTimestamp,
                                                                                    ));
                                                                                logFirebaseEvent('Button_trigger_push_notification');
                                                                                triggerPushNotification(
                                                                                  notificationTitle: '${rowUsersRecord.nome} ha accettato la tua richiesta di amicizia!',
                                                                                  notificationText: '',
                                                                                  notificationSound: 'default',
                                                                                  userRefs: [
                                                                                    friendsRequestItem.requester!
                                                                                  ],
                                                                                  initialPageName: 'Profilo',
                                                                                  parameterData: {},
                                                                                );
                                                                              },
                                                                              text: 'Conferma',
                                                                              options: FFButtonOptions(
                                                                                height: 30.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              showLoadingIndicator: false,
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('MAIN_MATCHES_ELIMINA_BTN_ON_TAP');
                                                                                logFirebaseEvent('Button_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(context).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: DeleteRequest2Widget(
                                                                                          requestRef: friendsRequestItem.reference,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));

                                                                                logFirebaseEvent('Button_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                              },
                                                                              text: 'Elimina',
                                                                              options: FFButtonOptions(
                                                                                height: 30.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: Color(0xFF1E1E1E),
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              showLoadingIndicator: false,
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 5.0)),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (((MediaQuery.sizeOf(
                                                                        context)
                                                                    .height <
                                                                751.0) &&
                                                            (containerTopGeneralFriendsRequestRecordList
                                                                    .length >
                                                                2)) ||
                                                        ((MediaQuery.sizeOf(
                                                                        context)
                                                                    .height >
                                                                750.0) &&
                                                            (containerTopGeneralFriendsRequestRecordList
                                                                    .length >
                                                                3)))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      5.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: InkWell(
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
                                                                  'MAIN_MATCHES_Text_aq7bhjdl_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_navigate_to');

                                                              context.pushNamed(
                                                                  AllFriendsRequestsWidget
                                                                      .routeName);
                                                            },
                                                            child: Text(
                                                              'vedi tutte le richieste',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.suggestions
                                                            .length >
                                                        0)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      30.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Persone che potresti conoscere',
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
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  20.0,
                                                                  20.0,
                                                                  20.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final suggestionsFriends =
                                                              _model.suggestions
                                                                  .toList()
                                                                  .take(10)
                                                                  .toList();

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  suggestionsFriends
                                                                      .length,
                                                                  (suggestionsFriendsIndex) {
                                                                final suggestionsFriendsItem =
                                                                    suggestionsFriends[
                                                                        suggestionsFriendsIndex];
                                                                return StreamBuilder<
                                                                    List<
                                                                        FriendsRequestRecord>>(
                                                                  stream:
                                                                      queryFriendsRequestRecord(
                                                                    queryBuilder: (friendsRequestRecord) =>
                                                                        friendsRequestRecord
                                                                            .where(
                                                                              'Requester',
                                                                              isEqualTo: suggestionsFriendsItem.reference,
                                                                            )
                                                                            .where(
                                                                              'Requestee',
                                                                              isEqualTo: currentUserReference,
                                                                            ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              25.0,
                                                                          child:
                                                                              SpinKitFadingCircle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<FriendsRequestRecord>
                                                                        containerSentFriendFriendsRequestRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final containerSentFriendFriendsRequestRecord = containerSentFriendFriendsRequestRecordList
                                                                            .isNotEmpty
                                                                        ? containerSentFriendFriendsRequestRecordList
                                                                            .first
                                                                        : null;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              FriendsRequestRecord>>(
                                                                        stream:
                                                                            queryFriendsRequestRecord(
                                                                          queryBuilder: (friendsRequestRecord) => friendsRequestRecord
                                                                              .where(
                                                                                'Requester',
                                                                                isEqualTo: currentUserReference,
                                                                              )
                                                                              .where(
                                                                                'Requestee',
                                                                                isEqualTo: suggestionsFriendsItem.reference,
                                                                              ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<FriendsRequestRecord>
                                                                              containerSentAuthFriendsRequestRecordList =
                                                                              snapshot.data!;
                                                                          final containerSentAuthFriendsRequestRecord = containerSentAuthFriendsRequestRecordList.isNotEmpty
                                                                              ? containerSentAuthFriendsRequestRecordList.first
                                                                              : null;

                                                                          return Container(
                                                                            width:
                                                                                180.0,
                                                                            height:
                                                                                270.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Stack(
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_MATCHES_Column_0ude21ym_ON_TAP');
                                                                                        logFirebaseEvent('Column_navigate_to');

                                                                                        context.pushNamed(
                                                                                          UserProfileSearchedWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'userRef': serializeParam(
                                                                                              suggestionsFriendsItem.reference,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  suggestionsFriendsItem.photoUrl,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/1as520apcp2z/profilo_eaqf.png',
                                                                                                ),
                                                                                                width: 90.0,
                                                                                                height: 160.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                '${suggestionsFriendsItem.nome} ${suggestionsFriendsItem.cognome}',
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                if (!(containerSentAuthFriendsRequestRecord != null) && !(currentUserDocument?.friends.toList() ?? []).contains(suggestionsFriendsItem.reference.id)) {
                                                                                                  return InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MAIN_MATCHES_Container_ee9smwpp_ON_TAP');
                                                                                                      logFirebaseEvent('Container_backend_call');

                                                                                                      await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                                            requester: currentUserReference,
                                                                                                            requestee: suggestionsFriendsItem.reference,
                                                                                                            status: 'pending',
                                                                                                            dateSent: getCurrentTimestamp,
                                                                                                            viewed: false,
                                                                                                          ));
                                                                                                      logFirebaseEvent('Container_haptic_feedback');
                                                                                                      HapticFeedback.lightImpact();
                                                                                                      logFirebaseEvent('Container_backend_call');

                                                                                                      await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                                            type: 'suggestions',
                                                                                                          ));
                                                                                                      logFirebaseEvent('Container_trigger_push_notification');
                                                                                                      triggerPushNotification(
                                                                                                        notificationTitle: 'Richiesta di amicizia',
                                                                                                        notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                                        notificationImageUrl: currentUserPhoto,
                                                                                                        notificationSound: 'default',
                                                                                                        userRefs: [
                                                                                                          suggestionsFriendsItem.reference
                                                                                                        ],
                                                                                                        initialPageName: 'friendsRequests',
                                                                                                        parameterData: {},
                                                                                                      );
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 133.0,
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'Richiedi amicizia',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Montserrat',
                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                } else if ((currentUserDocument?.friends.toList() ?? []).contains(suggestionsFriendsItem.reference.id)) {
                                                                                                  return InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MAIN_MATCHES_Container_qhbvcbah_ON_TAP');
                                                                                                      logFirebaseEvent('Container_bottom_sheet');
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        enableDrag: false,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return GestureDetector(
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(context).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: DeleteFriendWidget(
                                                                                                                friendsUserRef: suggestionsFriendsItem.reference,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 110.0,
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).accent3,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Siete amici',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Montserrat',
                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                fontSize: 13.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                } else if (containerSentAuthFriendsRequestRecord != null) {
                                                                                                  return InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MAIN_MATCHES_Container_q4lu5l02_ON_TAP');
                                                                                                      logFirebaseEvent('Container_bottom_sheet');
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        enableDrag: false,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return GestureDetector(
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(context).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: DeleteRequestWidget(
                                                                                                                requestRef: containerSentAuthFriendsRequestRecord.reference,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 132.0,
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).accent3,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'Richiesta inviata',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Montserrat',
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                } else if (containerSentAuthFriendsRequestRecord != null) {
                                                                                                  return InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MAIN_MATCHES_Container_66zscwu8_ON_TAP');
                                                                                                      logFirebaseEvent('Container_custom_action');
                                                                                                      await actions.addFriend(
                                                                                                        suggestionsFriendsItem.reference.id,
                                                                                                        currentUserReference!.id,
                                                                                                      );
                                                                                                      logFirebaseEvent('Container_backend_call');

                                                                                                      await RequestAcceptedRecord.collection.doc().set(createRequestAcceptedRecordData(
                                                                                                            date: getCurrentTimestamp,
                                                                                                          ));
                                                                                                      logFirebaseEvent('Container_trigger_push_notification');
                                                                                                      triggerPushNotification(
                                                                                                        notificationTitle: '${suggestionsFriendsItem.nome} ha accettato la tua richiesta di amicizia!',
                                                                                                        notificationText: '',
                                                                                                        notificationSound: 'default',
                                                                                                        userRefs: [
                                                                                                          suggestionsFriendsItem.reference
                                                                                                        ],
                                                                                                        initialPageName: 'Profilo',
                                                                                                        parameterData: {},
                                                                                                      );
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 133.0,
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'Accetta richiesta',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Montserrat',
                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                } else {
                                                                                                  return InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MAIN_MATCHES_Container_t7fgkkcy_ON_TAP');
                                                                                                      logFirebaseEvent('Container_backend_call');

                                                                                                      await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                                            requester: currentUserReference,
                                                                                                            requestee: suggestionsFriendsItem.reference,
                                                                                                            status: 'pending',
                                                                                                            dateSent: getCurrentTimestamp,
                                                                                                            viewed: false,
                                                                                                          ));
                                                                                                      logFirebaseEvent('Container_haptic_feedback');
                                                                                                      HapticFeedback.lightImpact();
                                                                                                      logFirebaseEvent('Container_backend_call');

                                                                                                      await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                                            type: 'suggestions',
                                                                                                          ));
                                                                                                      logFirebaseEvent('Container_trigger_push_notification');
                                                                                                      triggerPushNotification(
                                                                                                        notificationTitle: 'Richiesta di amicizia',
                                                                                                        notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                                        notificationImageUrl: currentUserPhoto,
                                                                                                        notificationSound: 'default',
                                                                                                        userRefs: [
                                                                                                          suggestionsFriendsItem.reference
                                                                                                        ],
                                                                                                        initialPageName: 'friendsRequests',
                                                                                                        parameterData: {},
                                                                                                      );
                                                                                                      logFirebaseEvent('Container_update_page_state');

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 133.0,
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'Richiedi amicizia',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Montserrat',
                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, -1.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('MAIN_MATCHES_Icon_lszwzhsc_ON_TAP');
                                                                                          logFirebaseEvent('Icon_backend_call');

                                                                                          await currentUserReference!.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'didntLikeSuggestions': FieldValue.arrayUnion([
                                                                                                  suggestionsFriendsItem.uid
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('Icon_update_page_state');
                                                                                          _model.removeAtIndexFromSuggestions(suggestionsFriendsIndex);
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.close_sharp,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).divide(SizedBox(
                                                                  width: 15.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
            );
          },
        ),
      ),
    );
  }
}
