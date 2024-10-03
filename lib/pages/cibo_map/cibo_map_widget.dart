import '/backend/sqlite/sqlite_manager.dart';
import '/bottom_nav/bottom_nav_cibo/bottom_nav_cibo_widget.dart';
import '/components/bottom_sheet_cibo/bottom_sheet_cibo_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info/info_cibo/info_cibo_widget.dart';
import '/info/info_location_android/info_location_android_widget.dart';
import '/info/info_location_iphone/info_location_iphone_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'cibo_map_model.dart';
export 'cibo_map_model.dart';

class CiboMapWidget extends StatefulWidget {
  const CiboMapWidget({super.key});

  @override
  State<CiboMapWidget> createState() => _CiboMapWidgetState();
}

class _CiboMapWidgetState extends State<CiboMapWidget> {
  late CiboMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

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
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: const InfoLocationAndroidWidget(),
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
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: const InfoLocationIphoneWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      }
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.switchValue = false;
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
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FutureBuilder<List<GetAllCiboByZozzoniRow>>(
                  future: SQLiteManager.instance.getAllCiboByZozzoni(
                    queryZozzoni: _model.switchValue == true ? 1 : 0,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final googleMapGetAllCiboByZozzoniRowList = snapshot.data!;

                    return FlutterFlowGoogleMap(
                      controller: _model.googleMapsController,
                      onCameraIdle: (latLng) =>
                          _model.googleMapsCenter = latLng,
                      initialLocation: _model.googleMapsCenter ??=
                          currentUserLocationValue!,
                      markers: functions
                          .findClosestCiboMarkers(
                              googleMapGetAllCiboByZozzoniRowList.toList(),
                              currentUserLocationValue!,
                              50)
                          .map(
                            (marker) => FlutterFlowMarker(
                              marker.serialize(),
                              marker,
                              () async {
                                logFirebaseEvent(
                                    'CIBO_MAP_GoogleMap_qh1r7f99_ON_MARKER_TA');
                                logFirebaseEvent('GoogleMap_wait__delay');
                                await Future.delayed(
                                    const Duration(milliseconds: 1000));
                                logFirebaseEvent('GoogleMap_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: BottomSheetCiboWidget(
                                          ciboId:
                                              googleMapGetAllCiboByZozzoniRowList
                                                  .where((e) =>
                                                      functions.areLatLngsSame(
                                                          _model
                                                              .googleMapsCenter,
                                                          functions.getLatLng(
                                                              e.latitude,
                                                              e.longitude)))
                                                  .toList()
                                                  .first
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
                      markerImage: const MarkerImage(
                        imagePath: 'assets/images/maps_2.png',
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
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('CIBO_MAP_PAGE_Image_023v4xng_ON_TAP');
                      logFirebaseEvent('Image_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const InfoCiboWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/info2.png',
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Switch.adaptive(
                          value: _model.switchValue!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.switchValue = newValue);
                            if (newValue) {
                              logFirebaseEvent(
                                  'CIBO_MAP_Switch_efw36q20_ON_TOGGLE_ON');
                              logFirebaseEvent('Switch_update_page_state');
                              _model.zozzoni = true;
                              safeSetState(() {});
                            } else {
                              logFirebaseEvent(
                                  'CIBO_MAP_Switch_efw36q20_ON_TOGGLE_OFF');
                              logFirebaseEvent('Switch_update_page_state');
                              _model.zozzoni = false;
                              safeSetState(() {});
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: Icon(
                            Icons.nights_stay,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.bottomNavCiboModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const BottomNavCiboWidget(),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('CIBO_MAP_PAGE_Image_lcluh1b7_ON_TAP');
                      logFirebaseEvent('Image_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const InfoCiboWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/info2.png',
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              if (!functions.isUserLocationGotten(currentUserLocationValue))
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 260.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('CIBO_MAP_PAGE_Image_3d0jlh7s_ON_TAP');
                        if (isAndroid) {
                          logFirebaseEvent('Image_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const InfoLocationAndroidWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          logFirebaseEvent('Image_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const InfoLocationIphoneWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/loc.png',
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 190.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('CIBO_MAP_PAGE_Image_us8be24u_ON_TAP');
                      logFirebaseEvent('Image_navigate_to');

                      context.pushNamed(
                        'segnalazioneCibo',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image.asset(
                        'assets/images/plus2.png',
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
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
