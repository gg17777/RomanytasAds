import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/grazie_segnalazione/grazie_segnalazione_widget.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'zozzone_mancante_model.dart';
export 'zozzone_mancante_model.dart';

class ZozzoneMancanteWidget extends StatefulWidget {
  const ZozzoneMancanteWidget({
    super.key,
    required this.ciboRef,
  });

  final int? ciboRef;

  @override
  State<ZozzoneMancanteWidget> createState() => _ZozzoneMancanteWidgetState();
}

class _ZozzoneMancanteWidgetState extends State<ZozzoneMancanteWidget> {
  late ZozzoneMancanteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZozzoneMancanteModel());

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
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: FutureBuilder<List<GetCiboByIdRow>>(
              future: SQLiteManager.instance.getCiboById(
                queryId: widget.ciboRef,
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
                final containerGetCiboByIdRowList = snapshot.data!;

                return Container(
                  width: 300.0,
                  height:
                      MediaQuery.sizeOf(context).width > 700.0 ? 350.0 : 300.0,
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
                              20.0, 30.0, 20.0, 0.0),
                          child: Text(
                            'Lo zozzone selezionato non esiste o hai trovato chiuso prima dell\'orario segnalato ?',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
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
                            options:
                                ['Chiuso per sempre', 'Chiuso prima'].toList(),
                            onChanged: (val) => safeSetState(() {}),
                            controller: _model.radioButtonValueController ??=
                                FormFieldController<String>(null),
                            optionHeight: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            selectedTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                            const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                                          'ZOZZONE_MANCANTE_COMP_INVIA_BTN_ON_TAP');
                                      logFirebaseEvent('Button_backend_call');

                                      await SegnalazioneCiboRecord.collection
                                          .doc()
                                          .set(createSegnalazioneCiboRecordData(
                                            userEmail: currentUserEmail,
                                            descrizione:
                                                _model.radioButtonValue ==
                                                        'Chiuso per sempre'
                                                    ? 'chiuso per sempre'
                                                    : 'chiuso prima',
                                            createDate: getCurrentTimestamp,
                                            indirizzoText:
                                                containerGetCiboByIdRowList
                                                    .first.addressText,
                                            nomeLocale:
                                                containerGetCiboByIdRowList
                                                    .first.titolo,
                                            elimina: true,
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
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
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
                                disabledColor: const Color(0xFF57636C),
                                disabledTextColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ZOZZONE_MANCANTE_COMP_ANNULLA_BTN_ON_TAP');
                                logFirebaseEvent('Button_bottom_sheet');
                                Navigator.pop(context);
                              },
                              text: 'Annulla',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
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
                                      fontWeight: FontWeight.w600,
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
          ),
        ],
      ),
    );
  }
}
