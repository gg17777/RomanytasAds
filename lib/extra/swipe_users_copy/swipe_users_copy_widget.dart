import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/new_match_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'swipe_users_copy_model.dart';
export 'swipe_users_copy_model.dart';

class SwipeUsersCopyWidget extends StatefulWidget {
  const SwipeUsersCopyWidget({
    super.key,
    required this.eventId,
    required this.eventRef,
    required this.eventName,
  });

  final String? eventId;
  final DocumentReference? eventRef;
  final String? eventName;

  static String routeName = 'swipe_usersCopy';
  static String routePath = 'swipe';

  @override
  State<SwipeUsersCopyWidget> createState() => _SwipeUsersCopyWidgetState();
}

class _SwipeUsersCopyWidgetState extends State<SwipeUsersCopyWidget> {
  late SwipeUsersCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeUsersCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'swipe_usersCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SWIPE_USERS_COPY_swipe_usersCopy_ON_INIT');
      logFirebaseEvent('swipe_usersCopy_update_page_state');
      _model.loading = true;
      safeSetState(() {});
      logFirebaseEvent('swipe_usersCopy_custom_action');
      _model.users = await actions.getUnswipedParticipants(
        widget.eventId!,
        currentUserUid,
      );
      logFirebaseEvent('swipe_usersCopy_update_page_state');
      _model.listUsers = _model.users!.toList().cast<SwipeStruct>();
      _model.loading = false;
      _model.swipesLeft = _model.users?.length;
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
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [FlutterFlowTheme.of(context).primary, Colors.black],
              stops: [0.0, 0.5],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  if (!_model.loading) {
                    return Builder(
                      builder: (context) {
                        if ((_model.listUsers.length > 0) &&
                            (_model.swipesLeft != 0)) {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 90.0, 0.0, 90.0),
                            child: Builder(
                              builder: (context) {
                                final user = _model.listUsers.toList();

                                return FlutterFlowSwipeableStack(
                                  onSwipeFn: (index) {},
                                  onLeftSwipe: (index) async {
                                    logFirebaseEvent(
                                        'SWIPE_USERS_COPY_SwipeableStack_1rfl77bp');
                                    var _shouldSetState = false;
                                    final userItem = user[index];
                                    logFirebaseEvent(
                                        'SwipeableStack_update_page_state');
                                    _model.currentSwipeData = user[index];
                                    if (user[index].isAd) {
                                      logFirebaseEvent(
                                          'SwipeableStack_backend_call');

                                      await _model.currentSwipeData!.adRef!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'views': FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'SwipeableStack_custom_action');
                                      _model.hasMatch =
                                          await actions.swipeSecretUser(
                                        widget.eventId!,
                                        currentUserUid,
                                        _model.currentSwipeData!.userRef!,
                                        FFAppConstants.leftSwipe,
                                      );
                                      _shouldSetState = true;
                                    }

                                    logFirebaseEvent(
                                        'SwipeableStack_update_page_state');
                                    _model.swipesLeft = _model.swipesLeft! + -1;
                                    safeSetState(() {});
                                    if (_model.swipesLeft == 0) {
                                      logFirebaseEvent(
                                          'SwipeableStack_update_page_state');

                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  onRightSwipe: (index) async {
                                    logFirebaseEvent(
                                        'SWIPE_USERS_COPY_SwipeableStack_1rfl77bp');
                                    var _shouldSetState = false;
                                    final userItem = user[index];
                                    logFirebaseEvent(
                                        'SwipeableStack_update_page_state');
                                    _model.swipesLeft = _model.swipesLeft! + -1;
                                    if (user[index].isAd) {
                                      logFirebaseEvent(
                                          'SwipeableStack_update_page_state');
                                      _model.currentSwipeData = user[index];
                                      logFirebaseEvent(
                                          'SwipeableStack_backend_call');

                                      await _model.currentSwipeData!.adRef!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'views': FieldValue.increment(1),
                                            'clicks': FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent(
                                          'SwipeableStack_launch_u_r_l');
                                      await launchURL(user[index].adLink);
                                    } else {
                                      logFirebaseEvent(
                                          'SwipeableStack_update_page_state');
                                      _model.currentSwipeData = user[index];
                                      logFirebaseEvent(
                                          'SwipeableStack_custom_action');
                                      _model.hasMatchRight =
                                          await actions.swipeSecretUser(
                                        widget.eventId!,
                                        currentUserUid,
                                        _model.currentSwipeData!.userRef!,
                                        FFAppConstants.rightSwipe,
                                      );
                                      _shouldSetState = true;
                                      if (_model.hasMatchRight!) {
                                        if (_model.currentSwipeData
                                                ?.matchesNotifications !=
                                            false) {
                                          logFirebaseEvent(
                                              'SwipeableStack_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle:
                                                'Hai ricevuto un nuovo match! ✨',
                                            notificationText:
                                                '${valueOrDefault(currentUserDocument?.nome, '')} ha ricambiato il tuo like!',
                                            notificationSound: 'default',
                                            userRefs: [
                                              _model.currentSwipeData!.userRef!
                                            ],
                                            initialPageName:
                                                'main_matches_page',
                                            parameterData: {},
                                          );
                                        }
                                        logFirebaseEvent(
                                            'SwipeableStack_haptic_feedback');
                                        HapticFeedback.mediumImpact();
                                        logFirebaseEvent(
                                            'SwipeableStack_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: NewMatchWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        logFirebaseEvent(
                                            'SwipeableStack_backend_call');

                                        await CountMatchesRecord.collection
                                            .doc()
                                            .set(createCountMatchesRecordData(
                                              swiped: userItem.userRef,
                                              swiper: currentUserReference,
                                              createdTime: getCurrentTimestamp,
                                              eventName: widget.eventName,
                                            ));
                                      } else {
                                        if (_model.currentSwipeData
                                                ?.likesNotifications !=
                                            false) {
                                          logFirebaseEvent(
                                              'SwipeableStack_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle:
                                                'C’è feeling nell’aria! 💘',
                                            notificationText:
                                                'Qualcuno ti ha messo like, dai un’occhiata!',
                                            notificationSound: 'default',
                                            userRefs: [
                                              _model.currentSwipeData!.userRef!
                                            ],
                                            initialPageName:
                                                'main_matches_page',
                                            parameterData: {},
                                          );
                                        }
                                      }
                                    }

                                    if (_model.swipesLeft == 0) {
                                      logFirebaseEvent(
                                          'SwipeableStack_update_page_state');

                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  onUpSwipe: (index) {},
                                  onDownSwipe: (index) {},
                                  itemBuilder: (context, userIndex) {
                                    final userItem = user[userIndex];
                                    return Builder(
                                      builder: (context) {
                                        if (!userItem.isAd) {
                                          return StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                userItem.userRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    child: SpinKitFadingCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerUsersRecord
                                                              .photoUrl,
                                                          'https://i.postimg.cc/6qqxxnmG/user-profile-icon-vector-avatar-600nw-2220431045.png',
                                                        ),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    150.0),
                                                        child: Text(
                                                          containerUsersRecord
                                                              .nome,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    50.0),
                                                        child: Container(
                                                          width: 150.0,
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      100.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      100.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      100.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      100.0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF2D2D2D),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            100.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            100.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            100.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            100.0),
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SWIPE_USERS_COPY_Icon_q7dhrja2_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_swipeable_stack');
                                                                    _model
                                                                        .swipeableStackController
                                                                        .swipeLeft();
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .close_rounded,
                                                                    color: Color(
                                                                        0xFF810303),
                                                                    size: 26.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF2D2D2D),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            100.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            100.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            100.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            100.0),
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SWIPE_USERS_COPY_Icon_9qcgletn_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_swipeable_stack');
                                                                    _model
                                                                        .swipeableStackController
                                                                        .swipeRight();
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_rounded,
                                                                    color: Color(
                                                                        0xFF039015),
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 5.0,
                                                ),
                                              ),
                                              child: Stack(
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
                                                          'SWIPE_USERS_COPY_Image_gzm3nbtu_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_swipeable_stack');
                                                      _model
                                                          .swipeableStackController
                                                          .swipeRight();
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        userItem.adImage,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  50.0),
                                                      child: Container(
                                                        width: 150.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    100.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    100.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    100.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    100.0),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF2D2D2D),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          100.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          100.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          100.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          100.0),
                                                                ),
                                                              ),
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SWIPE_USERS_COPY_Icon_d2xoksid_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_swipeable_stack');
                                                                  _model
                                                                      .swipeableStackController
                                                                      .swipeLeft();
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  color: Color(
                                                                      0xFF810303),
                                                                  size: 26.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF2D2D2D),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          100.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          100.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          100.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          100.0),
                                                                ),
                                                              ),
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SWIPE_USERS_COPY_Icon_q2h6y4mg_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_swipeable_stack');
                                                                  _model
                                                                      .swipeableStackController
                                                                      .swipeRight();
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .favorite_rounded,
                                                                  color: Color(
                                                                      0xFF039015),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xC6D900FF),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'ADV',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  itemCount: user.length,
                                  controller: _model.swipeableStackController,
                                  loop: false,
                                  cardDisplayCount: 2,
                                  scale: 0.8,
                                  allowedSwipeDirection:
                                      AllowedSwipeDirection.symmetric(
                                          horizontal: true),
                                );
                              },
                            ),
                          );
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: Text(
                                'Al momento non ci sono nuovi partecipanti che rientrano nei tuoi filtri\n\nProva a tornare tra un po\'',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Caricando i partecipanti...',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).info,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 0.0),
                child: Container(
                  height: 40.0,
                  child: Stack(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SWIPE_USERS_COPY_Icon_tjly61is_ON_TAP');
                          logFirebaseEvent('Icon_navigate_to');

                          context.pushNamed(
                            EventiProfileWidget.routeName,
                            queryParameters: {
                              'eventoRef': serializeParam(
                                widget.eventRef,
                                ParamType.DocumentReference,
                              ),
                              'goBack': serializeParam(
                                'swipe',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.leftToRight,
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 30.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: Text(
                            'Trova il tuo match',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: 0.6,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 50.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Senza_nome.png',
                        width: double.infinity,
                        height: 35.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
