import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'user_phone_model.dart';
export 'user_phone_model.dart';

class UserPhoneWidget extends StatefulWidget {
  const UserPhoneWidget({super.key});

  static String routeName = 'userPhone';
  static String routePath = 'userPhone';

  @override
  State<UserPhoneWidget> createState() => _UserPhoneWidgetState();
}

class _UserPhoneWidgetState extends State<UserPhoneWidget> {
  late UserPhoneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPhoneModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'userPhone'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('USER_PHONE_PAGE_Text_h18lyzjy_ON_TAP');
                      logFirebaseEvent('Text_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        syncContacts: true,
                      ));
                      logFirebaseEvent('Text_navigate_to');

                      context.pushNamed(EventiHomeWidget.routeName);
                    },
                    child: Text(
                      'Salta',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                  child: Text(
                    'Trova i tuoi amici più facilmente',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).alternate,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                  child: Text(
                    'Aggiungi il tuo numero di telefono',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 40.0, 30.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).tertiary,
                              letterSpacing: 0.0,
                            ),
                    hintText: 'Numero di telefono',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).tertiary,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                  keyboardType: TextInputType.phone,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('USER_PHONE_Container_fpz4qdc3_ON_TAP');
                    var _shouldSetState = false;
                    logFirebaseEvent('Container_backend_call');

                    await currentUserReference!.update(createUsersRecordData(
                      phoneNumber: _model.textController.text,
                    ));
                    logFirebaseEvent('Container_request_permissions');
                    await requestPermission(contactsPermission);
                    logFirebaseEvent('Container_custom_action');
                    _model.allUsersContacts = await actions.fetchContacts();
                    _shouldSetState = true;
                    if (_model.allUsersContacts!.length > 0) {
                      logFirebaseEvent('Container_backend_call');

                      await SyncContactsRecord.collection
                          .doc()
                          .set(createSyncContactsRecordData(
                            type: true,
                            date: getCurrentTimestamp,
                          ));
                      logFirebaseEvent('Container_navigate_to');

                      context.pushNamed(
                        ContactsBulkSentWidget.routeName,
                        queryParameters: {
                          'users': serializeParam(
                            _model.allUsersContacts,
                            ParamType.Document,
                            isList: true,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'users': _model.allUsersContacts,
                        },
                      );

                      if (_shouldSetState) safeSetState(() {});
                      return;
                    } else {
                      logFirebaseEvent('Container_backend_call');

                      await SyncContactsRecord.collection
                          .doc()
                          .set(createSyncContactsRecordData(
                            type: false,
                            date: getCurrentTimestamp,
                          ));
                      logFirebaseEvent('Container_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        syncContacts: true,
                      ));
                      logFirebaseEvent('Container_update_app_state');
                      FFAppState().page = 'events';
                      safeSetState(() {});
                      logFirebaseEvent('Container_navigate_to');

                      context.pushNamed(EventiHomeWidget.routeName);

                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }

                    if (_shouldSetState) safeSetState(() {});
                  },
                  child: Container(
                    width: 160.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Sincronizza',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
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
      ),
    );
  }
}
