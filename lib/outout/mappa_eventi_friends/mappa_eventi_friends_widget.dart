import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info/components/bottom_sheet_eventi/bottom_sheet_eventi_widget.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'mappa_eventi_friends_model.dart';
export 'mappa_eventi_friends_model.dart';

class MappaEventiFriendsWidget extends StatefulWidget {
  const MappaEventiFriendsWidget({super.key});

  static String routeName = 'mappaEventiFriends';
  static String routePath = 'mappaEventiFriends';

  @override
  State<MappaEventiFriendsWidget> createState() =>
      _MappaEventiFriendsWidgetState();
}

class _MappaEventiFriendsWidgetState extends State<MappaEventiFriendsWidget> {
  late MappaEventiFriendsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MappaEventiFriendsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mappaEventiFriends'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAPPA_EVENTI_FRIENDS_mappaEventiFriends_');
      logFirebaseEvent('mappaEventiFriends_update_app_state');
      FFAppState().curTime = functions.getDate('all');
      safeSetState(() {});
      logFirebaseEvent('mappaEventiFriends_google_analytics_even');
      logFirebaseEvent(
        'eventimap',
        parameters: {
          'Param 7': 'eventimap',
        },
      );
      logFirebaseEvent('mappaEventiFriends_wait__delay');
      await Future.delayed(const Duration(milliseconds: 100));
      await Future.wait([
        Future(() async {
          logFirebaseEvent('mappaEventiFriends_update_page_state');
          _model.curDay = functions.getDate('day');
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('mappaEventiFriends_update_page_state');
          _model.curMonth = functions.getDate('month');
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('mappaEventiFriends_update_page_state');
          _model.curYear = functions.getDate('year');
          safeSetState(() {});
        }),
      ]);
      logFirebaseEvent('mappaEventiFriends_custom_action');
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
      future: queryEventiRecordOnce(),
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
        List<EventiRecord> mappaEventiFriendsEventiRecordList = snapshot.data!;

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
                        markers: mappaEventiFriendsEventiRecordList
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
                                      'MAPPA_EVENTI_FRIENDS_GoogleMap_uuc6t4pt_');
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
                          imagePath:
                              'https://cdn-icons-png.freepik.com/256/7976/7976248.png?semt=ais_hybrid',
                          isAssetImage: false,
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
