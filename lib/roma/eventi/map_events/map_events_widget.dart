import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info/components/bottom_sheet_eventi/bottom_sheet_eventi_widget.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'map_events_model.dart';
export 'map_events_model.dart';

class MapEventsWidget extends StatefulWidget {
  const MapEventsWidget({super.key});

  static String routeName = 'mapEvents';
  static String routePath = 'mapEvents';

  @override
  State<MapEventsWidget> createState() => _MapEventsWidgetState();
}

class _MapEventsWidgetState extends State<MapEventsWidget> {
  late MapEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapEventsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mapEvents'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAP_EVENTS_PAGE_mapEvents_ON_INIT_STATE');
      logFirebaseEvent('mapEvents_update_app_state');
      FFAppState().curTime = functions.getDate('all');
      safeSetState(() {});
      logFirebaseEvent('mapEvents_google_analytics_event');
      logFirebaseEvent(
        'eventimap',
        parameters: {
          'Param 7': 'eventimap',
        },
      );
      logFirebaseEvent('mapEvents_wait__delay');
      await Future.delayed(const Duration(milliseconds: 100));
      await Future.wait([
        Future(() async {
          logFirebaseEvent('mapEvents_update_page_state');
          _model.curDay = functions.getDate('day');
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('mapEvents_update_page_state');
          _model.curMonth = functions.getDate('month');
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('mapEvents_update_page_state');
          _model.curYear = functions.getDate('year');
          safeSetState(() {});
        }),
      ]);
      logFirebaseEvent('mapEvents_custom_action');
      await actions.lockOrientation();
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
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

    return FutureBuilder<List<EventiRecord>>(
      future: queryEventiRecordOnce(
        queryBuilder: (eventiRecord) => eventiRecord
            .where(
              'verificato',
              isEqualTo: true,
            )
            .where(
              'city',
              isEqualTo: FFAppState().city,
            )
            .where(
              'Data',
              isGreaterThanOrEqualTo: FFAppState().curTime,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        List<EventiRecord> mapEventsEventiRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            _model.googleMapsCenter = latLng,
                        initialLocation: _model.googleMapsCenter ??=
                            currentUserLocationValue!,
                        markers: mapEventsEventiRecordList
                            .where((e) =>
                                dateTimeFormat(
                                  "yMMMd",
                                  e.data,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ) ==
                                dateTimeFormat(
                                  "yMMMd",
                                  getCurrentTimestamp,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ))
                            .toList()
                            .map(
                              (marker) => FlutterFlowMarker(
                                marker.reference.path,
                                marker.indirizzo!,
                                () async {
                                  logFirebaseEvent(
                                      'MAP_EVENTS_GoogleMap_jhh28loj_ON_MARKER_');
                                  logFirebaseEvent('GoogleMap_bottom_sheet');
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
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: BottomSheetEventiWidget(
                                            eventRef: marker.reference,
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
                        markerImage: MarkerImage(
                          imagePath: 'assets/images/maps_2_purple.png',
                          isAssetImage: true,
                          size: 25.0 ?? 20,
                        ),
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 11.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: false,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: false,
                      ),
                      PointerInterceptor(
                        intercepting: isWeb,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 70.0, 0.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                topRight: Radius.circular(100.0),
                              ),
                            ),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(100.0),
                                  topLeft: Radius.circular(100.0),
                                  topRight: Radius.circular(100.0),
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MAP_EVENTS_PAGE_Icon_49bbny14_ON_TAP');
                                  if (loggedIn) {
                                    logFirebaseEvent('Icon_navigate_to');

                                    context.pushNamed(
                                      EventiHomeWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
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
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                        ),
                                      },
                                    );
                                  }

                                  logFirebaseEvent('Icon_update_app_state');
                                  FFAppState().eventiState = 'eventi';
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.chevron_left,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: PointerInterceptor(
                          intercepting: isWeb,
                          child: wrapWithModel(
                            model: _model.bottomNavOutOutModel,
                            updateCallback: () => safeSetState(() {}),
                            child: BottomNavOutOutWidget(),
                          ),
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
    );
  }
}
