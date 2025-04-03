import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info/bottom_sheet_cibo/bottom_sheet_cibo_widget.dart';
import '/info/info_location_android/info_location_android_widget.dart';
import '/info/info_location_iphone/info_location_iphone_widget.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cibo_map_model.dart';
export 'cibo_map_model.dart';

class CiboMapWidget extends StatefulWidget {
  const CiboMapWidget({super.key});

  static String routeName = 'ciboMap';
  static String routePath = 'ciboMap';

  @override
  State<CiboMapWidget> createState() => _CiboMapWidgetState();
}

class _CiboMapWidgetState extends State<CiboMapWidget>
    with TickerProviderStateMixin {
  late CiboMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CiboMapModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ciboMap'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CIBO_MAP_PAGE_ciboMap_ON_INIT_STATE');
      logFirebaseEvent('ciboMap_custom_action');
      await actions.lockOrientation();
      if (!functions.isUserLocationGotten(currentUserLocationValue)) {
        if (isAndroid) {
          logFirebaseEvent('ciboMap_bottom_sheet');
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
                  child: InfoLocationAndroidWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        } else {
          logFirebaseEvent('ciboMap_bottom_sheet');
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
                  child: InfoLocationIphoneWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
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
      'containerOnActionTriggerAnimation2': AnimationInfo(
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
      'containerOnActionTriggerAnimation3': AnimationInfo(
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
      'containerOnActionTriggerAnimation4': AnimationInfo(
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
      'containerOnActionTriggerAnimation5': AnimationInfo(
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      child: FutureBuilder<List<GetAllCiboRow>>(
                        future: SQLiteManager.instance.getAllCibo(),
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
                          final googleMapGetAllCiboRowList = snapshot.data!;

                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) =>
                                _model.googleMapsCenter = latLng,
                            initialLocation: _model.googleMapsCenter ??=
                                currentUserLocationValue!,
                            markers: functions
                                .findClosestCiboMarkersNormal(
                                    googleMapGetAllCiboRowList.toList(),
                                    currentUserLocationValue!,
                                    50)
                                .map(
                                  (marker) => FlutterFlowMarker(
                                    marker.serialize(),
                                    marker,
                                    () async {
                                      logFirebaseEvent(
                                          'CIBO_MAP_GoogleMap_vluhxs0k_ON_MARKER_TA');
                                      logFirebaseEvent('GoogleMap_wait__delay');
                                      await Future.delayed(
                                          const Duration(milliseconds: 1000));
                                      logFirebaseEvent(
                                          'GoogleMap_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: BottomSheetCiboWidget(
                                                ciboId: googleMapGetAllCiboRowList
                                                    .where((e) => functions
                                                        .areLatLngsSame(
                                                            _model
                                                                .googleMapsCenter,
                                                            functions.getLatLng(
                                                                e.latitude,
                                                                e.longitude)))
                                                    .toList()
                                                    .firstOrNull!
                                                    .id!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                )
                                .toList(),
                            markerColor: GoogleMarkerColor.yellow,
                            markerImage: MarkerImage(
                              imagePath: 'assets/images/maps_2_purple.png',
                              isAssetImage: true,
                              size: 25.0 ?? 20,
                            ),
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 16.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: false,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 260.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CIBO_MAP_PAGE_ContainerNas_ON_TAP');
                            logFirebaseEvent('ContainerNas_widget_animation');
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation1'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('ContainerNas_widget_animation');
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation1'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation1']!
                                  .controller
                                  .reverse();
                            }
                            logFirebaseEvent('ContainerNas_navigate_to');

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

                            logFirebaseEvent('ContainerNas_update_app_state');
                            FFAppState().map = 'nasoni';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0x438B00FF),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(1000.0),
                                bottomRight: Radius.circular(1000.0),
                                topLeft: Radius.circular(1000.0),
                                topRight: Radius.circular(1000.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 3.0,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/nasone_icon_purple.svg',
                                    width: 30.0,
                                    height: 30.0,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation1']!,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 120.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CIBO_MAP_PAGE_ContainerBan_ON_TAP');
                            logFirebaseEvent('ContainerBan_widget_animation');
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation2'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation2']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('ContainerBan_widget_animation');
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation2'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation2']!
                                  .controller
                                  .reverse();
                            }
                            logFirebaseEvent('ContainerBan_navigate_to');

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

                            logFirebaseEvent('ContainerBan_update_app_state');
                            FFAppState().map = 'bangla';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0x438B00FF),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(1000.0),
                                bottomRight: Radius.circular(1000.0),
                                topLeft: Radius.circular(1000.0),
                                topRight: Radius.circular(1000.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 3.0,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/bangla_icon_purple.svg',
                                  width: 30.0,
                                  height: 30.0,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation2']!,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 190.0, 0.0, 0.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xB38B00FF),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(1000.0),
                              bottomRight: Radius.circular(1000.0),
                              topLeft: Radius.circular(1000.0),
                              topRight: Radius.circular(1000.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 3.0,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/cibo_icon.svg',
                                  width: 35.0,
                                  height: 30.0,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation3']!,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 120.0, 20.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CIBO_MAP_PAGE_ContainerPlus_ON_TAP');
                            logFirebaseEvent('ContainerPlus_widget_animation');
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation4'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation4']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('ContainerPlus_widget_animation');
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation4'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation4']!
                                  .controller
                                  .reverse();
                            }
                            logFirebaseEvent('ContainerPlus_navigate_to');

                            context.pushNamed(
                              SegnalazioneCiboWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xB38B00FF),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(1000.0),
                                bottomRight: Radius.circular(1000.0),
                                topLeft: Radius.circular(1000.0),
                                topRight: Radius.circular(1000.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 3.0,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.add_sharp,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation4']!,
                        ),
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
                    if (!functions
                        .isUserLocationGotten(currentUserLocationValue))
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 190.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'CIBO_MAP_PAGE_ContainerLoc_ON_TAP');
                              logFirebaseEvent('ContainerLoc_widget_animation');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation5'] !=
                                  null) {
                                await animationsMap[
                                        'containerOnActionTriggerAnimation5']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              logFirebaseEvent('ContainerLoc_widget_animation');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation5'] !=
                                  null) {
                                await animationsMap[
                                        'containerOnActionTriggerAnimation5']!
                                    .controller
                                    .reverse();
                              }
                              if (isAndroid) {
                                logFirebaseEvent('ContainerLoc_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: InfoLocationAndroidWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                logFirebaseEvent('ContainerLoc_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: InfoLocationIphoneWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xB38B00FF),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(1000.0),
                                  bottomRight: Radius.circular(1000.0),
                                  topLeft: Radius.circular(1000.0),
                                  topRight: Radius.circular(1000.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 3.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation5']!,
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
    );
  }
}
