import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/info/components/grazie_segnalazione/grazie_segnalazione_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

  LatLng? currentUserLocationValue;

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
    return FutureBuilder<List<GetNasoniByIdRow>>(
      future: SQLiteManager.instance.getNasoniById(
        queryId: widget.nasoneID,
      ),
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
        final containerGetNasoniByIdRowList = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 30.0,
                  child: Divider(
                    height: 30.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 28.0, 0.0),
                    child: Text(
                      'La fontanella selezionata non esiste o non è funzionate ?',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 30.0),
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData('Inesistente'),
                      ChipData('Non funzionante')
                    ],
                    onChanged: (val) => safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                      iconColor: FlutterFlowTheme.of(context).info,
                      iconSize: 16.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 2.0, 12.0, 2.0),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Color(0xFF1E1E1E),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      iconSize: 16.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 2.0, 12.0, 2.0),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    chipSpacing: 16.0,
                    rowSpacing: 8.0,
                    multiselect: false,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    wrapped: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'NASONE_MANCANTE_Container_8cl3xucz_ON_TA');
                      currentUserLocationValue = await getCurrentUserLocation(
                          defaultLocation: LatLng(0.0, 0.0));
                      if (_model.choiceChipsValue != null &&
                          _model.choiceChipsValue != '') {
                        logFirebaseEvent('Container_backend_call');

                        await SegnalazioniNasoniRecord.collection
                            .doc()
                            .set(createSegnalazioniNasoniRecordData(
                              indirizzo: functions.getLatLng(
                                  containerGetNasoniByIdRowList
                                      .firstOrNull?.latitude,
                                  containerGetNasoniByIdRowList
                                      .firstOrNull?.longitude),
                              userEmail: currentUserEmail,
                              createDate: getCurrentTimestamp,
                              aggiungiOelimina:
                                  _model.choiceChipsValue == 'Inesistente'
                                      ? 'Elimina - inesistente'
                                      : 'Elimina - non funzionante',
                              aggiungi: false,
                              indirizzoText: containerGetNasoniByIdRowList
                                  .firstOrNull?.addressText,
                              createdBy: currentUserUid,
                              appName: 'romanytas',
                              userLoc: currentUserLocationValue,
                            ));
                        logFirebaseEvent('Container_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: GrazieSegnalazioneWidget(),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        logFirebaseEvent('Container_bottom_sheet');
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: _model.choiceChipsValue != null &&
                                _model.choiceChipsValue != ''
                            ? FlutterFlowTheme.of(context).primary
                            : Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Invia',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
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
