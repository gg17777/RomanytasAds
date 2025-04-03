import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  static String routeName = 'searchPage';
  static String routePath = 'searchPage';

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'searchPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEARCH_searchPage_ON_INIT_STATE');
      logFirebaseEvent('searchPage_update_app_state');
      FFAppState().page = 'search';
      safeSetState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 140.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (_model.textController.text != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FutureBuilder<List<UsersRecord>>(
                            future: UsersRecord.search(
                              term: _model.textController.text,
                              maxResults: 20,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 25.0,
                                    height: 25.0,
                                    child: SpinKitFadingCircle(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 25.0,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> listViewUsersRecordList =
                                  snapshot.data!;
                              // Customize what your widget looks like with no search results.
                              if (snapshot.data!.isEmpty) {
                                return Container(
                                  height: 100,
                                  child: Center(
                                    child: Text('No results.'),
                                  ),
                                );
                              }
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewUsersRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 15.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewUsersRecord =
                                      listViewUsersRecordList[listViewIndex];
                                  return Visibility(
                                    visible: ((listViewUsersRecord.reference !=
                                                currentUserReference) &&
                                            ((listViewUsersRecord.manager == false) ||
                                                (listViewUsersRecord.manager ==
                                                    null))) ||
                                        (listViewUsersRecord.manager &&
                                            (listViewUsersRecord.imgLocale !=
                                                    '') &&
                                            (listViewUsersRecord
                                                        .imageUnderProfile1 !=
                                                    '') &&
                                            (listViewUsersRecord
                                                        .imageUnderProfile2 !=
                                                    '') &&
                                            (listViewUsersRecord
                                                        .imageUnderProfile3 !=
                                                    '') &&
                                            (listViewUsersRecord.backgroundProfile != '')),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SEARCH_PAGE_PAGE_Row_18qvji46_ON_TAP');
                                        logFirebaseEvent('Row_backend_call');

                                        await CountUserSearchRecord.collection
                                            .doc()
                                            .set(
                                                createCountUserSearchRecordData(
                                              date: getCurrentTimestamp,
                                            ));
                                        if (listViewUsersRecord.manager) {
                                          logFirebaseEvent('Row_navigate_to');

                                          context.pushNamed(
                                            ManagerProfileWidget.routeName,
                                            queryParameters: {
                                              'managerRef': serializeParam(
                                                listViewUsersRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          logFirebaseEvent('Row_navigate_to');

                                          context.pushNamed(
                                            UserProfileSearchedWidget.routeName,
                                            queryParameters: {
                                              'userRef': serializeParam(
                                                listViewUsersRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 50.0,
                                            height: 50.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                listViewUsersRecord.manager
                                                    ? listViewUsersRecord
                                                        .imgLocale
                                                    : listViewUsersRecord
                                                        .photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                listViewUsersRecord.manager
                                                    ? listViewUsersRecord
                                                        .nomeLocale
                                                    : '${listViewUsersRecord.nome} ${listViewUsersRecord.cognome}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          if (listViewUsersRecord
                                                  .reference.id ==
                                              'ThwC2m1GP4gOovGjJOmvLLehTlR2')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/verified-badge-profile-icon-png.png',
                                                  width: 22.0,
                                                  height: 22.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                    ].addToEnd(SizedBox(
                        height: (isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible)
                            ? 0.0
                            : 100.0)),
                  ),
                ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 70.0, 20.0, 0.0),
              child: Container(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 1000),
                    () => safeSetState(() {}),
                  ),
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                    hintText: 'Trova i tuoi amici',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF8C8C8C),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFF1E1E1E),
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    suffixIcon: _model.textController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () async {
                              _model.textController?.clear();
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 20.0,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
