import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/bottom_nav/bottom_nav_bangla/bottom_nav_bangla_widget.dart';
import '/components/bottom_sheet_bangla/bottom_sheet_bangla_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info/info_bangla/info_bangla_widget.dart';
import '/info/info_location_android/info_location_android_widget.dart';
import '/info/info_location_iphone/info_location_iphone_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'bangla_map_model.dart';
export 'bangla_map_model.dart';

class BanglaMapWidget extends StatefulWidget {
  const BanglaMapWidget({super.key});

  @override
  State<BanglaMapWidget> createState() => _BanglaMapWidgetState();
}

class _BanglaMapWidgetState extends State<BanglaMapWidget> {
  late BanglaMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BanglaMapModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'banglaMap'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BANGLA_MAP_PAGE_banglaMap_ON_INIT_STATE');
      logFirebaseEvent('banglaMap_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('banglaMap_google_analytics_event');
      logFirebaseEvent(
        'bangla_load',
        parameters: {
          'Param 3': 'banglaload',
        },
      );
      logFirebaseEvent('banglaMap_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      if (!FFAppState().infoBangla) {
        logFirebaseEvent('banglaMap_bottom_sheet');
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
                child: const InfoBanglaWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      if (!functions.isUserLocationGotten(currentUserLocationValue)) {
        if (isAndroid) {
          logFirebaseEvent('banglaMap_bottom_sheet');
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
          logFirebaseEvent('banglaMap_bottom_sheet');
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
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
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
              FutureBuilder<List<GetAllBanglaRow>>(
                future: SQLiteManager.instance.getAllBangla(),
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
                  final googleMapGetAllBanglaRowList = snapshot.data!;

                  return FlutterFlowGoogleMap(
                    controller: _model.googleMapsController,
                    onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                    initialLocation: _model.googleMapsCenter ??=
                        currentUserLocationValue!,
                    markers: functions
                        .getLatLngsFromBangla(
                            googleMapGetAllBanglaRowList.toList())
                        .map(
                          (marker) => FlutterFlowMarker(
                            marker.serialize(),
                            marker,
                            () async {
                              logFirebaseEvent(
                                  'BANGLA_MAP_GoogleMap_wt7doj8q_ON_MARKER_');
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BottomSheetBanglaWidget(
                                        banglaId: googleMapGetAllBanglaRowList
                                            .where((e) =>
                                                functions.areLatLngsSame(
                                                    _model.googleMapsCenter,
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
                    markerColor: GoogleMarkerColor.violet,
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
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'BANGLA_MAP_PAGE_Image_6x55gakb_ON_TAP');
                        logFirebaseEvent('Image_navigate_to');

                        context.pushNamed(
                          'SegnalazioneBangla',
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
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: wrapWithModel(
                    model: _model.bottomNavBanglaModel,
                    updateCallback: () => setState(() {}),
                    child: const BottomNavBanglaWidget(),
                  ),
                ),
              ),
              if (!functions.isUserLocationGotten(currentUserLocationValue))
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: PointerInterceptor(
                    intercepting: isWeb,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 190.0, 20.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'BANGLA_MAP_PAGE_Image_uupdyacb_ON_TAP');
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
