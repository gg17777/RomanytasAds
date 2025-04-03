import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/delete_friend_widget.dart';
import '/components/delete_request_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/outout/download_photo/download_photo_widget.dart';
import '/outout/not_me_in_photo/not_me_in_photo_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'photo_model.dart';
export 'photo_model.dart';

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({
    super.key,
    required this.photoRef,
    required this.eventRef,
    required this.numUsersInPhoto,
  });

  final DocumentReference? photoRef;
  final DocumentReference? eventRef;
  final int? numUsersInPhoto;

  static String routeName = 'photo';
  static String routePath = 'photo';

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget>
    with TickerProviderStateMixin {
  late PhotoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'photo'});
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
    return StreamBuilder<PhotosEventRecord>(
      stream: PhotosEventRecord.getDocument(widget.photoRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
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

        final photoPhotosEventRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            body: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PHOTO_PAGE_Stack_pg0raj8f_ON_TAP');
                  await Future.wait([
                    Future(() async {
                      logFirebaseEvent('Stack_update_page_state');
                      _model.top = !_model.top;
                      safeSetState(() {});
                    }),
                    Future(() async {
                      logFirebaseEvent('Stack_update_page_state');
                      _model.bot = !_model.bot;
                      safeSetState(() {});
                    }),
                  ]);
                },
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PHOTO_PAGE_Image_54u8lqrt_ON_TAP');
                          await Future.wait([
                            Future(() async {
                              logFirebaseEvent('Image_update_page_state');
                              _model.top = !_model.top;
                              safeSetState(() {});
                            }),
                            Future(() async {
                              logFirebaseEvent('Image_update_page_state');
                              _model.bot = !_model.bot;
                              safeSetState(() {});
                            }),
                          ]);
                        },
                        onDoubleTap: () async {
                          logFirebaseEvent(
                              'PHOTO_PAGE_Image_54u8lqrt_ON_DOUBLE_TAP');
                          logFirebaseEvent('Image_expand_image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  photoPhotosEventRecord.image,
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: photoPhotosEventRecord.image,
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: photoPhotosEventRecord.image,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.network(
                              photoPhotosEventRecord.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_model.top)
                      Container(
                        width: double.infinity,
                        height: 105.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 60.0, 20.0, 10.0),
                              child: Row(
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
                                          'PHOTO_PAGE_Icon_5f2dd91y_ON_TAP');
                                      logFirebaseEvent('Icon_navigate_back');
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.chevron_left_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 30.0,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PHOTO_PAGE_Icon_25q7vhi6_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon_update_page_state');
                                          _model.bot = false;
                                          safeSetState(() {});
                                          logFirebaseEvent('Icon_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: DownloadPhotoWidget(
                                                    photoRef: widget.photoRef!,
                                                    photoUrl:
                                                        photoPhotosEventRecord
                                                            .image,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Icon(
                                          Icons.file_download_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
                                      ),
                                    ],
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
                                  'Foto',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (_model.top)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.sizeOf(context).height * 0.4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 30.0,
                                  child: Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 15.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final users = photoPhotosEventRecord
                                            .usersInPhotos
                                            .toList();

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                users.length, (usersIndex) {
                                              final usersItem =
                                                  users[usersIndex];
                                              return StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    usersItem),
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

                                                  final containerUsersRecord =
                                                      snapshot.data!;

                                                  return Container(
                                                    decoration: BoxDecoration(),
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
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'PHOTO_PAGE_Row_rj7327i6_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

                                                              context.pushNamed(
                                                                UserProfileSearchedWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'userRef':
                                                                      serializeParam(
                                                                    containerUsersRecord
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
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    containerUsersRecord
                                                                        .photoUrl,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      usersItem ==
                                                                              currentUserReference
                                                                          ? 'Tu'
                                                                          : '${containerUsersRecord.nome} ${containerUsersRecord.cognome}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
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
                                                                              containerUsersRecord.reference,
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
                                                                containerFriendsRequestRecordList =
                                                                snapshot.data!;
                                                            final containerFriendsRequestRecord =
                                                                containerFriendsRequestRecordList
                                                                        .isNotEmpty
                                                                    ? containerFriendsRequestRecordList
                                                                        .first
                                                                    : null;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Visibility(
                                                                visible:
                                                                    usersItem !=
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
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'Requestee',
                                                                              isEqualTo: containerUsersRecord.reference,
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
                                                                        conditionalBuilderAuthFriendsRequestRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final conditionalBuilderAuthFriendsRequestRecord = conditionalBuilderAuthFriendsRequestRecordList
                                                                            .isNotEmpty
                                                                        ? conditionalBuilderAuthFriendsRequestRecordList
                                                                            .first
                                                                        : null;

                                                                    return Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (!(conditionalBuilderAuthFriendsRequestRecord !=
                                                                                null) &&
                                                                            !(currentUserDocument?.friends.toList() ?? []).contains(containerUsersRecord
                                                                                .reference.id) &&
                                                                            !(containerFriendsRequestRecord !=
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
                                                                              logFirebaseEvent('PHOTO_PAGE_Container_r09wnyxt_ON_TAP');
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                    requester: currentUserReference,
                                                                                    requestee: containerUsersRecord.reference,
                                                                                    status: 'pending',
                                                                                    dateSent: getCurrentTimestamp,
                                                                                    viewed: false,
                                                                                  ));
                                                                              logFirebaseEvent('Container_haptic_feedback');
                                                                              HapticFeedback.lightImpact();
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                    type: 'photo',
                                                                                  ));
                                                                              logFirebaseEvent('Container_update_page_state');

                                                                              safeSetState(() {});
                                                                              if (containerUsersRecord.friendsRequestsNotifications == true) {
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
                                                                            child:
                                                                                Container(
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Align(
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
                                                                        } else if ((currentUserDocument?.friends.toList() ?? []).contains(containerUsersRecord
                                                                            .reference
                                                                            .id)) {
                                                                          return FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('PHOTO_PAGE_ButtonSA_ON_TAP');
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
                                                                                        friendsUserRef: containerUsersRecord.reference,
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
                                                                          );
                                                                        } else if (conditionalBuilderAuthFriendsRequestRecord !=
                                                                            null) {
                                                                          return FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('PHOTO_PAGE_ButtonRI_ON_TAP');
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
                                                                                        requestRef: conditionalBuilderAuthFriendsRequestRecord.reference,
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
                                                                          );
                                                                        } else if (containerFriendsRequestRecord !=
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
                                                                              logFirebaseEvent('PHOTO_PAGE_Container_42gedss2_ON_TAP');
                                                                              logFirebaseEvent('Container_custom_action');
                                                                              await actions.addFriend(
                                                                                currentUserReference!.id,
                                                                                containerUsersRecord.reference.id,
                                                                              );
                                                                              logFirebaseEvent('Container_haptic_feedback');
                                                                              HapticFeedback.lightImpact();
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await RequestAcceptedRecord.collection.doc().set(createRequestAcceptedRecordData(
                                                                                    date: getCurrentTimestamp,
                                                                                  ));
                                                                              logFirebaseEvent('Container_backend_call');
                                                                              await containerFriendsRequestRecord.reference.delete();
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
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Align(
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
                                                                              logFirebaseEvent('PHOTO_PAGE_Container_shgy8vdn_ON_TAP');
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await FriendsRequestRecord.collection.doc().set(createFriendsRequestRecordData(
                                                                                    requester: currentUserReference,
                                                                                    requestee: containerUsersRecord.reference,
                                                                                    status: 'pending',
                                                                                    dateSent: getCurrentTimestamp,
                                                                                    viewed: false,
                                                                                  ));
                                                                              logFirebaseEvent('Container_haptic_feedback');
                                                                              HapticFeedback.lightImpact();
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await RequestsSentRecord.collection.doc().set(createRequestsSentRecordData(
                                                                                    type: 'photo',
                                                                                  ));
                                                                              if (containerUsersRecord.friendsRequestsNotifications == true) {
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
                                                                            child:
                                                                                Container(
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Align(
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
                                                  );
                                                },
                                              );
                                            }).divide(SizedBox(height: 10.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 50.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PHOTO_PAGE_Row_rgri5ie6_ON_TAP');
                                      logFirebaseEvent('Row_update_page_state');
                                      _model.bot = false;
                                      safeSetState(() {});
                                      logFirebaseEvent('Row_bottom_sheet');
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
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: NotMeInPhotoWidget(
                                                photoRef: widget.photoRef!,
                                                eventRef: widget.eventRef!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            'Non sono presente nella foto',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF94040D),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.block_rounded,
                                          color: Color(0xFF94040D),
                                          size: 24.0,
                                        ),
                                      ],
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
            ),
          ),
        );
      },
    );
  }
}
