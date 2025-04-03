import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'concerto_profile_model.dart';
export 'concerto_profile_model.dart';

class ConcertoProfileWidget extends StatefulWidget {
  const ConcertoProfileWidget({
    super.key,
    required this.concertoRef,
  });

  final DocumentReference? concertoRef;

  static String routeName = 'ConcertoProfile';
  static String routePath = 'concertoProfile';

  @override
  State<ConcertoProfileWidget> createState() => _ConcertoProfileWidgetState();
}

class _ConcertoProfileWidgetState extends State<ConcertoProfileWidget>
    with TickerProviderStateMixin {
  late ConcertoProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConcertoProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConcertoProfile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONCERTO_PROFILE_ConcertoProfile_ON_INIT');
      logFirebaseEvent('ConcertoProfile_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('ConcertoProfile_backend_call');
      _model.apiResulta4x = await IncrementViewsCall.call(
        collectionId: 'Concerti',
        docId: widget.concertoRef?.id,
      );

      logFirebaseEvent('ConcertoProfile_custom_action');
      _model.myFriendsParticipating = await actions.friendsParticipatingConcert(
        widget.concertoRef!,
      );
      logFirebaseEvent('ConcertoProfile_update_page_state');
      _model.myFriendsHereConcert =
          _model.myFriendsParticipating!.toList().cast<DocumentReference>();
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

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.5,
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

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConcertiRecord>(
      stream: ConcertiRecord.getDocument(widget.concertoRef!),
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

        final concertoProfileConcertiRecord = snapshot.data!;

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
                  Icons.chevron_left_sharp,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CONCERTO_PROFILE_chevron_left_sharp_ICN_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: AutoSizeText(
                                concertoProfileConcertiRecord.titolo,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Builder(
                      builder: (context) => Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONCERTO_PROFILE_Icon_nvg62p37_ON_TAP');
                            await Future.wait([
                              Future(() async {
                                logFirebaseEvent(
                                    'Icon_generate_current_page_link');
                                _model.currentPageLink =
                                    await generateCurrentPageLink(
                                  context,
                                  title: concertoProfileConcertiRecord.titolo,
                                  imageUrl:
                                      concertoProfileConcertiRecord.locandina,
                                  isShortLink: false,
                                );
                              }),
                              Future(() async {
                                logFirebaseEvent('Icon_share');
                                await Share.share(
                                  _model.currentPageLink,
                                  sharePositionOrigin:
                                      getWidgetBoundingBox(context),
                                );
                              }),
                            ]);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.shareSquare,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          concertoProfileConcertiRecord.locandina,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.5625,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  concertoProfileConcertiRecord.titolo,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: AutoSizeText(
                            concertoProfileConcertiRecord.hashtag,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CONCERTO_PROFILE_Text_eefesb04_ON_TAP');
                                logFirebaseEvent('Text_page_view');
                                await _model.pageViewController?.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Text(
                                'Info',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Horizon',
                                      color: _model.pageViewCurrentIndex == 0
                                          ? FlutterFlowTheme.of(context).primary
                                          : Color(0xFF303030),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CONCERTO_PROFILE_Text_h9uuuvdo_ON_TAP');
                                logFirebaseEvent('Text_page_view');
                                await _model.pageViewController?.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Text(
                                'Prezzi',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Horizon',
                                      color: _model.pageViewCurrentIndex == 1
                                          ? FlutterFlowTheme.of(context).primary
                                          : Color(0xFF303030),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              onPageChanged: (_) async {
                                logFirebaseEvent(
                                    'CONCERTO_PROFILE_PageView_upekx0xb_ON_WI');
                                logFirebaseEvent('PageView_update_page_state');
                                _model.pagina = !_model.pagina;
                                safeSetState(() {});
                              },
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .access_time_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            11.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  concertoProfileConcertiRecord
                                                                      .orario,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
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
                                                                  concertoProfileConcertiRecord
                                                                      .localita,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .music_note_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  concertoProfileConcertiRecord
                                                                      .categoriaMusica,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 20.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                          "d",
                                                          concertoProfileConcertiRecord
                                                              .data!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          "MMM",
                                                          concertoProfileConcertiRecord
                                                              .data!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 15.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CONCERTO_PROFILE_Row_apmwic0o_ON_TAP');
                                                  await Future.wait([
                                                    Future(() async {
                                                      logFirebaseEvent(
                                                          'Row_update_page_state');
                                                      _model.descrizione =
                                                          !_model.descrizione;
                                                      safeSetState(() {});
                                                    }),
                                                    Future(() async {
                                                      if (_model.descrizione) {
                                                        logFirebaseEvent(
                                                            'Row_widget_animation');
                                                        if (animationsMap[
                                                                'iconOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'iconOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Row_widget_animation');
                                                        if (animationsMap[
                                                                'iconOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'iconOnActionTriggerAnimation']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                      }
                                                    }),
                                                  ]);
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        'Descrizione',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 17.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'iconOnActionTriggerAnimation']!,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Stack(
                                                children: [
                                                  if (!_model.descrizione)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
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
                                                              'CONCERTO_PROFILE_Text_m8lpmdro_ON_TAP');
                                                          await Future.wait([
                                                            Future(() async {
                                                              logFirebaseEvent(
                                                                  'Text_update_page_state');
                                                              _model.descrizione =
                                                                  !_model
                                                                      .descrizione;
                                                              safeSetState(
                                                                  () {});
                                                            }),
                                                            Future(() async {
                                                              if (_model
                                                                  .descrizione) {
                                                                logFirebaseEvent(
                                                                    'Text_widget_animation');
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'iconOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Text_widget_animation');
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'iconOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .reverse();
                                                                }
                                                              }
                                                            }),
                                                          ]);
                                                        },
                                                        child: Text(
                                                          concertoProfileConcertiRecord
                                                              .descrizione
                                                              .maybeHandleOverflow(
                                                            maxChars: 400,
                                                            replacement: '…',
                                                          ),
                                                          maxLines: 6,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model.descrizione)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
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
                                                              'CONCERTO_PROFILE_PAGE_Text2_ON_TAP');
                                                          await Future.wait([
                                                            Future(() async {
                                                              logFirebaseEvent(
                                                                  'Text2_update_page_state');
                                                              _model.descrizione =
                                                                  !_model
                                                                      .descrizione;
                                                              safeSetState(
                                                                  () {});
                                                            }),
                                                            Future(() async {
                                                              if (_model
                                                                  .descrizione) {
                                                                logFirebaseEvent(
                                                                    'Text2_widget_animation');
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'iconOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Text2_widget_animation');
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'iconOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .reverse();
                                                                }
                                                              }
                                                            }),
                                                          ]);
                                                        },
                                                        child: Text(
                                                          concertoProfileConcertiRecord
                                                              .descrizione,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              concertoProfileConcertiRecord
                                                                  .imgLocale,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                concertoProfileConcertiRecord
                                                                    .locale,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              concertoProfileConcertiRecord
                                                                  .addressText
                                                                  .maybeHandleOverflow(
                                                                maxChars: 30,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
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
                                                          'CONCERTO_PROFILE_Text_9w1jillp_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_launch_u_r_l');
                                                      await launchURL(
                                                          concertoProfileConcertiRecord
                                                              .urlMaps);
                                                    },
                                                    child: Text(
                                                      'Portami li',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      30.0, 20.0, 30.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CONCERTO_PROFILE_StaticMap_vta7hn0j_ON_T');
                                                  logFirebaseEvent(
                                                      'StaticMap_launch_u_r_l');
                                                  await launchURL(
                                                      concertoProfileConcertiRecord
                                                          .urlMaps);
                                                },
                                                child: FlutterFlowStaticMap(
                                                  location:
                                                      concertoProfileConcertiRecord
                                                          .indirizzo!,
                                                  apiKey:
                                                      'pk.eyJ1Ijoicm9tYW55dGFzIiwiYSI6ImNsdXd3YTYzYTBnZXMyaWxrcHllaGxybHoifQ.CM6omCc5VSoYbe94Y596NQ',
                                                  style: mapbox
                                                      .MapBoxStyle.Outdoors,
                                                  width: double.infinity,
                                                  height: 140.0,
                                                  fit: BoxFit.cover,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  markerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  zoom: 12,
                                                  tilt: 0,
                                                  rotation: 0,
                                                ),
                                              ),
                                            ),
                                          ].addToEnd(SizedBox(height: 70.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Biglietti',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    concertoProfileConcertiRecord
                                                        .ingresso1,
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Vedi biglietti ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '€',
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
                                                  Text(
                                                    concertoProfileConcertiRecord
                                                        .ingresso1Prezzo,
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    concertoProfileConcertiRecord
                                                        .ingresso2,
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (concertoProfileConcertiRecord
                                                                  .ingresso2 !=
                                                              '')
                                                        Text(
                                                          'Vedi biglietti ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (concertoProfileConcertiRecord
                                                              .ingresso2Prezzo !=
                                                          '')
                                                    Text(
                                                      '€',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  Text(
                                                    concertoProfileConcertiRecord
                                                        .ingresso2Prezzo,
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    concertoProfileConcertiRecord
                                                        .ingresso3,
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (concertoProfileConcertiRecord
                                                                  .ingresso3Prezzo !=
                                                              '')
                                                        Text(
                                                          'Vedi biglietti ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (concertoProfileConcertiRecord
                                                              .ingresso3Prezzo !=
                                                          '')
                                                    Text(
                                                      '€',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  Text(
                                                    concertoProfileConcertiRecord
                                                        .ingresso3Prezzo,
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].addToEnd(SizedBox(height: 20.0)),
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
                  if (!(isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible))
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: valueOrDefault<double>(
                          isiOS ? 100.0 : 70.0,
                          100.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CONCERTO_PROFILE_Container_6bcr3p8i_ON_T');
                                  logFirebaseEvent('Container_launch_u_r_l');
                                  await launchURL(concertoProfileConcertiRecord
                                      .urlBiglietti);
                                },
                                child: Container(
                                  width: 120.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Vedi biglietti',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
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
        );
      },
    );
  }
}
