import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/delete_request2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/friends/empty_friends_request_list/empty_friends_request_list_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'all_friends_requests_model.dart';
export 'all_friends_requests_model.dart';

class AllFriendsRequestsWidget extends StatefulWidget {
  const AllFriendsRequestsWidget({super.key});

  static String routeName = 'all_friends_requests';
  static String routePath = 'allFriendsRequests';

  @override
  State<AllFriendsRequestsWidget> createState() =>
      _AllFriendsRequestsWidgetState();
}

class _AllFriendsRequestsWidgetState extends State<AllFriendsRequestsWidget> {
  late AllFriendsRequestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllFriendsRequestsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'all_friends_requests'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ALL_FRIENDS_REQUESTS_all_friends_request');
      logFirebaseEvent('all_friends_requests_update_page_state');
      _model.loading = true;
      safeSetState(() {});
      logFirebaseEvent('all_friends_requests_custom_action');
      _model.retrievedMatches = await actions.getActiveMatches(
        currentUserUid,
      );
      logFirebaseEvent('all_friends_requests_update_page_state');
      _model.loading = false;
      _model.matches = _model.retrievedMatches!.toList().cast<MatchesRecord>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FriendsRequestRecord>>(
      stream: queryFriendsRequestRecord(
        queryBuilder: (friendsRequestRecord) => friendsRequestRecord.where(
          'Requestee',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 25.0,
                ),
              ),
            ),
          );
        }
        List<FriendsRequestRecord> allFriendsRequestsFriendsRequestRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('ALL_FRIENDS_REQUESTS_keyboard_arrow_left');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'RICHIESTE DI AMICIZIA',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 10.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            'Qui puoi visualizzare le richieste di amicizia che ricevi',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 10.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final friendsRequest =
                                  allFriendsRequestsFriendsRequestRecordList
                                      .toList();
                              if (friendsRequest.isEmpty) {
                                return Container(
                                  height: double.infinity,
                                  child: EmptyFriendsRequestListWidget(),
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  30.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: friendsRequest.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 20.0),
                                itemBuilder: (context, friendsRequestIndex) {
                                  final friendsRequestItem =
                                      friendsRequest[friendsRequestIndex];
                                  return StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        friendsRequestItem.requester!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 25.0,
                                            height: 25.0,
                                            child: SpinKitFadingCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 25.0,
                                            ),
                                          ),
                                        );
                                      }

                                      final rowUsersRecord = snapshot.data!;

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'ALL_FRIENDS_REQUESTS_Row_qkwlhucl_ON_TAP');
                                                logFirebaseEvent(
                                                    'Row_navigate_to');

                                                context.pushNamed(
                                                  UserProfileSearchedWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'userRef': serializeParam(
                                                      rowUsersRecord.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              rowUsersRecord
                                                                  .photoUrl,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${rowUsersRecord.nome} ${rowUsersRecord.cognome}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                              "relative",
                                                              friendsRequestItem
                                                                  .dateSent!,
                                                              locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageShortCode ??
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ALL_FRIENDS_REQUESTS_CONFERMA_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_custom_action');
                                                      await actions.addFriend(
                                                        friendsRequestItem
                                                            .requestee!.id,
                                                        friendsRequestItem
                                                            .requester!.id,
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_haptic_feedback');
                                                      HapticFeedback
                                                          .lightImpact();
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      await friendsRequestItem
                                                          .reference
                                                          .delete();
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      await RequestAcceptedRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createRequestAcceptedRecordData(
                                                            date:
                                                                getCurrentTimestamp,
                                                          ));
                                                      logFirebaseEvent(
                                                          'Button_trigger_push_notification');
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            '${rowUsersRecord.nome} ha accettato la tua richiesta di amicizia!',
                                                        notificationText: '',
                                                        notificationSound:
                                                            'default',
                                                        userRefs: [
                                                          friendsRequestItem
                                                              .requester!
                                                        ],
                                                        initialPageName:
                                                            'Profilo',
                                                        parameterData: {},
                                                      );
                                                    },
                                                    text: 'Conferma',
                                                    options: FFButtonOptions(
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ALL_FRIENDS_REQUESTS_ELIMINA_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  DeleteRequest2Widget(
                                                                requestRef:
                                                                    friendsRequestItem
                                                                        .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      logFirebaseEvent(
                                                          'Button_haptic_feedback');
                                                      HapticFeedback
                                                          .lightImpact();
                                                    },
                                                    text: 'Elimina',
                                                    options: FFButtonOptions(
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF1E1E1E),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
