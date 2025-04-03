import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'edit_filters_swipes_model.dart';
export 'edit_filters_swipes_model.dart';

class EditFiltersSwipesWidget extends StatefulWidget {
  const EditFiltersSwipesWidget({super.key});

  static String routeName = 'edit_filters_swipes';
  static String routePath = 'editFiltersSwipes';

  @override
  State<EditFiltersSwipesWidget> createState() =>
      _EditFiltersSwipesWidgetState();
}

class _EditFiltersSwipesWidgetState extends State<EditFiltersSwipesWidget> {
  late EditFiltersSwipesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditFiltersSwipesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'edit_filters_swipes'});
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 66.0, 0.0, 5.0),
                        child: Text(
                          'Modifica filtri',
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
                          'EDIT_FILTERS_SWIPES_Icon_ugek9xtw_ON_TAP');
                      logFirebaseEvent('Icon_navigate_back');
                      context.safePop();
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Text(
                'Qui puoi modificare i tuoi filtri per la funzione di Date Matching',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).alternate,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Text(
                'Mi identifico come:',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => FlutterFlowChoiceChips(
                  options: [
                    ChipData('Donna'),
                    ChipData('Uomo'),
                    ChipData('Altro')
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.choiceChipsValue1 = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primary,
                    iconSize: 16.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    elevation: 0.0,
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderWidth: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 16.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    elevation: 0.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  chipSpacing: 8.0,
                  rowSpacing: 8.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue1 != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController1 ??=
                      FormFieldController<List<String>>(
                    [valueOrDefault(currentUserDocument?.sex, '')],
                  ),
                  wrapped: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
              child: Text(
                'Sono alla ricerca di:',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => FlutterFlowChoiceChips(
                  options: [
                    ChipData('Donna'),
                    ChipData('Uomo'),
                    ChipData('Entrambi')
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.choiceChipsValue2 = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primary,
                    iconSize: 16.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    elevation: 0.0,
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderWidth: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 16.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    elevation: 0.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  chipSpacing: 8.0,
                  rowSpacing: 8.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue2 != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController2 ??=
                      FormFieldController<List<String>>(
                    [valueOrDefault(currentUserDocument?.matchSex, '')],
                  ),
                  wrapped: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('EDIT_FILTERS_SWIPES_Container_qducs89p_O');
                  if ((_model.choiceChipsValue1 != null &&
                          _model.choiceChipsValue1 != '') &&
                      (_model.choiceChipsValue2 != null &&
                          _model.choiceChipsValue2 != '')) {
                    logFirebaseEvent('Container_backend_call');

                    await currentUserReference!.update(createUsersRecordData(
                      sex: _model.choiceChipsValue1,
                      matchSex: _model.choiceChipsValue2,
                    ));
                    logFirebaseEvent('Container_haptic_feedback');
                    HapticFeedback.lightImpact();
                    logFirebaseEvent('Container_navigate_to');

                    context.pushNamed(
                      SettingsWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                        ),
                      },
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
                        : FlutterFlowTheme.of(context).accent3,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Salva',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).tertiary,
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
    );
  }
}
