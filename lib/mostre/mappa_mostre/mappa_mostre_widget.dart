import '/backend/backend.dart';
import '/bottom_nav/bottom_nav_eventi/bottom_nav_eventi_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mostre/bottom_sheet_mostre/bottom_sheet_mostre_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'mappa_mostre_model.dart';
export 'mappa_mostre_model.dart';

class MappaMostreWidget extends StatefulWidget {
  const MappaMostreWidget({super.key});

  @override
  State<MappaMostreWidget> createState() => _MappaMostreWidgetState();
}

class _MappaMostreWidgetState extends State<MappaMostreWidget> {
  late MappaMostreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MappaMostreModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mappaMostre'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAPPA_MOSTRE_mappaMostre_ON_INIT_STATE');
      logFirebaseEvent('mappaMostre_update_app_state');
      FFAppState().curTime = functions.getDate('all');
      safeSetState(() {});
      logFirebaseEvent('mappaMostre_google_analytics_event');
      logFirebaseEvent(
        'mostremap',
        parameters: {
          'Param 8': 'mostremap',
        },
      );
      logFirebaseEvent('mappaMostre_wait__delay');
      await Future.delayed(const Duration(milliseconds: 100));
      await Future.wait([
        Future(() async {
          logFirebaseEvent('mappaMostre_update_page_state');
          _model.curDay = functions.getDate('day');
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('mappaMostre_update_page_state');
          _model.curMonth = functions.getDate('month');
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('mappaMostre_update_page_state');
          _model.curYear = functions.getDate('year');
          safeSetState(() {});
        }),
      ]);
      logFirebaseEvent('mappaMostre_custom_action');
      await actions.lockOrientation();
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
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

    return FutureBuilder<List<MostreRecord>>(
      future: queryMostreRecordOnce(
        queryBuilder: (mostreRecord) => mostreRecord.where(
          'dataFine',
          isGreaterThanOrEqualTo: getCurrentTimestamp,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        List<MostreRecord> mappaMostreMostreRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                        markers: mappaMostreMostreRecordList
                            .map(
                              (marker) => FlutterFlowMarker(
                                marker.reference.path,
                                marker.indirizzo!,
                                () async {
                                  logFirebaseEvent(
                                      'MAPPA_MOSTRE_GoogleMap_gf0jxile_ON_MARKE');
                                  logFirebaseEvent('GoogleMap_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () =>
                                            FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: BottomSheetMostreWidget(
                                            mostreRef: marker.reference,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 70.0, 0.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
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
                                    'MAPPA_MOSTRE_PAGE_Icon_9brvl2iu_ON_TAP');
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed('eventiHome');

                                logFirebaseEvent('Icon_update_app_state');
                                FFAppState().eventiState = 'mostre';
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: PointerInterceptor(
                          intercepting: isWeb,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 70.0, 0.0, 0.0),
                            child: Container(
                              width: 150.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(100.0),
                                  topLeft: Radius.circular(100.0),
                                  topRight: Radius.circular(100.0),
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'MOSTRE',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 21.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                            model: _model.bottomNavEventiModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const BottomNavEventiWidget(),
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
