import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/delete_request_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/friends/empty_friends_list_events/empty_friends_list_events_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'past_participants_events_model.dart';
export 'past_participants_events_model.dart';

class PastParticipantsEventsWidget extends StatefulWidget {
  const PastParticipantsEventsWidget({
    super.key,
    required this.eventoRef,
  });

  final DocumentReference? eventoRef;

  static String routeName = 'past_participants_events';
  static String routePath = 'pastParticipantsEvents';

  @override
  State<PastParticipantsEventsWidget> createState() =>
      _PastParticipantsEventsWidgetState();
}

class _PastParticipantsEventsWidgetState
    extends State<PastParticipantsEventsWidget> {
  late PastParticipantsEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PastParticipantsEventsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'past_participants_events'});
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
        body: Container(
          decoration: BoxDecoration(),
          child: StreamBuilder<List<EventiParticiaptingRecord>>(
            stream: queryEventiParticiaptingRecord(
              parent: widget.eventoRef,
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
              List<EventiParticiaptingRecord>
                  containerEventiParticiaptingRecordList = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          60.0,
                          0.0,
                          valueOrDefault<double>(
                            isiOS ? 40.0 : 10.0,
                            0.0,
                          )),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PAST_PARTICIPANTS_EVENTS_Icon_fu44i0dz_O');
                                          logFirebaseEvent(
                                              'Icon_navigate_back');
                                          context.safePop();
                                        },
                                        child: Icon(
                                          Icons.chevron_left_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Partecipanti',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).primary,
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
                                          20.0, 10.0, 20.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final friendsParticipating =
                                                containerEventiParticiaptingRecordList
                                                    .where((e) => functions
                                                        .uidsToUserRefs(
                                                            (currentUserDocument
                                                                        ?.friends
                                                                        .toList() ??
                                                                    [])
                                                                .toList())
                                                        .contains(e
                                                            .userParticipatingEventRef))
                                                    .toList();
                                            if (friendsParticipating.isEmpty) {
                                              return EmptyFriendsListEventsWidget();
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  friendsParticipating.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 15.0),
                                              itemBuilder: (context,
                                                  friendsParticipatingIndex) {
                                                final friendsParticipatingItem =
                                                    friendsParticipating[
                                                        friendsParticipatingIndex];
                                                return StreamBuilder<
                                                    UsersRecord>(
                                                  stream: UsersRecord.getDocument(
                                                      friendsParticipatingItem
                                                          .userParticipatingEventRef!),
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

                                                    final rowUsersRecord =
                                                        snapshot.data!;

                                                    return InkWell(
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
                                                            'PAST_PARTICIPANTS_EVENTS_Row_49gi4z50_ON');
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');

                                                        context.pushNamed(
                                                          UserProfileSearchedWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'userRef':
                                                                serializeParam(
                                                              rowUsersRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        1000.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        1000.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        1000.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        1000.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 3.0,
                                                              ),
                                                            ),
                                                            child: Container(
                                                              width: 47.0,
                                                              height: 47.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  rowUsersRecord
                                                                      .photoUrl,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (rowUsersRecord
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
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Builder(
                                                builder: (context) {
                                                  final participantsNoFriends =
                                                      containerEventiParticiaptingRecordList
                                                          .where((e) => !functions
                                                              .uidsToUserRefs(
                                                                  (currentUserDocument
                                                                              ?.friends
                                                                              .toList() ??
                                                                          [])
                                                                      .toList())
                                                              .contains(e
                                                                  .userParticipatingEventRef))
                                                          .toList();

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        participantsNoFriends
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 15.0),
                                                    itemBuilder: (context,
                                                        participantsNoFriendsIndex) {
                                                      final participantsNoFriendsItem =
                                                          participantsNoFriends[
                                                              participantsNoFriendsIndex];
                                                      return StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord.getDocument(
                                                            participantsNoFriendsItem
                                                                .userParticipatingEventRef!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 25.0,
                                                                height: 25.0,
                                                                child:
                                                                    SpinKitFadingCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  size: 25.0,
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final containerUsersRecord =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Visibility(
                                                              visible: !containerUsersRecord
                                                                  .blockedUsers
                                                                  .contains(
                                                                      currentUserReference),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'PAST_PARTICIPANTS_EVENTS_Row_mcpxaj7u_ON');
                                                                        if (participantsNoFriendsItem.userParticipatingEventRef !=
                                                                            currentUserReference) {
                                                                          logFirebaseEvent(
                                                                              'Row_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            UserProfileSearchedWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'userRef': serializeParam(
                                                                                participantsNoFriendsItem.userParticipatingEventRef,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                containerUsersRecord.photoUrl,
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                                                              ),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '${containerUsersRecord.nome} ${containerUsersRecord.cognome}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (containerUsersRecord.reference.id ==
                                                                              'ThwC2m1GP4gOovGjJOmvLLehTlR2')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
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
                                                                  ),
                                                                  if (containerUsersRecord
                                                                          .reference !=
                                                                      currentUserReference)
                                                                    StreamBuilder<
                                                                        List<
                                                                            FriendsRequestRecord>>(
                                                                      stream:
                                                                          queryFriendsRequestRecord(
                                                                        queryBuilder: (friendsRequestRecord) => friendsRequestRecord
                                                                            .where(
                                                                              'Requester',
                                                                              isEqualTo: containerUsersRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'Requestee',
                                                                              isEqualTo: currentUserReference,
                                                                            ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                            containerUserFriendsRequestRecordList =
                                                                            snapshot.data!;
                                                                        final containerUserFriendsRequestRecord = containerUserFriendsRequestRecordList.isNotEmpty
                                                                            ? containerUserFriendsRequestRecordList.first
                                                                            : null;

                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              StreamBuilder<List<FriendsRequestRecord>>(
                                                                            stream:
                                                                                queryFriendsRequestRecord(
                                                                              queryBuilder: (friendsRequestRecord) => friendsRequestRecord
                                                                                  .where(
                                                                                    'Requester',
                                                                                    isEqualTo: currentUserReference,
                                                                                  )
                                                                                  .where(
                                                                                    'Requestee',
                                                                                    isEqualTo: containerUsersRecord.reference,
                                                                                  ),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<FriendsRequestRecord> conditionalBuilderAuthFriendsRequestRecordList = snapshot.data!;
                                                                              final conditionalBuilderAuthFriendsRequestRecord = conditionalBuilderAuthFriendsRequestRecordList.isNotEmpty ? conditionalBuilderAuthFriendsRequestRecordList.first : null;

                                                                              return Builder(
                                                                                builder: (context) {
                                                                                  if (!(conditionalBuilderAuthFriendsRequestRecord != null) && !(containerUserFriendsRequestRecord != null)) {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('PAST_PARTICIPANTS_EVENTS_Container_hw0t4');
                                                                                        logFirebaseEvent('Container_backend_call');

                                                                                        await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                              status: 'pending',
                                                                                              dateSent: getCurrentTimestamp,
                                                                                              viewed: false,
                                                                                              requester: currentUserReference,
                                                                                              requestee: containerUsersRecord.reference,
                                                                                            ));
                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                        HapticFeedback.lightImpact();
                                                                                        logFirebaseEvent('Container_backend_call');

                                                                                        await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                              type: 'pastParticipants',
                                                                                            ));
                                                                                        if (containerUsersRecord.friendsRequestsNotifications) {
                                                                                          logFirebaseEvent('Container_trigger_push_notification');
                                                                                          triggerPushNotification(
                                                                                            notificationTitle: 'Richiesta di amicizia',
                                                                                            notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                            notificationImageUrl: currentUserPhoto,
                                                                                            notificationSound: 'default',
                                                                                            userRefs: [
                                                                                              containerUsersRecord.reference
                                                                                            ],
                                                                                            initialPageName: 'friendsRequests',
                                                                                            parameterData: {},
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 32.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                            child: Text(
                                                                                              'Richiedi amicizia',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  } else if (conditionalBuilderAuthFriendsRequestRecord != null) {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('PAST_PARTICIPANTS_EVENTS_Container_gg8l4');
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
                                                                                        ).then((value) => safeSetState(() {}));
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 32.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFF1E1E1E),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                            child: Text(
                                                                                              'Richiesta inviata',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  } else if (containerUserFriendsRequestRecord != null) {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('PAST_PARTICIPANTS_EVENTS_Container_q5ka5');
                                                                                        logFirebaseEvent('Container_custom_action');
                                                                                        await actions.addFriend(
                                                                                          containerUsersRecord.reference.id,
                                                                                          currentUserReference!.id,
                                                                                        );
                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                        HapticFeedback.lightImpact();
                                                                                        logFirebaseEvent('Container_backend_call');

                                                                                        await RequestAcceptedRecord.collection.doc().set(createRequestAcceptedRecordData(
                                                                                              date: getCurrentTimestamp,
                                                                                            ));
                                                                                        logFirebaseEvent('Container_trigger_push_notification');
                                                                                        triggerPushNotification(
                                                                                          notificationTitle: '${valueOrDefault(currentUserDocument?.nome, '')} ha accettato la tua richiesta di amicizia!',
                                                                                          notificationText: '',
                                                                                          notificationSound: 'default',
                                                                                          userRefs: [
                                                                                            containerUsersRecord.reference
                                                                                          ],
                                                                                          initialPageName: 'Profilo',
                                                                                          parameterData: {},
                                                                                        );
                                                                                        logFirebaseEvent('Container_backend_call');
                                                                                        await containerUserFriendsRequestRecord.reference.delete();
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 32.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                            child: Text(
                                                                                              'Accetta richiesta',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('PAST_PARTICIPANTS_EVENTS_Container_4emte');
                                                                                        logFirebaseEvent('Container_backend_call');

                                                                                        await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                              status: 'pending',
                                                                                              dateSent: getCurrentTimestamp,
                                                                                              viewed: false,
                                                                                              requester: currentUserReference,
                                                                                              requestee: containerUsersRecord.reference,
                                                                                            ));
                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                        HapticFeedback.lightImpact();
                                                                                        logFirebaseEvent('Container_backend_call');

                                                                                        await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                              type: 'pastParticipants',
                                                                                            ));
                                                                                        if (containerUsersRecord.friendsRequestsNotifications) {
                                                                                          logFirebaseEvent('Container_trigger_push_notification');
                                                                                          triggerPushNotification(
                                                                                            notificationTitle: 'Richiesta di amicizia',
                                                                                            notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                                            notificationImageUrl: currentUserPhoto,
                                                                                            notificationSound: 'default',
                                                                                            userRefs: [
                                                                                              containerUsersRecord.reference
                                                                                            ],
                                                                                            initialPageName: 'friendsRequests',
                                                                                            parameterData: {},
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 32.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                            child: Text(
                                                                                              'Richiedi amicizia',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
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
                                  ],
                                ),
                              ),
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
      ),
    );
  }
}
