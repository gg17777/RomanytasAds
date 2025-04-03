import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_photo_swipe_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'filter_swipes_model.dart';
export 'filter_swipes_model.dart';

class FilterSwipesWidget extends StatefulWidget {
  const FilterSwipesWidget({
    super.key,
    required this.eventId,
    required this.participatingDocs,
    required this.eventName,
  });

  final DocumentReference? eventId;
  final List<EventiParticiaptingRecord>? participatingDocs;
  final String? eventName;

  static String routeName = 'filter_swipes';
  static String routePath = 'filterSwipes';

  @override
  State<FilterSwipesWidget> createState() => _FilterSwipesWidgetState();
}

class _FilterSwipesWidgetState extends State<FilterSwipesWidget> {
  late FilterSwipesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterSwipesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'filter_swipes'});
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
        body: Column(
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 63.0, 0.0, 5.0),
                        child: Text(
                          'Applica filtri',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'FILTER_SWIPES_PAGE_Icon_055fvnqg_ON_TAP');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed(
                        EventiProfileWidget.routeName,
                        queryParameters: {
                          'eventoRef': serializeParam(
                            widget.eventId,
                            ParamType.DocumentReference,
                          ),
                          'goBack': serializeParam(
                            'filters',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Text(
                          'Per poter utilizzare la funzione di Date Matching è necessario settare i propri filtri',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 20.0, 0.0),
                        child: Text(
                          'Puoi modificare i tuoi filtri in qualsiasi momento andando su Profilo > Impostazioni > Modifica Filtri',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Text(
                          'Mi identifico come:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: [
                            ChipData('Donna'),
                            ChipData('Uomo'),
                            ChipData('Altro')
                          ],
                          onChanged: (val) => safeSetState(() =>
                              _model.choiceChipsValue1 = val?.firstOrNull),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primary,
                            iconSize: 16.0,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 16.0,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          chipSpacing: 8.0,
                          rowSpacing: 8.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController1 ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                        child: Text(
                          'Sono alla ricerca di:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: [
                            ChipData('Donna'),
                            ChipData('Uomo'),
                            ChipData('Entrambi')
                          ],
                          onChanged: (val) => safeSetState(() =>
                              _model.choiceChipsValue2 = val?.firstOrNull),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primary,
                            iconSize: 16.0,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 16.0,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          chipSpacing: 8.0,
                          rowSpacing: 8.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController2 ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 100.0, 0.0, 70.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'FILTER_SWIPES_Container_t811z6c3_ON_TAP');
                            logFirebaseEvent('Container_backend_call');

                            await functions
                                .returnEventiParticiaptingDocRef(
                                    widget.participatingDocs?.toList(),
                                    currentUserReference)!
                                .update(createEventiParticiaptingRecordData(
                                  sex: _model.choiceChipsValue1,
                                  matchSex: _model.choiceChipsValue2,
                                ));
                            logFirebaseEvent('Container_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              sex: _model.choiceChipsValue1,
                              matchSex: _model.choiceChipsValue2,
                            ));
                            logFirebaseEvent('Container_haptic_feedback');
                            HapticFeedback.lightImpact();
                            if (currentUserPhoto == '') {
                              logFirebaseEvent('Container_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: NoPhotoSwipeWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else {
                              logFirebaseEvent('Container_wait__delay');
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                Prova2Widget.routeName,
                                queryParameters: {
                                  'eventRef': serializeParam(
                                    widget.eventId,
                                    ParamType.DocumentReference,
                                  ),
                                  'eventId': serializeParam(
                                    widget.eventId?.id,
                                    ParamType.String,
                                  ),
                                  'eventName': serializeParam(
                                    widget.eventName,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          },
                          child: Container(
                            width: 150.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: (_model.choiceChipsValue1 != null &&
                                          _model.choiceChipsValue1 != '') &&
                                      (_model.choiceChipsValue2 != null &&
                                          _model.choiceChipsValue2 != '')
                                  ? FlutterFlowTheme.of(context).primary
                                  : Color(0xFF1E1E1E),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Salva',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
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
            ),
          ],
        ),
      ),
    );
  }
}
