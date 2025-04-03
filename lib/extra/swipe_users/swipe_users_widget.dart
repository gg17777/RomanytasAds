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
import 'swipe_users_model.dart';
export 'swipe_users_model.dart';

class SwipeUsersWidget extends StatefulWidget {
  const SwipeUsersWidget({
    super.key,
    required this.eventId,
    required this.eventRef,
    required this.eventName,
  });

  final String? eventId;
  final DocumentReference? eventRef;
  final String? eventName;

  static String routeName = 'swipe_users';
  static String routePath = 'swipeUsers';

  @override
  State<SwipeUsersWidget> createState() => _SwipeUsersWidgetState();
}

class _SwipeUsersWidgetState extends State<SwipeUsersWidget> {
  late SwipeUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeUsersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'swipe_users'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SWIPE_USERS_swipe_users_ON_INIT_STATE');
      logFirebaseEvent('swipe_users_update_page_state');
      _model.loading = true;
      safeSetState(() {});
      logFirebaseEvent('swipe_users_custom_action');
      _model.users = await actions.getUnswipedParticipants(
        widget.eventId!,
        currentUserUid,
      );
      logFirebaseEvent('swipe_users_update_page_state');
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
          decoration: BoxDecoration(),
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
                                        'SWIPE_USERS_SwipeableStack_bg6dg2zt_ON_L');
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
                                      _model.hasMatch = await actions.swipeUser(
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
                                    if ((valueOrDefault(
                                                currentUserDocument?.sex, '') ==
                                            'Donna') &&
                                        !valueOrDefault<bool>(
                                            currentUserDocument?.uploaded,
                                            false)) {
                                      logFirebaseEvent(
                                          'SwipeableStack_backend_call');

                                      await CountFemaleSwipesRecord.createDoc(
                                              widget.eventRef!)
                                          .set(
                                              createCountFemaleSwipesRecordData(
                                        eventName: widget.eventName,
                                        userName:
                                            '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')}',
                                        date: getCurrentTimestamp,
                                        userRef: currentUserReference,
                                        direction: 'left',
                                        createdTime: getCurrentTimestamp,
                                      ));
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
                                  onRightSwipe: (index) async {
                                    logFirebaseEvent(
                                        'SWIPE_USERS_SwipeableStack_bg6dg2zt_ON_R');
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
                                          await actions.swipeUser(
                                        widget.eventId!,
                                        currentUserUid,
                                        _model.currentSwipeData!.userRef!,
                                        FFAppConstants.rightSwipe,
                                      );
                                      _shouldSetState = true;
                                      if ((valueOrDefault(
                                                  currentUserDocument?.sex,
                                                  '') ==
                                              'Donna') &&
                                          !valueOrDefault<bool>(
                                              currentUserDocument?.uploaded,
                                              false)) {
                                        logFirebaseEvent(
                                            'SwipeableStack_backend_call');

                                        await CountFemaleSwipesRecord.createDoc(
                                                widget.eventRef!)
                                            .set(
                                                createCountFemaleSwipesRecordData(
                                          eventName: widget.eventName,
                                          userName:
                                              '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')}',
                                          date: getCurrentTimestamp,
                                          userRef: currentUserReference,
                                          direction: 'right',
                                          createdTime: getCurrentTimestamp,
                                          swiped:
                                              _model.currentSwipeData?.userRef,
                                        ));
                                      }
                                      if (_model.hasMatchRight!) {
                                        if (_model.currentSwipeData
                                                ?.matchesNotifications !=
                                            false) {
                                          logFirebaseEvent(
                                              'SwipeableStack_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle:
                                                'Hai un nuovo match! ✨',
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
                                                          24.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerUsersRecord
                                                              .photoUrl,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/1as520apcp2z/profilo_eaqf.png',
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
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: 70.0,
                                                              height: 70.0,
                                                              decoration:
                                                                  BoxDecoration(
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
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF810303),
                                                                  width: 5.0,
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
                                                                      'SWIPE_USERS_PAGE_Icon_b624jicg_ON_TAP');
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
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 70.0,
                                                              height: 70.0,
                                                              decoration:
                                                                  BoxDecoration(
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
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF039015),
                                                                  width: 5.0,
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
                                                                      'SWIPE_USERS_PAGE_Icon_brc0kv50_ON_TAP');
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
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 20.0)),
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
                                                    BorderRadius.circular(24.0),
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
                                                          'SWIPE_USERS_PAGE_Image_juwv63v7_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_swipeable_stack');
                                                      _model
                                                          .swipeableStackController
                                                          .swipeRight();
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          userItem.adImage,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/1as520apcp2z/profilo_eaqf.png',
                                                        ),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
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
                                                                      .tertiary,
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
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 70.0,
                                                            height: 70.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFF810303),
                                                                width: 5.0,
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'SWIPE_USERS_PAGE_Icon_k11k4q0b_ON_TAP');
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
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 70.0,
                                                            height: 70.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFF039015),
                                                                width: 5.0,
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'SWIPE_USERS_PAGE_Icon_evmjhxkc_ON_TAP');
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
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 20.0)),
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
                              'SWIPE_USERS_PAGE_Icon_kt6p8p58_ON_TAP');
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
                          color: FlutterFlowTheme.of(context).primary,
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
                                  color: FlutterFlowTheme.of(context).primary,
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
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: Text(
                    'fai succedere cose',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Horizon',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
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
