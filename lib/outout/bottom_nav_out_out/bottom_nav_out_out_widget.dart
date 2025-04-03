import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/info_feature_friends_log_out/info_feature_friends_log_out_widget.dart';
import '/outout/info_feature_log_out/info_feature_log_out_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_out_out_model.dart';
export 'bottom_nav_out_out_model.dart';

class BottomNavOutOutWidget extends StatefulWidget {
  const BottomNavOutOutWidget({super.key});

  @override
  State<BottomNavOutOutWidget> createState() => _BottomNavOutOutWidgetState();
}

class _BottomNavOutOutWidgetState extends State<BottomNavOutOutWidget> {
  late BottomNavOutOutModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavOutOutModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: !(isWeb
          ? MediaQuery.viewInsetsOf(context).bottom > 0
          : _isKeyboardVisible),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: valueOrDefault<double>(
              isiOS ? 90.0 : 70.0,
              90.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_OUT_OUT_Container_3xn47adj_ON');
                      if (FFAppState().page != 'events') {
                        if (loggedIn) {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            EventiHomeWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            EventiHomeLogOutWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        }

                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().page = 'events';
                        safeSetState(() {});
                      }
                    },
                    child: Container(
                      width: 40.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'BOTTOM_NAV_OUT_OUT_Icon_zdepyr58_ON_TAP');
                            if (FFAppState().page != 'events') {
                              if (loggedIn) {
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  EventiHomeWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  EventiHomeLogOutWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              }

                              logFirebaseEvent('Icon_update_app_state');
                              FFAppState().page = 'events';
                              safeSetState(() {});
                            }
                          },
                          child: Icon(
                            Icons.home_outlined,
                            color: valueOrDefault<Color>(
                              FFAppState().page == 'events'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_OUT_OUT_Container_jti7mots_ON');
                      if (FFAppState().page != 'maps') {
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed(
                          BanglaMapWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().page = 'maps';
                        safeSetState(() {});
                        if (FFAppState().map == 'nasoni') {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            NasoniMapWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else if (FFAppState().map == 'cibo') {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            CiboMapWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            BanglaMapWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        }
                      }
                    },
                    child: Container(
                      width: 40.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'BOTTOM_NAV_OUT_OUT_Icon_14ycuwka_ON_TAP');
                            if (FFAppState().page != 'maps') {
                              logFirebaseEvent('Icon_navigate_to');

                              context.pushNamed(
                                BanglaMapWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );

                              logFirebaseEvent('Icon_update_app_state');
                              FFAppState().page = 'maps';
                              safeSetState(() {});
                              if (FFAppState().map == 'nasoni') {
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  NasoniMapWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else if (FFAppState().map == 'cibo') {
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  CiboMapWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  BanglaMapWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              }
                            }
                          },
                          child: Icon(
                            Icons.map_sharp,
                            color: valueOrDefault<Color>(
                              FFAppState().page == 'maps'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            size: 26.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_OUT_OUT_Container_07at93no_ON');
                      if (FFAppState().page != 'friends') {
                        if (loggedIn) {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            MainMatchesPageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          logFirebaseEvent('Container_update_app_state');
                          FFAppState().page = 'friends';
                          safeSetState(() {});
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
                                child: InfoFeatureLogOutWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      }
                    },
                    child: Container(
                      width: 40.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'BOTTOM_NAV_OUT_OUT_Icon_nt882ws8_ON_TAP');
                                if (FFAppState().page != 'friends') {
                                  if (loggedIn) {
                                    logFirebaseEvent('Icon_navigate_to');

                                    context.pushNamed(
                                      MainMatchesPageWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );

                                    logFirebaseEvent('Icon_update_app_state');
                                    FFAppState().page = 'friends';
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent('Icon_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: InfoFeatureLogOutWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                }
                              },
                              child: Icon(
                                Icons.favorite_border_sharp,
                                color: valueOrDefault<Color>(
                                  FFAppState().page == 'friends'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).secondary,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 26.0,
                              ),
                            ),
                            if (loggedIn)
                              Container(
                                decoration: BoxDecoration(),
                                child: StreamBuilder<List<LikesRecord>>(
                                  stream: queryLikesRecord(
                                    parent: currentUserReference,
                                    queryBuilder: (likesRecord) =>
                                        likesRecord.where(
                                      'viewed',
                                      isNotEqualTo: true,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 25.0,
                                          height: 25.0,
                                          child: SpinKitFadingCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 25.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<LikesRecord> containerLikesRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: StreamBuilder<
                                          List<FriendsRequestRecord>>(
                                        stream: queryFriendsRequestRecord(
                                          queryBuilder:
                                              (friendsRequestRecord) =>
                                                  friendsRequestRecord
                                                      .where(
                                                        'Requestee',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      )
                                                      .where(
                                                        'viewed',
                                                        isEqualTo: false,
                                                      ),
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
                                          List<FriendsRequestRecord>
                                              containerFriendsRequestRecordList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible:
                                                  (containerFriendsRequestRecordList
                                                              .length >=
                                                          1) ||
                                                      (containerLikesRecordList
                                                              .length >=
                                                          1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 3.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 5.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_OUT_OUT_Container_kg5pd7ma_ON');
                      if (FFAppState().page != 'search') {
                        if (loggedIn) {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            SearchPageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          logFirebaseEvent('Container_update_app_state');
                          FFAppState().page = 'search';
                          safeSetState(() {});
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
                                child: InfoFeatureFriendsLogOutWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      }
                    },
                    child: Container(
                      width: 40.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAV_OUT_OUT_Icon_q9tqpwfp_ON_TAP');
                              if (FFAppState().page != 'search') {
                                if (loggedIn) {
                                  logFirebaseEvent('Icon_navigate_to');

                                  context.pushNamed(
                                    SearchPageWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );

                                  logFirebaseEvent('Icon_update_app_state');
                                  FFAppState().page = 'search';
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('Icon_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: InfoFeatureFriendsLogOutWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              }
                            },
                            child: FaIcon(
                              FontAwesomeIcons.search,
                              color: valueOrDefault<Color>(
                                FFAppState().page == 'search'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).secondary,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_OUT_OUT_Container_5r5d57pb_ON');
                      if (FFAppState().page != 'profile') {
                        if (loggedIn) {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            ProfiloWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          logFirebaseEvent('Container_update_app_state');
                          FFAppState().page = 'profile';
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(LogInWidget.routeName);
                        }
                      }
                    },
                    child: Container(
                      width: 40.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'BOTTOM_NAV_OUT_OUT_Icon_9se8k2tb_ON_TAP');
                            if (FFAppState().page != 'profile') {
                              if (loggedIn) {
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  ProfiloWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );

                                logFirebaseEvent('Icon_update_app_state');
                                FFAppState().page = 'profile';
                                safeSetState(() {});
                              } else {
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(LogInWidget.routeName);
                              }
                            }
                          },
                          child: Icon(
                            Icons.person_outline_outlined,
                            color: valueOrDefault<Color>(
                              FFAppState().page == 'profile'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            size: 29.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
