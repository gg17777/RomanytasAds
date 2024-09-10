import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bottom_nav/bottom_nav_nasoni/bottom_nav_nasoni_widget.dart';
import '/components/grazie_segnalazione/grazie_segnalazione_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'segnalazione_nasoni_model.dart';
export 'segnalazione_nasoni_model.dart';

class SegnalazioneNasoniWidget extends StatefulWidget {
  const SegnalazioneNasoniWidget({super.key});

  @override
  State<SegnalazioneNasoniWidget> createState() =>
      _SegnalazioneNasoniWidgetState();
}

class _SegnalazioneNasoniWidgetState extends State<SegnalazioneNasoniWidget> {
  late SegnalazioneNasoniModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('SEGNALAZIONE_NASONI_keyboard_arrow_left_');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(
                'nasoniMap',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
            },
          ),
          title: Text(
            'AGGIUNGI NASONI',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/LOGO_TONDO.png',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30.0, 50.0, 30.0, 0.0),
                      child: Text(
                        'Hai trovato un nasone che non è presente sulla mappa? Dicci l\'indirizzo con il civico e lo aggiungeremo con il prossimo aggiornamento',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
                      child: Text(
                        '(La mappa mostra solamente i 20 nasoni più vicini alla tua posizione attuale)',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 50.0, 40.0, 0.0),
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyDR5-vblj7zu3V1bIfJAiNm2pEhkTioDdo',
                          androidGoogleMapsApiKey:
                              'AIzaSyBAnvgPmnSxrlr_uDv6TWNwSmt7SPeLevg',
                          webGoogleMapsApiKey:
                              'AIzaSyASvMadv5YCMP1XXJa6ff6soGnDxadin5Y',
                          onSelect: (place) async {
                            setState(() => _model.placePickerValue = place);
                          },
                          defaultText: 'Inserisci indirizzo',
                          icon: Icon(
                            Icons.place,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: double.infinity,
                            height: 56.0,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textAlign: TextAlign.center,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: (_model.placePickerValue == null)
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'SEGNALAZIONE_NASONI_INVIA_BTN_ON_TAP');
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

                                context.pushNamed('nasoniMap');

                                logFirebaseEvent('Button_bottom_sheet');
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
                                        child: const GrazieSegnalazioneWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                        text: 'INVIA',
                        options: FFButtonOptions(
                          width: 160.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ),
                  ].addToEnd(const SizedBox(height: 150.0)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.bottomNavNasoniModel,
                  updateCallback: () => setState(() {}),
                  child: const BottomNavNasoniWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
