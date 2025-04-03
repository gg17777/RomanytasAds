import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/delete_friend_widget.dart';
import '/components/delete_request_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'contacts_bulk_sent_model.dart';
export 'contacts_bulk_sent_model.dart';

class ContactsBulkSentWidget extends StatefulWidget {
  const ContactsBulkSentWidget({
    super.key,
    required this.users,
  });

  final List<UsersRecord>? users;

  static String routeName = 'contactsBulkSent';
  static String routePath = 'contactsBulkSent';

  @override
  State<ContactsBulkSentWidget> createState() => _ContactsBulkSentWidgetState();
}

class _ContactsBulkSentWidgetState extends State<ContactsBulkSentWidget>
    with TickerProviderStateMixin {
  late ContactsBulkSentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactsBulkSentModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'contactsBulkSent'});
    animationsMap.addAll({
      'buttonOnActionTriggerAnimation1': AnimationInfo(
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
      'buttonOnActionTriggerAnimation2': AnimationInfo(
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Text(
                        'INVIA RICHIESTE DI AMICIZIA',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final user = widget.users!.toList();

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(user.length, (userIndex) {
                                  final userItem = user[userIndex];
                                  return Visibility(
                                    visible: !(currentUserDocument?.friends
                                                .toList() ??
                                            [])
                                        .contains(userItem.reference.id),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CONTACTS_BULK_SENT_Row_2lenf2qr_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                UserProfileSearchedWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'userRef': serializeParam(
                                                    userItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
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
                                                      userItem.photoUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    userItem.nome,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    userItem.cognome,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                              ],
                                            ),
                                          ),
                                          StreamBuilder<
                                              List<FriendsRequestRecord>>(
                                            stream: queryFriendsRequestRecord(
                                              queryBuilder:
                                                  (friendsRequestRecord) =>
                                                      friendsRequestRecord
                                                          .where(
                                                            'Requester',
                                                            isEqualTo: userItem
                                                                .reference,
                                                          )
                                                          .where(
                                                            'Requestee',
                                                            isEqualTo:
                                                                currentUserReference,
                                                          ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    child: SpinKitFadingCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<FriendsRequestRecord>
                                                  containerFriendsRequestRecordList =
                                                  snapshot.data!;
                                              final containerFriendsRequestRecord =
                                                  containerFriendsRequestRecordList
                                                          .isNotEmpty
                                                      ? containerFriendsRequestRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: StreamBuilder<
                                                    List<FriendsRequestRecord>>(
                                                  stream:
                                                      queryFriendsRequestRecord(
                                                    queryBuilder:
                                                        (friendsRequestRecord) =>
                                                            friendsRequestRecord
                                                                .where(
                                                                  'Requester',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                )
                                                                .where(
                                                                  'Requestee',
                                                                  isEqualTo:
                                                                      userItem
                                                                          .reference,
                                                                ),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 25.0,
                                                          height: 25.0,
                                                          child:
                                                              SpinKitFadingCircle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<FriendsRequestRecord>
                                                        conditionalBuilderAuthFriendsRequestRecordList =
                                                        snapshot.data!;
                                                    final conditionalBuilderAuthFriendsRequestRecord =
                                                        conditionalBuilderAuthFriendsRequestRecordList
                                                                .isNotEmpty
                                                            ? conditionalBuilderAuthFriendsRequestRecordList
                                                                .first
                                                            : null;

                                                    return Builder(
                                                      builder: (context) {
                                                        if (!(conditionalBuilderAuthFriendsRequestRecord !=
                                                                null) &&
                                                            !(currentUserDocument
                                                                        ?.friends
                                                                        .toList() ??
                                                                    [])
                                                                .contains(
                                                                    conditionalBuilderAuthFriendsRequestRecord
                                                                        ?.reference
                                                                        .id) &&
                                                            !(containerFriendsRequestRecord !=
                                                                null)) {
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'CONTACTS_BULK_SENT_Container_t93xp3f0_ON');
                                                              logFirebaseEvent(
                                                                  'Container_backend_call');

                                                              await FriendsRequestRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createFriendsRequestRecordData(
                                                                    requester:
                                                                        currentUserReference,
                                                                    requestee:
                                                                        userItem
                                                                            .reference,
                                                                    status:
                                                                        'pending',
                                                                    dateSent:
                                                                        getCurrentTimestamp,
                                                                    viewed:
                                                                        false,
                                                                  ));
                                                              logFirebaseEvent(
                                                                  'Container_haptic_feedback');
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              logFirebaseEvent(
                                                                  'Container_backend_call');

                                                              await RequestsSentRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createRequestsSentRecordData(
                                                                    type:
                                                                        'contacts',
                                                                  ));
                                                              if (userItem
                                                                      .friendsRequestsNotifications ==
                                                                  true) {
                                                                logFirebaseEvent(
                                                                    'Container_trigger_push_notification');
                                                                triggerPushNotification(
                                                                  notificationTitle:
                                                                      'Richiesta di amicizia',
                                                                  notificationText:
                                                                      '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                  notificationImageUrl:
                                                                      currentUserPhoto,
                                                                  notificationSound:
                                                                      'default',
                                                                  userRefs: [
                                                                    userItem
                                                                        .reference
                                                                  ],
                                                                  initialPageName:
                                                                      'friendsRequests',
                                                                  parameterData: {},
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Richiedi amicizia',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        } else if ((currentUserDocument
                                                                    ?.friends
                                                                    .toList() ??
                                                                [])
                                                            .contains(
                                                                conditionalBuilderAuthFriendsRequestRecord
                                                                    ?.reference
                                                                    .id)) {
                                                          return Visibility(
                                                            visible:
                                                                valueOrDefault<
                                                                    bool>(
                                                              conditionalBuilderAuthFriendsRequestRecord !=
                                                                  null,
                                                              false,
                                                            ),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'CONTACTS_BULK_SENT_PAGE_ButtonSA_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'ButtonSA_bottom_sheet');
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            DeleteFriendWidget(
                                                                          friendsUserRef:
                                                                              userItem.reference,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                              text:
                                                                  'Siete amici',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 32.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: Color(
                                                                    0xFF1E1E1E),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'buttonOnActionTriggerAnimation1']!,
                                                            ),
                                                          );
                                                        } else if (conditionalBuilderAuthFriendsRequestRecord !=
                                                            null) {
                                                          return Visibility(
                                                            visible:
                                                                conditionalBuilderAuthFriendsRequestRecord !=
                                                                    null,
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'CONTACTS_BULK_SENT_PAGE_ButtonRI_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'ButtonRI_bottom_sheet');
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            DeleteRequestWidget(
                                                                          requestRef:
                                                                              conditionalBuilderAuthFriendsRequestRecord.reference,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                              text:
                                                                  'Richiesta inviata',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 32.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: Color(
                                                                    0xFF1E1E1E),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'buttonOnActionTriggerAnimation2']!,
                                                            ),
                                                          );
                                                        } else if (containerFriendsRequestRecord !=
                                                            null) {
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'CONTACTS_BULK_SENT_Container_u0hbhuqj_ON');
                                                              logFirebaseEvent(
                                                                  'Container_custom_action');
                                                              await actions
                                                                  .addFriend(
                                                                currentUserReference!
                                                                    .id,
                                                                userItem
                                                                    .reference
                                                                    .id,
                                                              );
                                                              logFirebaseEvent(
                                                                  'Container_haptic_feedback');
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              logFirebaseEvent(
                                                                  'Container_backend_call');

                                                              await RequestAcceptedRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createRequestAcceptedRecordData(
                                                                    date:
                                                                        getCurrentTimestamp,
                                                                  ));
                                                              logFirebaseEvent(
                                                                  'Container_backend_call');
                                                              await containerFriendsRequestRecord
                                                                  .reference
                                                                  .delete();
                                                              logFirebaseEvent(
                                                                  'Container_trigger_push_notification');
                                                              triggerPushNotification(
                                                                notificationTitle:
                                                                    '${valueOrDefault(currentUserDocument?.nome, '')} ha accettato la tua richiesta di amicizia!',
                                                                notificationText:
                                                                    '',
                                                                notificationSound:
                                                                    'default',
                                                                userRefs: [
                                                                  userItem
                                                                      .reference
                                                                ],
                                                                initialPageName:
                                                                    'Profilo',
                                                                parameterData: {},
                                                              );
                                                            },
                                                            child: Container(
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Accetta richiesta',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'CONTACTS_BULK_SENT_Container_4txwvv1y_ON');
                                                              logFirebaseEvent(
                                                                  'Container_backend_call');

                                                              await FriendsRequestRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createFriendsRequestRecordData(
                                                                    requester:
                                                                        currentUserReference,
                                                                    requestee:
                                                                        userItem
                                                                            .reference,
                                                                    status:
                                                                        'pending',
                                                                    dateSent:
                                                                        getCurrentTimestamp,
                                                                    viewed:
                                                                        false,
                                                                  ));
                                                              logFirebaseEvent(
                                                                  'Container_haptic_feedback');
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              logFirebaseEvent(
                                                                  'Container_backend_call');

                                                              await RequestsSentRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createRequestsSentRecordData(
                                                                    type:
                                                                        'contacts',
                                                                  ));
                                                              if (userItem
                                                                      .friendsRequestsNotifications ==
                                                                  true) {
                                                                logFirebaseEvent(
                                                                    'Container_trigger_push_notification');
                                                                triggerPushNotification(
                                                                  notificationTitle:
                                                                      'Richiesta di amicizia',
                                                                  notificationText:
                                                                      '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                  notificationImageUrl:
                                                                      currentUserPhoto,
                                                                  notificationSound:
                                                                      'default',
                                                                  userRefs: [
                                                                    userItem
                                                                        .reference
                                                                  ],
                                                                  initialPageName:
                                                                      'friendsRequests',
                                                                  parameterData: {},
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Richiedi amicizia',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).divide(
                                  SizedBox(height: 20.0),
                                  filterFn: (userIndex) {
                                    final userItem = user[userIndex];
                                    return !(currentUserDocument?.friends
                                                .toList() ??
                                            [])
                                        .contains(userItem.reference.id);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 50.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'CONTACTS_BULK_SENT_Container_4qcnnnvf_ON');
                    logFirebaseEvent('Container_backend_call');

                    await currentUserReference!.update(createUsersRecordData(
                      syncContacts: true,
                    ));
                    logFirebaseEvent('Container_navigate_to');

                    context.pushNamed(EventiHomeWidget.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Avanti',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
      ),
    );
  }
}
