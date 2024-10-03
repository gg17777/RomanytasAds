import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/grazie_segnalazione/grazie_segnalazione_widget.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'nasone_mancante_model.dart';
export 'nasone_mancante_model.dart';

class NasoneMancanteWidget extends StatefulWidget {
  const NasoneMancanteWidget({
    super.key,
    required this.nasoneID,
  });

  final int? nasoneID;

  @override
  State<NasoneMancanteWidget> createState() => _NasoneMancanteWidgetState();
}

class _NasoneMancanteWidgetState extends State<NasoneMancanteWidget> {
  late NasoneMancanteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NasoneMancanteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<GetNasoniByIdRow>>(
            future: SQLiteManager.instance.getNasoniById(
              queryId: widget.nasoneID,
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
              final containerGetNasoniByIdRowList = snapshot.data!;

              return Container(
                width: 300.0,
                height: 280.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            28.0, 35.0, 28.0, 0.0),
                        child: Text(
                          'Il nasone selezionato non esiste o non è funzionate ?',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 0.0, 0.0),
                        child: FlutterFlowRadioButton(
                          options: ['Inesistente', 'Non funzionante'].toList(),
                          onChanged: (val) => safeSetState(() {}),
                          controller: _model.radioButtonValueController ??=
                              FormFieldController<String>(null),
                          optionHeight: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: (_model.radioButtonValue == null ||
                                    _model.radioButtonValue == '')
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'NASONE_MANCANTE_COMP_INVIA_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');

                                    await SegnalazioniNasoniRecord.collection
                                        .doc()
                                        .set(createSegnalazioniNasoniRecordData(
                                          indirizzo: functions.getLatLng(
                                              containerGetNasoniByIdRowList
                                                  .first.latitude,
                                              containerGetNasoniByIdRowList
                                                  .first.longitude),
                                          userEmail: currentUserEmail,
                                          createDate: getCurrentTimestamp,
                                          aggiungiOelimina:
                                              _model.radioButtonValue ==
                                                      'Inesistente'
                                                  ? 'Elimina - inesistente'
                                                  : 'Elimina - non funzionante',
                                          aggiungi: false,
                                          indirizzoText:
                                              containerGetNasoniByIdRowList
                                                  .first.addressText,
                                          createdBy: currentUserUid,
                                          appName: 'romanytas',
                                        ));
                                    logFirebaseEvent('Button_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const GrazieSegnalazioneWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                  },
                            text: 'Invia',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
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
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NASONE_MANCANTE_COMP_CHIUDI_BTN_ON_TAP');
                              logFirebaseEvent('Button_bottom_sheet');
                              Navigator.pop(context);
                            },
                            text: 'Chiudi',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xFF757474),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
