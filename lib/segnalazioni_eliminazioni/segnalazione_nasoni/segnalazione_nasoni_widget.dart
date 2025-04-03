import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/info/components/grazie_segnalazione/grazie_segnalazione_widget.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'segnalazione_nasoni_model.dart';
export 'segnalazione_nasoni_model.dart';

class SegnalazioneNasoniWidget extends StatefulWidget {
  const SegnalazioneNasoniWidget({super.key});

  static String routeName = 'segnalazioneNasoni';
  static String routePath = 'segnalazioneNasoni';

  @override
  State<SegnalazioneNasoniWidget> createState() =>
      _SegnalazioneNasoniWidgetState();
}

class _SegnalazioneNasoniWidgetState extends State<SegnalazioneNasoniWidget>
    with TickerProviderStateMixin {
  late SegnalazioneNasoniModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SegnalazioneNasoniModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'segnalazioneNasoni'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEGNALAZIONE_NASONI_segnalazioneNasoni_O');
      logFirebaseEvent('segnalazioneNasoni_custom_action');
      await actions.lockOrientation();
    });

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 66.0, 0.0, 5.0),
                                child: Text(
                                  'Segnalazione Nasoni',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 60.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SEGNALAZIONE_NASONI_Icon_yoh4l6mf_ON_TAP');
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  NasoniMapWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
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
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Text(
                        'Hai trovato un nasone che non è presente sulla mappa?',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Text(
                        'Dicci l\'indirizzo con il civico e lo aggiungeremo con il prossimo aggiornamento.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                      child: Text(
                        'La mappa mostra solamente i 50 nasoni più vicini alla tua posizione attuale',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 50.0, 40.0, 0.0),
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyCuhw8od-TioIQtMp3S6m49KQ0gphSyqGU',
                          androidGoogleMapsApiKey:
                              'AIzaSyA3jB4O1O7alnIyBjlMEhmZ_Spg8q_E9H0',
                          webGoogleMapsApiKey:
                              'AIzaSyB_xv4IiZcZ_rtSzUMD1HxJx34J-toDM6E',
                          onSelect: (place) async {
                            safeSetState(() => _model.placePickerValue = place);
                          },
                          defaultText: 'Inserisci indirizzo',
                          icon: Icon(
                            Icons.place,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 16.0,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: double.infinity,
                            height: 45.0,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textAlign: TextAlign.center,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: (_model.placePickerValue == null)
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'SEGNALAZIONE_NASONI_INVIA_BTN_ON_TAP');
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'buttonOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'buttonOnActionTriggerAnimation']!
                                      .controller
                                      .reverse();
                                }
                                logFirebaseEvent('Button_backend_call');

                                await SegnalazioniNasoniRecord.collection
                                    .doc()
                                    .set(createSegnalazioniNasoniRecordData(
                                      indirizzo: _model.placePickerValue.latLng,
                                      userEmail: currentUserEmail,
                                      createDate: getCurrentTimestamp,
                                      aggiungiOelimina: 'aggiungi',
                                      aggiungi: true,
                                      indirizzoText:
                                          _model.placePickerValue.address,
                                      createdBy: currentUserUid,
                                      appName: 'romanytas',
                                    ));
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(NasoniMapWidget.routeName);

                                logFirebaseEvent('Button_bottom_sheet');
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
                                        child: GrazieSegnalazioneWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                        text: 'INVIA',
                        options: FFButtonOptions(
                          width: 160.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        showLoadingIndicator: false,
                      ).animateOnActionTrigger(
                        animationsMap['buttonOnActionTriggerAnimation']!,
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 150.0)),
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
            ],
          ),
        ),
      ),
    );
  }
}
