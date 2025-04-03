import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/delete_friend_widget.dart';
import '/components/delete_request_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user_profile_searched_model.dart';
export 'user_profile_searched_model.dart';

class UserProfileSearchedWidget extends StatefulWidget {
  const UserProfileSearchedWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  static String routeName = 'userProfileSearched';
  static String routePath = 'userProfileSearched';

  @override
  State<UserProfileSearchedWidget> createState() =>
      _UserProfileSearchedWidgetState();
}

class _UserProfileSearchedWidgetState extends State<UserProfileSearchedWidget> {
  late UserProfileSearchedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileSearchedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'userProfileSearched'});
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
        body: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(widget.userRef!),
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

            final stackUsersRecord = snapshot.data!;

            return Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: StreamBuilder<List<FriendsRequestRecord>>(
                    stream: queryFriendsRequestRecord(
                      queryBuilder: (friendsRequestRecord) =>
                          friendsRequestRecord
                              .where(
                                'Requester',
                                isEqualTo: widget.userRef,
                              )
                              .where(
                                'Requestee',
                                isEqualTo: currentUserReference,
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
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 25.0,
                            ),
                          ),
                        );
                      }
                      List<FriendsRequestRecord>
                          containerAcceptRequestUserFriendsRequestRecordList =
                          snapshot.data!;
                      final containerAcceptRequestUserFriendsRequestRecord =
                          containerAcceptRequestUserFriendsRequestRecordList
                                  .isNotEmpty
                              ? containerAcceptRequestUserFriendsRequestRecordList
                                  .first
                              : null;

                      return Container(
                        decoration: BoxDecoration(),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'USER_PROFILE_SEARCHED_Column_7himzhkk_ON');
                                logFirebaseEvent('Column_update_page_state');
                                _model.blockPopUp = false;
                                safeSetState(() {});
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 55.0, 20.0, 0.0),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'USER_PROFILE_SEARCHED_Icon_yp1hof6y_ON_T');
                                                      logFirebaseEvent(
                                                          'Icon_navigate_back');
                                                      context.safePop();
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .chevron_left_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'USER_PROFILE_SEARCHED_Icon_b06zmwt1_ON_T');
                                                        logFirebaseEvent(
                                                            'Icon_update_page_state');
                                                        _model.blockPopUp =
                                                            true;
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.sort_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (_model.blockPopUp)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 3.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      width: 150.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'USER_PROFILE_SEARCHED_Row_gbdcf99b_ON_TA');
                                                          logFirebaseEvent(
                                                              'Row_custom_action');
                                                          _model.userBlocked =
                                                              await actions
                                                                  .toggleBlockUser(
                                                            widget.userRef!.id,
                                                          );
                                                          logFirebaseEvent(
                                                              'Row_haptic_feedback');
                                                          HapticFeedback
                                                              .lightImpact();

                                                          safeSetState(() {});
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.block,
                                                              color: Color(
                                                                  0xFF9D9D9D),
                                                              size: 20.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        Text(
                                                                  (currentUserDocument?.myBlocks.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              stackUsersRecord.reference)
                                                                      ? 'Utente bloccato'
                                                                      : 'Blocca utente',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFF9D9D9D),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  (currentUserDocument?.myBlocks
                                                                  .toList() ??
                                                              [])
                                                          .contains(
                                                              stackUsersRecord
                                                                  .reference)
                                                      ? 'Utente bloccato'
                                                      : 'Profilo utente',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: (currentUserDocument
                                                                        ?.myBlocks
                                                                        .toList() ??
                                                                    [])
                                                                .contains(
                                                                    stackUsersRecord
                                                                        .reference)
                                                            ? Color(0xFF910202)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.6,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.55,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 3.0,
                                            ),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'USER_PROFILE_SEARCHED_CircleImage_znpxhv');
                                              logFirebaseEvent(
                                                  'Image_update_page_state');
                                              _model.blockPopUp = false;
                                              safeSetState(() {});
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  stackUsersRecord.photoUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/1as520apcp2z/profilo_eaqf.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 30.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              '${stackUsersRecord.nome} ${stackUsersRecord.cognome}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        17.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (stackUsersRecord
                                                                  .reference
                                                                  .id ==
                                                              'ThwC2m1GP4gOovGjJOmvLLehTlR2')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/verified-badge-profile-icon-png.png',
                                                                  width: 22.0,
                                                                  height: 22.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'USER_PROFILE_SEARCHED_ConditionalBuilder');
                                                        logFirebaseEvent(
                                                            'ConditionalBuilder_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
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
                                                                    DeleteFriendWidget(
                                                                  friendsUserRef:
                                                                      widget
                                                                          .userRef!,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (!(currentUserDocument
                                                                      ?.myBlocks
                                                                      .toList() ??
                                                                  [])
                                                              .contains(
                                                                  stackUsersRecord
                                                                      .reference)) {
                                                            return StreamBuilder<
                                                                List<
                                                                    FriendsRequestRecord>>(
                                                              stream:
                                                                  queryFriendsRequestRecord(
                                                                queryBuilder:
                                                                    (friendsRequestRecord) =>
                                                                        friendsRequestRecord
                                                                            .where(
                                                                              'Requester',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'Requestee',
                                                                              isEqualTo: widget.userRef,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          25.0,
                                                                      height:
                                                                          25.0,
                                                                      child:
                                                                          SpinKitFadingCircle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<FriendsRequestRecord>
                                                                    conditionalBuilderAuthFriendsRequestRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final conditionalBuilderAuthFriendsRequestRecord =
                                                                    conditionalBuilderAuthFriendsRequestRecordList
                                                                            .isNotEmpty
                                                                        ? conditionalBuilderAuthFriendsRequestRecordList
                                                                            .first
                                                                        : null;

                                                                return Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (!(conditionalBuilderAuthFriendsRequestRecord !=
                                                                            null) &&
                                                                        !(currentUserDocument?.friends.toList() ?? []).contains(widget
                                                                            .userRef
                                                                            ?.id) &&
                                                                        !(containerAcceptRequestUserFriendsRequestRecord !=
                                                                            null)) {
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('USER_PROFILE_SEARCHED_Container_1ee3xht7');
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                    status: 'pending',
                                                                                    dateSent: getCurrentTimestamp,
                                                                                    viewed: false,
                                                                                    requester: currentUserReference,
                                                                                    requestee: stackUsersRecord.reference,
                                                                                  ));
                                                                              logFirebaseEvent('Container_haptic_feedback');
                                                                              HapticFeedback.lightImpact();
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                    type: 'userProfile',
                                                                                  ));
                                                                              logFirebaseEvent('Container_update_page_state');
                                                                              _model.blockPopUp = false;
                                                                              safeSetState(() {});
                                                                              if (stackUsersRecord.friendsRequestsNotifications == true) {
                                                                                logFirebaseEvent('Container_trigger_push_notification');
                                                                                triggerPushNotification(
                                                                                  notificationTitle: 'Richiesta di amicizia',
                                                                                  notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                  notificationImageUrl: currentUserPhoto,
                                                                                  notificationSound: 'default',
                                                                                  userRefs: [
                                                                                    widget.userRef!
                                                                                  ],
                                                                                  initialPageName: 'friendsRequests',
                                                                                  parameterData: {},
                                                                                );
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 140.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  'Richiedi amicizia',
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
                                                                          ),
                                                                        ],
                                                                      );
                                                                    } else if ((currentUserDocument?.friends.toList() ??
                                                                            [])
                                                                        .contains(widget
                                                                            .userRef
                                                                            ?.id)) {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'USER_PROFILE_SEARCHED_Container_ntv42hux');
                                                                          logFirebaseEvent(
                                                                              'Container_bottom_sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: DeleteFriendWidget(
                                                                                    friendsUserRef: widget.userRef!,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));

                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model.blockPopUp =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              140.0,
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFF1E1E1E),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'Siete amici',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else if (conditionalBuilderAuthFriendsRequestRecord !=
                                                                        null) {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'USER_PROFILE_SEARCHED_Container_uwzizgjv');
                                                                          logFirebaseEvent(
                                                                              'Container_bottom_sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: DeleteRequestWidget(
                                                                                    requestRef: conditionalBuilderAuthFriendsRequestRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));

                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model.blockPopUp =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              140.0,
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFF1E1E1E),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'Richiesta inviata',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else if (containerAcceptRequestUserFriendsRequestRecord !=
                                                                        null) {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'USER_PROFILE_SEARCHED_Container_r3k1uo2w');
                                                                          logFirebaseEvent(
                                                                              'Container_custom_action');
                                                                          await actions
                                                                              .addFriend(
                                                                            widget.userRef!.id,
                                                                            currentUserReference!.id,
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
                                                                              .set(createRequestAcceptedRecordData(
                                                                                date: getCurrentTimestamp,
                                                                              ));
                                                                          logFirebaseEvent(
                                                                              'Container_backend_call');
                                                                          await containerAcceptRequestUserFriendsRequestRecord
                                                                              .reference
                                                                              .delete();
                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model.blockPopUp =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Container_trigger_push_notification');
                                                                          triggerPushNotification(
                                                                            notificationTitle:
                                                                                '${stackUsersRecord.nome} ha accettato la tua richiesta di amicizia!',
                                                                            notificationText:
                                                                                '',
                                                                            notificationSound:
                                                                                'default',
                                                                            userRefs: [
                                                                              stackUsersRecord.reference
                                                                            ],
                                                                            initialPageName:
                                                                                'Profilo',
                                                                            parameterData: {},
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              140.0,
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'Accetta richiesta',
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
                                                                      );
                                                                    } else {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'USER_PROFILE_SEARCHED_Container_mhy9oznf');
                                                                          logFirebaseEvent(
                                                                              'Container_backend_call');

                                                                          await FriendsRequestRecord
                                                                              .collection
                                                                              .doc()
                                                                              .set(createFriendsRequestRecordData(
                                                                                status: 'pending',
                                                                                dateSent: getCurrentTimestamp,
                                                                                viewed: false,
                                                                                requester: currentUserReference,
                                                                                requestee: widget.userRef,
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
                                                                              .set(createRequestsSentRecordData(
                                                                                type: 'userProfile',
                                                                              ));
                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model.blockPopUp =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                          if (stackUsersRecord.friendsRequestsNotifications ==
                                                                              true) {
                                                                            logFirebaseEvent('Container_trigger_push_notification');
                                                                            triggerPushNotification(
                                                                              notificationTitle: 'Richiesta di amicizia',
                                                                              notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                              notificationImageUrl: currentUserPhoto,
                                                                              notificationSound: 'default',
                                                                              userRefs: [
                                                                                widget.userRef!
                                                                              ],
                                                                              initialPageName: 'friendsRequests',
                                                                              parameterData: {},
                                                                            );
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              140.0,
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'Richiedi amicizia',
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
                                                                      );
                                                                    }
                                                                  },
                                                                );
                                                              },
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
                                                                    'USER_PROFILE_SEARCHED_Container_bu89zuqn');
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.blockPopUp =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Container_custom_action');
                                                                _model.userBlockedCopy =
                                                                    await actions
                                                                        .toggleBlockUser(
                                                                  widget
                                                                      .userRef!
                                                                      .id,
                                                                );
                                                                logFirebaseEvent(
                                                                    'Container_haptic_feedback');
                                                                HapticFeedback
                                                                    .lightImpact();

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: 140.0,
                                                                height: 32.0,
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
                                                                  child: Text(
                                                                    'Utente bloccato',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (stackUsersRecord
                                                                      .uni !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .university,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              stackUsersRecord
                                                                  .uni,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'USER_PROFILE_SEARCHED_Text_c7lgxqih_ON_T');
                                                            logFirebaseEvent(
                                                                'Text_navigate_to');

                                                            context.pushNamed(
                                                              FriendsListUserWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'userRef':
                                                                    serializeParam(
                                                                  widget
                                                                      .userRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Text(
                                                            '${stackUsersRecord.friends.length.toString()}${stackUsersRecord.friends.length == 1 ? ' amico' : ' amici'}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Text(
                                                  stackUsersRecord.bioProfile,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].addToEnd(SizedBox(height: 110.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
