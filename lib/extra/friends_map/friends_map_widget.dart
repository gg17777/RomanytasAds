import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'friends_map_model.dart';
export 'friends_map_model.dart';

class FriendsMapWidget extends StatefulWidget {
  const FriendsMapWidget({super.key});

  static String routeName = 'friendsMap';
  static String routePath = 'friendsMap';

  @override
  State<FriendsMapWidget> createState() => _FriendsMapWidgetState();
}

class _FriendsMapWidgetState extends State<FriendsMapWidget>
    with TickerProviderStateMixin {
  late FriendsMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendsMapModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'friendsMap'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FRIENDS_MAP_friendsMap_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      logFirebaseEvent('friendsMap_update_page_state');
      _model.isLoading = true;
      safeSetState(() {});
      logFirebaseEvent('friendsMap_custom_action');
      _model.friendsMap = await actions.getFriendsMapData(
        50,
        currentUserLocationValue!,
      );
      logFirebaseEvent('friendsMap_update_page_state');
      _model.isLoading = false;
      _model.customMarkers =
          _model.friendsMap!.toList().cast<CustomMarkerStruct>();
      safeSetState(() {});
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 25.0,
            height: 25.0,
            child: SpinKitFadingCircle(
              color: FlutterFlowTheme.of(context).alternate,
              size: 25.0,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  if (!_model.isLoading) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.CustomMapWidget(
                        width: double.infinity,
                        height: double.infinity,
                        markerSize: 25.0,
                        initialZoom: 16.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomButtons: false,
                        showUserLocation: true,
                        showCompass: false,
                        showToolbar: false,
                        showTraffic: false,
                        centerOnMarkerTap: true,
                        markerData: _model.customMarkers,
                        initialCenter: currentUserLocationValue!,
                        onMapMove: (marker) async {},
                      ),
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Loading...',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                      ),
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.bottomNavOutOutModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomNavOutOutWidget(),
              ),
            ),
            if (loggedIn)
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Container(
                  width: 100.0,
                  height: 200.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 100.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FRIENDS_MAP_PAGE_Icon_k1xgrrie_ON_TAP');
                              logFirebaseEvent('Icon_widget_animation');
                              if (animationsMap[
                                      'iconOnActionTriggerAnimation'] !=
                                  null) {
                                await animationsMap[
                                        'iconOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              logFirebaseEvent('Icon_widget_animation');
                              if (animationsMap[
                                      'iconOnActionTriggerAnimation'] !=
                                  null) {
                                await animationsMap[
                                        'iconOnActionTriggerAnimation']!
                                    .controller
                                    .reverse();
                              }
                              logFirebaseEvent('Icon_navigate_to');

                              context
                                  .pushNamed(FriendsRequestsWidget.routeName);
                            },
                            child: Icon(
                              Icons.person_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 34.0,
                            ),
                          ).animateOnActionTrigger(
                            animationsMap['iconOnActionTriggerAnimation']!,
                          ),
                        ),
                      ),
                      if (true /* Warning: Trying to access variable not yet defined. */)
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 132.0, 16.0, 0.0),
                            child: StreamBuilder<List<FriendsRequestRecord>>(
                              stream: queryFriendsRequestRecord(
                                queryBuilder: (friendsRequestRecord) =>
                                    friendsRequestRecord
                                        .where(
                                          'status',
                                          isEqualTo: 'pending',
                                        )
                                        .where(
                                          'Requestee',
                                          isEqualTo: currentUserReference,
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
                                List<FriendsRequestRecord>
                                    containerFriendsRequestRecordList =
                                    snapshot.data!;

                                return Container(
                                  width: 40.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          containerFriendsRequestRecordList
                                              .length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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
