import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_request_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'friends_suggestions_model.dart';
export 'friends_suggestions_model.dart';

class FriendsSuggestionsWidget extends StatefulWidget {
  const FriendsSuggestionsWidget({super.key});

  static String routeName = 'friendsSuggestions';
  static String routePath = 'friendsSuggestions';

  @override
  State<FriendsSuggestionsWidget> createState() =>
      _FriendsSuggestionsWidgetState();
}

class _FriendsSuggestionsWidgetState extends State<FriendsSuggestionsWidget>
    with TickerProviderStateMixin {
  late FriendsSuggestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendsSuggestionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'friendsSuggestions'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FRIENDS_SUGGESTIONS_friendsSuggestions_O');
      logFirebaseEvent('friendsSuggestions_custom_action');
      _model.gottenUsers = await actions.getFriendsSuggestions(
        currentUserUid,
      );
      logFirebaseEvent('friendsSuggestions_update_page_state');
      _model.suggestions = _model.gottenUsers!.toList().cast<UsersRecord>();
      safeSetState(() {});
    });

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
              logFirebaseEvent('FRIENDS_SUGGESTIONS_keyboard_arrow_left_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'SUGGERIMENTI',
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
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.bottomNavOutOutModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomNavOutOutWidget(),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Text(
                          'Persone che potresti conoscere',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Suggeriti per te',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final users = _model.suggestions.toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: users.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, usersIndex) {
                                final usersItem = users[usersIndex];
                                return Container(
                                  decoration: BoxDecoration(),
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
                                            usersItem.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/romanita-5nlemi/assets/9sat01xqduda/profilo_eaqfv.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        AutoSizeText(
                                                          usersItem.nome,
                                                          maxLines: 1,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        AutoSizeText(
                                                          usersItem.cognome,
                                                          maxLines: 1,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                  ],
                                                ),
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
                                                              isEqualTo:
                                                                  currentUserReference,
                                                            )
                                                            .where(
                                                              'Requestee',
                                                              isEqualTo:
                                                                  usersItem
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
                                                    conditionalBuilderFriendsRequestRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final conditionalBuilderFriendsRequestRecord =
                                                    conditionalBuilderFriendsRequestRecordList
                                                            .isNotEmpty
                                                        ? conditionalBuilderFriendsRequestRecordList
                                                            .first
                                                        : null;

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
                                                        'FRIENDS_SUGGESTIONS_ConditionalBuilder_9');
                                                    logFirebaseEvent(
                                                        'ConditionalBuilder_backend_call');

                                                    await FriendsRequestRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createFriendsRequestRecordData(
                                                          requester:
                                                              currentUserReference,
                                                          requestee: usersItem
                                                              .reference,
                                                          status: 'pending',
                                                          dateSent:
                                                              getCurrentTimestamp,
                                                          viewed: false,
                                                        ));
                                                    logFirebaseEvent(
                                                        'ConditionalBuilder_backend_call');

                                                    await RequestsSentRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createRequestsSentRecordData(
                                                          number: 1,
                                                        ));
                                                  },
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (!valueOrDefault<bool>(
                                                        conditionalBuilderFriendsRequestRecord !=
                                                            null,
                                                        true,
                                                      )) {
                                                        return Visibility(
                                                          visible:
                                                              !(conditionalBuilderFriendsRequestRecord !=
                                                                  null),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'FRIENDS_SUGGESTIONS_PAGE_Button1_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button1_widget_animation');
                                                              if (animationsMap[
                                                                      'buttonOnActionTriggerAnimation1'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'buttonOnActionTriggerAnimation1']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0);
                                                              }
                                                              logFirebaseEvent(
                                                                  'Button1_widget_animation');
                                                              if (animationsMap[
                                                                      'buttonOnActionTriggerAnimation1'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'buttonOnActionTriggerAnimation1']!
                                                                    .controller
                                                                    .reverse();
                                                              }
                                                              logFirebaseEvent(
                                                                  'Button1_backend_call');

                                                              await FriendsRequestRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      createFriendsRequestRecordData(
                                                                    requester:
                                                                        currentUserReference,
                                                                    requestee:
                                                                        usersItem
                                                                            .reference,
                                                                    status:
                                                                        'pending',
                                                                    dateSent:
                                                                        getCurrentTimestamp,
                                                                    viewed:
                                                                        false,
                                                                  ));
                                                            },
                                                            text:
                                                                'Invia richiesta',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 35.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                                        fontSize:
                                                                            9.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                                      } else {
                                                        return Visibility(
                                                          visible:
                                                              conditionalBuilderFriendsRequestRecord !=
                                                                  null,
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'FRIENDS_SUGGESTIONS_PAGE_Button2_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button2_widget_animation');
                                                              if (animationsMap[
                                                                      'buttonOnActionTriggerAnimation2'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'buttonOnActionTriggerAnimation2']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0);
                                                              }
                                                              logFirebaseEvent(
                                                                  'Button2_widget_animation');
                                                              if (animationsMap[
                                                                      'buttonOnActionTriggerAnimation2'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'buttonOnActionTriggerAnimation2']!
                                                                    .controller
                                                                    .reverse();
                                                              }
                                                              logFirebaseEvent(
                                                                  'Button2_bottom_sheet');
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
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          DeleteRequestWidget(
                                                                        requestRef:
                                                                            conditionalBuilderFriendsRequestRecord!.reference,
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
                                                              height: 30.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent3,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            9.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'buttonOnActionTriggerAnimation2']!,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.close,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'FRIENDS_SUGGESTIONS_close_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'didntLikeSuggestions':
                                                          FieldValue.arrayUnion(
                                                              [usersItem.uid]),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_update_page_state');
                                                _model
                                                    .removeAtIndexFromSuggestions(
                                                        usersIndex);
                                                safeSetState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
    );
  }
}
