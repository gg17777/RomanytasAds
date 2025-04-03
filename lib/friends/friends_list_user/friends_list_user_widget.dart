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
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'friends_list_user_model.dart';
export 'friends_list_user_model.dart';

class FriendsListUserWidget extends StatefulWidget {
  const FriendsListUserWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  static String routeName = 'friendsListUser';
  static String routePath = 'friendsListUser';

  @override
  State<FriendsListUserWidget> createState() => _FriendsListUserWidgetState();
}

class _FriendsListUserWidgetState extends State<FriendsListUserWidget>
    with TickerProviderStateMixin {
  late FriendsListUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendsListUserModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'friendsListUser'});
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
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRef!),
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

        final friendsListUserUsersRecord = snapshot.data!;

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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 60.0, 0.0, 5.0),
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
                                        'FRIENDS_LIST_USER_Icon_pd9a71ll_ON_TAP');
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 66.0, 0.0, 0.0),
                            child: Text(
                              'Amici',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
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
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final friends = functions
                                          .uidsToUserRefs(
                                              friendsListUserUsersRecord.friends
                                                  .toList())
                                          .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          30.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: friends.length,
                                        itemBuilder: (context, friendsIndex) {
                                          final friendsItem =
                                              friends[friendsIndex];
                                          return StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                functions.uidToUserRef(
                                                    friendsItem.id)),
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

                                              final containerIndividualUserUsersRecord =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 15.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
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
                                                                'FRIENDS_LIST_USER_Row_i1bfrx5e_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Row_navigate_to');

                                                            context.pushNamed(
                                                              UserProfileSearchedWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'userRef':
                                                                    serializeParam(
                                                                  containerIndividualUserUsersRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    containerIndividualUserUsersRecord
                                                                        .photoUrl,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${containerIndividualUserUsersRecord.nome} ${containerIndividualUserUsersRecord.cognome}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (containerIndividualUserUsersRecord
                                                                            .reference
                                                                            .id ==
                                                                        'ThwC2m1GP4gOovGjJOmvLLehTlR2')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/verified-badge-profile-icon-png.png',
                                                                            width:
                                                                                22.0,
                                                                            height:
                                                                                22.0,
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                      StreamBuilder<
                                                          List<
                                                              FriendsRequestRecord>>(
                                                        stream:
                                                            queryFriendsRequestRecord(
                                                          queryBuilder:
                                                              (friendsRequestRecord) =>
                                                                  friendsRequestRecord
                                                                      .where(
                                                                        'Requester',
                                                                        isEqualTo:
                                                                            containerIndividualUserUsersRecord.reference,
                                                                      )
                                                                      .where(
                                                                        'Requestee',
                                                                        isEqualTo:
                                                                            currentUserReference,
                                                                      ),
                                                          singleRecord: true,
                                                        ),
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
                                                          List<FriendsRequestRecord>
                                                              containerUserFriendsRequestRecordList =
                                                              snapshot.data!;
                                                          final containerUserFriendsRequestRecord =
                                                              containerUserFriendsRequestRecordList
                                                                      .isNotEmpty
                                                                  ? containerUserFriendsRequestRecordList
                                                                      .first
                                                                  : null;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Visibility(
                                                              visible:
                                                                  friendsItem !=
                                                                      currentUserReference,
                                                              child: StreamBuilder<
                                                                  List<
                                                                      FriendsRequestRecord>>(
                                                                stream:
                                                                    queryFriendsRequestRecord(
                                                                  queryBuilder: (friendsRequestRecord) =>
                                                                      friendsRequestRecord
                                                                          .where(
                                                                            'Requester',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'Requestee',
                                                                            isEqualTo:
                                                                                containerIndividualUserUsersRecord.reference,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<FriendsRequestRecord>
                                                                      conditionalBuilderFriendsRequestRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final conditionalBuilderFriendsRequestRecord = conditionalBuilderFriendsRequestRecordList
                                                                          .isNotEmpty
                                                                      ? conditionalBuilderFriendsRequestRecordList
                                                                          .first
                                                                      : null;

                                                                  return Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (!(conditionalBuilderFriendsRequestRecord !=
                                                                              null) &&
                                                                          !(currentUserDocument?.friends.toList() ?? []).contains(conditionalBuilderFriendsRequestRecord
                                                                              ?.reference
                                                                              .id) &&
                                                                          !(containerUserFriendsRequestRecord !=
                                                                              null)) {
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
                                                                            logFirebaseEvent('FRIENDS_LIST_USER_Container_qyj9k9qs_ON_');
                                                                            logFirebaseEvent('Container_backend_call');

                                                                            await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                  requester: currentUserReference,
                                                                                  requestee: containerIndividualUserUsersRecord.reference,
                                                                                  status: 'pending',
                                                                                  dateSent: getCurrentTimestamp,
                                                                                  viewed: false,
                                                                                ));
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_backend_call');

                                                                            await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                  type: 'userFriendsList',
                                                                                ));
                                                                            logFirebaseEvent('Container_update_page_state');

                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_trigger_push_notification');
                                                                            triggerPushNotification(
                                                                              notificationTitle: 'Richiesta di amicizia',
                                                                              notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                              notificationImageUrl: currentUserPhoto,
                                                                              notificationSound: 'default',
                                                                              userRefs: [
                                                                                containerIndividualUserUsersRecord.reference
                                                                              ],
                                                                              initialPageName: 'friendsRequests',
                                                                              parameterData: {},
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                child: Text(
                                                                                  'Richiedi amicizia',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      } else if ((currentUserDocument?.friends.toList() ??
                                                                              [])
                                                                          .contains(conditionalBuilderFriendsRequestRecord
                                                                              ?.reference
                                                                              .id)) {
                                                                        return Visibility(
                                                                          visible:
                                                                              valueOrDefault<bool>(
                                                                            conditionalBuilderFriendsRequestRecord !=
                                                                                null,
                                                                            false,
                                                                          ),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('FRIENDS_LIST_USER_PAGE_ButtonSA_ON_TAP');
                                                                              logFirebaseEvent('ButtonSA_bottom_sheet');
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
                                                                                      child: DeleteFriendWidget(
                                                                                        friendsUserRef: containerIndividualUserUsersRecord.reference,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            text:
                                                                                'Siete amici',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 32.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: Color(0xFF1E1E1E),
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            showLoadingIndicator:
                                                                                false,
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['buttonOnActionTriggerAnimation1']!,
                                                                          ),
                                                                        );
                                                                      } else if (conditionalBuilderFriendsRequestRecord !=
                                                                          null) {
                                                                        return Visibility(
                                                                          visible:
                                                                              conditionalBuilderFriendsRequestRecord != null,
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('FRIENDS_LIST_USER_PAGE_ButtonRI_ON_TAP');
                                                                              logFirebaseEvent('ButtonRI_bottom_sheet');
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
                                                                                        requestRef: conditionalBuilderFriendsRequestRecord.reference,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            text:
                                                                                'Richiesta inviata',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 32.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: Color(0xFF1E1E1E),
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            showLoadingIndicator:
                                                                                false,
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['buttonOnActionTriggerAnimation2']!,
                                                                          ),
                                                                        );
                                                                      } else if (containerUserFriendsRequestRecord !=
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
                                                                            logFirebaseEvent('FRIENDS_LIST_USER_Container_sjktw3lx_ON_');
                                                                            logFirebaseEvent('Container_custom_action');
                                                                            await actions.addFriend(
                                                                              currentUserReference!.id,
                                                                              containerIndividualUserUsersRecord.reference.id,
                                                                            );
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_backend_call');

                                                                            await RequestAcceptedRecord.collection.doc().set(createRequestAcceptedRecordData(
                                                                                  date: getCurrentTimestamp,
                                                                                ));
                                                                            logFirebaseEvent('Container_backend_call');
                                                                            await containerUserFriendsRequestRecord.reference.delete();
                                                                            logFirebaseEvent('Container_trigger_push_notification');
                                                                            triggerPushNotification(
                                                                              notificationTitle: '${valueOrDefault(currentUserDocument?.nome, '')} ha accettato la tua richiesta di amicizia!',
                                                                              notificationText: '',
                                                                              notificationSound: 'default',
                                                                              userRefs: [
                                                                                containerIndividualUserUsersRecord.reference
                                                                              ],
                                                                              initialPageName: 'Profilo',
                                                                              parameterData: {},
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                child: Text(
                                                                                  'Accetta richiesta',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontSize: 13.0,
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
                                                                            logFirebaseEvent('FRIENDS_LIST_USER_Container_gq66qz55_ON_');
                                                                            logFirebaseEvent('Container_backend_call');

                                                                            await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                  requester: currentUserReference,
                                                                                  requestee: containerIndividualUserUsersRecord.reference,
                                                                                  status: 'pending',
                                                                                  dateSent: getCurrentTimestamp,
                                                                                  viewed: false,
                                                                                ));
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_backend_call');

                                                                            await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                  type: 'userFriendsList',
                                                                                ));
                                                                            logFirebaseEvent('Container_update_page_state');

                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_trigger_push_notification');
                                                                            triggerPushNotification(
                                                                              notificationTitle: 'Richiesta di amicizia',
                                                                              notificationText: '${valueOrDefault(currentUserDocument?.nome, '')} ${valueOrDefault(currentUserDocument?.cognome, '')} ti ha inviato una richiesta di amicizia',
                                                                              notificationImageUrl: currentUserPhoto,
                                                                              notificationSound: 'default',
                                                                              userRefs: [
                                                                                containerIndividualUserUsersRecord.reference
                                                                              ],
                                                                              initialPageName: 'friendsRequests',
                                                                              parameterData: {},
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                child: Text(
                                                                                  'Richiedi amicizia',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontSize: 13.0,
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
                              ].addToEnd(SizedBox(height: 30.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
