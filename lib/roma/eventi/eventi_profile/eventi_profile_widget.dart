import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/no_photo_swipe_widget.dart';
import '/components/sei_in_lista_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outout/info_feature_log_out/info_feature_log_out_widget.dart';
import '/outout/participate_event_widget/participate_event_widget_widget.dart';
import '/roma/eventi/delete_event_participating/delete_event_participating_widget.dart';
import '/roma/eventi/tables/tables_widget.dart';
import '/roma/swipe_not_participating_event/swipe_not_participating_event_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'eventi_profile_model.dart';
export 'eventi_profile_model.dart';

class EventiProfileWidget extends StatefulWidget {
  const EventiProfileWidget({
    super.key,
    required this.eventoRef,
    required this.goBack,
  });

  final DocumentReference? eventoRef;
  final String? goBack;

  static String routeName = 'EventiProfile';
  static String routePath = 'eventiProfile';

  @override
  State<EventiProfileWidget> createState() => _EventiProfileWidgetState();
}

class _EventiProfileWidgetState extends State<EventiProfileWidget>
    with TickerProviderStateMixin {
  late EventiProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventiProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EventiProfile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EVENTI_PROFILE_EventiProfile_ON_INIT_STA');
      logFirebaseEvent('EventiProfile_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('EventiProfile_backend_call');
      _model.apiResultjtr = await IncrementViewsCall.call(
        collectionId: 'Eventi',
        docId: widget.eventoRef?.id,
      );

      logFirebaseEvent('EventiProfile_custom_action');
      _model.myFriendsParticipating = await actions.friendsParticipating(
        widget.eventoRef!,
      );
      logFirebaseEvent('EventiProfile_update_page_state');
      _model.myFriendsHere =
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
    context.watch<FFAppState>();

    return FutureBuilder<EventiRecord>(
      future: EventiRecord.getDocumentOnce(widget.eventoRef!),
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

        final eventiProfileEventiRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('EVENTI_PROFILE_chevron_left_ICN_ON_TAP');
                    if ((widget.goBack == 'participating') ||
                        (widget.goBack == 'swipe') ||
                        (widget.goBack == 'filters') ||
                        (widget.goBack == 'tutorial')) {
                      logFirebaseEvent('IconButton_update_app_state');
                      FFAppState().page = 'events';
                      safeSetState(() {});
                      logFirebaseEvent('IconButton_update_app_state');
                      FFAppState().eventiState = 'eventi';
                      safeSetState(() {});
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(
                        EventiHomeWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    } else if ((widget.goBack == 'events') ||
                        (widget.goBack == 'map')) {
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                      logFirebaseEvent('IconButton_update_app_state');
                      FFAppState().eventiState = 'eventi';
                      safeSetState(() {});
                    } else if (widget.goBack == 'manager') {
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(
                        ManagerProfileWidget.routeName,
                        queryParameters: {
                          'managerRef': serializeParam(
                            eventiProfileEventiRecord.eventoManagerRef,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                      logFirebaseEvent('IconButton_update_app_state');
                      FFAppState().page = 'friends';
                      safeSetState(() {});
                    }
                  },
                ),
                title: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              eventiProfileEventiRecord.titolo,
                              maxLines: 1,
                              minFontSize: 10.0,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'EVENTI_PROFILE_PAGE_Icon_u4w0mvsc_ON_TAP');
                              logFirebaseEvent(
                                  'Icon_generate_current_page_link');
                              _model.currentPageLink =
                                  await generateCurrentPageLink(
                                context,
                                title: eventiProfileEventiRecord.titolo,
                                imageUrl: eventiProfileEventiRecord.locandina,
                                isShortLink: false,
                              );

                              logFirebaseEvent('Icon_share');
                              await Share.share(
                                _model.currentPageLink,
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                              logFirebaseEvent('Icon_backend_call');

                              await widget.eventoRef!.update({
                                ...mapToFirestore(
                                  {
                                    'shared': FieldValue.increment(1),
                                  },
                                ),
                              });
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
              body: StreamBuilder<List<ListaEventiRecord>>(
                stream: queryListaEventiRecord(
                  parent: eventiProfileEventiRecord.reference,
                  queryBuilder: (listaEventiRecord) => listaEventiRecord.where(
                    'createdBy',
                    isEqualTo: currentUserReference?.id,
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
                  List<ListaEventiRecord> containerListaEventiRecordList =
                      snapshot.data!;
                  final containerListaEventiRecord =
                      containerListaEventiRecordList.isNotEmpty
                          ? containerListaEventiRecordList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<EventiParticiaptingRecord>>(
                      stream: queryEventiParticiaptingRecord(
                        parent: eventiProfileEventiRecord.reference,
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
                            containerAllEventiParticiaptingRecordList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            eventiProfileEventiRecord
                                                    .eventoAnnullato
                                                ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/content-manager-asgt0n/assets/6pfhelsiy902/Untitled_design_(34).png'
                                                : eventiProfileEventiRecord
                                                    .locandina,
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5625,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 5.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: AutoSizeText(
                                              eventiProfileEventiRecord.titolo,
                                              maxLines: 1,
                                              minFontSize: 18.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (eventiProfileEventiRecord.eventType ==
                                        'event')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            eventiProfileEventiRecord.hashtags,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    if (eventiProfileEventiRecord.eventType ==
                                        'disco')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            functions.textListToText(
                                                eventiProfileEventiRecord
                                                    .musicType
                                                    .toList()),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EVENTI_PROFILE_PAGE_Text_d12bir8o_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_page_view');
                                              await _model.pageViewController
                                                  ?.animateToPage(
                                                0,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Text(
                                              'Info',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Horizon',
                                                    color:
                                                        _model.pageViewCurrentIndex ==
                                                                0
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
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
                                                  'EVENTI_PROFILE_PAGE_Text_gcbp4ny6_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_page_view');
                                              await _model.pageViewController
                                                  ?.animateToPage(
                                                1,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Text(
                                              'Prezzi',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Horizon',
                                                    color:
                                                        _model.pageViewCurrentIndex ==
                                                                1
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
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
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 40.0),
                                              child: PageView(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: 0),
                                                onPageChanged: (_) async {
                                                  logFirebaseEvent(
                                                      'EVENTI_PROFILE_PageView_w51wd3xk_ON_WIDG');
                                                  logFirebaseEvent(
                                                      'PageView_update_page_state');
                                                  _model.pagina =
                                                      !_model.pagina;
                                                  safeSetState(() {});
                                                },
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.access_time_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 20.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(11.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Dalle ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              dateTimeFormat(
                                                                                "Hm",
                                                                                eventiProfileEventiRecord.inizioOrario!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              ' alle ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              dateTimeFormat(
                                                                                "Hm",
                                                                                eventiProfileEventiRecord.fineOrario!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (eventiProfileEventiRecord.eventType ==
                                                                            'event')
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_on,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 20.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  eventiProfileEventiRecord.localita,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        if (eventiProfileEventiRecord.eventType ==
                                                                            'event')
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.hashtag,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  eventiProfileEventiRecord.categoriaEvento,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        if (eventiProfileEventiRecord.eventType ==
                                                                            'disco')
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.how_to_reg_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 22.0,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  eventiProfileEventiRecord.dresscode,
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        if (eventiProfileEventiRecord.eventType ==
                                                                            'disco')
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.idCard,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 20.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  eventiProfileEventiRecord.age,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '+',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ].divide(SizedBox(
                                                                              height: 20.0)),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Flexible(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            dateTimeFormat(
                                                                              "d",
                                                                              eventiProfileEventiRecord.data!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dateTimeFormat(
                                                                              "MMM",
                                                                              eventiProfileEventiRecord.data!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if (eventiProfileEventiRecord
                                                                              .video &&
                                                                          (eventiProfileEventiRecord.videoPath != ''))
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
                                                                            logFirebaseEvent('EVENTI_PROFILE_Container_7krq863w_ON_TAP');
                                                                            logFirebaseEvent('Container_navigate_to');

                                                                            context.pushNamed(
                                                                              VideoEventWidget.routeName,
                                                                              queryParameters: {
                                                                                'eventRef': serializeParam(
                                                                                  widget.eventoRef,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            logFirebaseEvent('Container_backend_call');

                                                                            await CountVideoClickedRecord.collection.doc().set(createCountVideoClickedRecordData(
                                                                                  date: eventiProfileEventiRecord.data,
                                                                                  titolo: eventiProfileEventiRecord.titolo,
                                                                                ));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                74.0,
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                'Video',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            20.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      15.0,
                                                                      20.0,
                                                                      0.0),
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
                                                                  'EVENTI_PROFILE_PAGE_Row_c2pfhuuh_ON_TAP');
                                                              await Future
                                                                  .wait([
                                                                Future(
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'Row_update_page_state');
                                                                  _model.descrizione =
                                                                      !_model
                                                                          .descrizione;
                                                                  safeSetState(
                                                                      () {});
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  if (_model
                                                                      .descrizione) {
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
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Descrizione',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              17.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_outlined,
                                                                  color: FlutterFlowTheme.of(
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
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Stack(
                                                            children: [
                                                              if (!_model
                                                                  .descrizione)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
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
                                                                          'EVENTI_PROFILE_PAGE_Text_5r5b4f6o_ON_TAP');
                                                                      await Future
                                                                          .wait([
                                                                        Future(
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'Text_update_page_state');
                                                                          _model.descrizione =
                                                                              !_model.descrizione;
                                                                          safeSetState(
                                                                              () {});
                                                                        }),
                                                                        Future(
                                                                            () async {
                                                                          if (_model
                                                                              .descrizione) {
                                                                            logFirebaseEvent('Text_widget_animation');
                                                                            if (animationsMap['iconOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              await animationsMap['iconOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                            }
                                                                          } else {
                                                                            logFirebaseEvent('Text_widget_animation');
                                                                            if (animationsMap['iconOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              await animationsMap['iconOnActionTriggerAnimation']!.controller.reverse();
                                                                            }
                                                                          }
                                                                        }),
                                                                      ]);
                                                                    },
                                                                    child: Text(
                                                                      eventiProfileEventiRecord
                                                                          .descrizione
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            400,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      maxLines:
                                                                          6,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
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
                                                              if (_model
                                                                  .descrizione)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
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
                                                                          'EVENTI_PROFILE_PAGE_Text2_ON_TAP');
                                                                      await Future
                                                                          .wait([
                                                                        Future(
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'Text2_update_page_state');
                                                                          _model.descrizione =
                                                                              !_model.descrizione;
                                                                          safeSetState(
                                                                              () {});
                                                                        }),
                                                                        Future(
                                                                            () async {
                                                                          if (_model
                                                                              .descrizione) {
                                                                            logFirebaseEvent('Text2_widget_animation');
                                                                            if (animationsMap['iconOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              await animationsMap['iconOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                            }
                                                                          } else {
                                                                            logFirebaseEvent('Text2_widget_animation');
                                                                            if (animationsMap['iconOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              await animationsMap['iconOnActionTriggerAnimation']!.controller.reverse();
                                                                            }
                                                                          }
                                                                        }),
                                                                      ]);
                                                                    },
                                                                    child: Text(
                                                                      eventiProfileEventiRecord
                                                                          .descrizione,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
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
                                                        if ((eventiProfileEventiRecord
                                                                    .organizzatore ==
                                                                null) ||
                                                            !eventiProfileEventiRecord
                                                                .organizzatore)
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          15.0,
                                                                          20.0,
                                                                          0.0),
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
                                                                            'EVENTI_PROFILE_PAGE_Row_8b8ek1dx_ON_TAP');
                                                                        if (eventiProfileEventiRecord.profileVisible ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Row_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            ManagerProfileWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'managerRef': serializeParam(
                                                                                eventiProfileEventiRecord.eventoManagerRef,
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
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  eventiProfileEventiRecord.imgLocale,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: AutoSizeText(
                                                                                            eventiProfileEventiRecord.locale,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Text(
                                                                                    eventiProfileEventiRecord.addressText.maybeHandleOverflow(
                                                                                      maxChars: 30,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
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
                                                                          'EVENTI_PROFILE_PAGE_Text_tc49w2vt_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Text_launch_u_r_l');
                                                                      await launchURL(
                                                                          eventiProfileEventiRecord
                                                                              .urlMaps);
                                                                    },
                                                                    child: Text(
                                                                      'Portami li',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        if (eventiProfileEventiRecord
                                                            .organizzatore)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        15.0,
                                                                        20.0,
                                                                        0.0),
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
                                                                          'EVENTI_PROFILE_PAGE_Row_jws7luz5_ON_TAP');
                                                                      if (eventiProfileEventiRecord
                                                                              .profileVisible ==
                                                                          true) {
                                                                        logFirebaseEvent(
                                                                            'Row_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          ManagerProfileWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'managerRef':
                                                                                serializeParam(
                                                                              eventiProfileEventiRecord.eventoManagerRef,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      }
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            eventiProfileEventiRecord.organizzatoreImg,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
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
                                                                              eventiProfileEventiRecord.organizzatoreName,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Organizzatore',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      15.0,
                                                                      20.0,
                                                                      0.0),
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
                                                                  'EVENTI_PROFILE_StaticMap_zabz77hp_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'StaticMap_launch_u_r_l');
                                                              await launchURL(
                                                                  eventiProfileEventiRecord
                                                                      .urlMaps);
                                                            },
                                                            child:
                                                                FlutterFlowStaticMap(
                                                              location:
                                                                  eventiProfileEventiRecord
                                                                      .indirizzo!,
                                                              apiKey:
                                                                  'pk.eyJ1Ijoicm9tYW55dGFzIiwiYSI6ImNsdXd3YTYzYTBnZXMyaWxrcHllaGxybHoifQ.CM6omCc5VSoYbe94Y596NQ',
                                                              style: mapbox
                                                                  .MapBoxStyle
                                                                  .Outdoors,
                                                              width: double
                                                                  .infinity,
                                                              height: 140.0,
                                                              fit: BoxFit.cover,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
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
                                                        if (eventiProfileEventiRecord
                                                            .organizzatore)
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          15.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                eventiProfileEventiRecord.imgLocale,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: AutoSizeText(
                                                                                      eventiProfileEventiRecord.locale,
                                                                                      maxLines: 1,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                eventiProfileEventiRecord.addressText.maybeHandleOverflow(
                                                                                  maxChars: 30,
                                                                                  replacement: '…',
                                                                                ),
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
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
                                                                          'EVENTI_PROFILE_PAGE_Text_2obukrza_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Text_launch_u_r_l');
                                                                      await launchURL(
                                                                          eventiProfileEventiRecord
                                                                              .urlMaps);
                                                                    },
                                                                    child: Text(
                                                                      'Portami li',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                      ].addToEnd(SizedBox(
                                                          height: 70.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Ingresso',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (eventiProfileEventiRecord
                                                                    .lista)
                                                                  Text(
                                                                    '(prezzi validi solo in lista)',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (!eventiProfileEventiRecord
                                                              .gratis)
                                                            Flexible(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            30.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  eventiProfileEventiRecord.ingresso1nome,
                                                                                  'Ingresso',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Text(
                                                                                      eventiProfileEventiRecord.ingresso1Info,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  if (eventiProfileEventiRecord.ingresso1drink)
                                                                                    Text(
                                                                                      ' - Con drink',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            if (eventiProfileEventiRecord.ingresso1Costo != '')
                                                                              Text(
                                                                                '€',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            Stack(
                                                                              children: [
                                                                                Text(
                                                                                  eventiProfileEventiRecord.ingresso1Costo,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                if (eventiProfileEventiRecord.ingresso1Costo == '')
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Text(
                                                                                      'FREE',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (eventiProfileEventiRecord
                                                                              .ingresso2nome !=
                                                                          '')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  eventiProfileEventiRecord.ingresso2nome,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        eventiProfileEventiRecord.ingresso2Info,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    if (eventiProfileEventiRecord.ingresso2drink)
                                                                                      Text(
                                                                                        ' - Con drink',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (eventiProfileEventiRecord.ingresso2Costo != '')
                                                                                Text(
                                                                                  '€',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              Stack(
                                                                                children: [
                                                                                  Text(
                                                                                    eventiProfileEventiRecord.ingresso2Costo,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  if ((eventiProfileEventiRecord.ingresso2nome != '') && (eventiProfileEventiRecord.ingresso2Costo == ''))
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Text(
                                                                                        'FREE',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (eventiProfileEventiRecord
                                                                              .ingresso3Nome !=
                                                                          '')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  eventiProfileEventiRecord.ingresso3Nome,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        eventiProfileEventiRecord.ingresso3Info,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    if (eventiProfileEventiRecord.ingresso3drink)
                                                                                      Text(
                                                                                        ' - Con drink',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (eventiProfileEventiRecord.ingresso3Nome != '')
                                                                                Text(
                                                                                  '€',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              Stack(
                                                                                children: [
                                                                                  Text(
                                                                                    eventiProfileEventiRecord.ingresso3Costo,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  if ((eventiProfileEventiRecord.ingresso3Nome != '') && (eventiProfileEventiRecord.ingresso3Costo == ''))
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Text(
                                                                                        'FREE',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (eventiProfileEventiRecord
                                                              .gratis)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Ingresso',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            eventiProfileEventiRecord.ingressoGratisDescrizione,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'FREE',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      eventiProfileEventiRecord.ingresso3Nome != ''
                                                                          ? 30.0
                                                                          : 50.0,
                                                                      30.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                if (eventiProfileEventiRecord
                                                                    .lista)
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (!(containerListaEventiRecord !=
                                                                          null)) {
                                                                        return Visibility(
                                                                          visible:
                                                                              eventiProfileEventiRecord.lista,
                                                                          child:
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
                                                                              logFirebaseEvent('EVENTI_PROFILE_Container_xe08flr5_ON_TAP');
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await ListaEventiRecord.createDoc(eventiProfileEventiRecord.reference).set(createListaEventiRecordData(
                                                                                nome: valueOrDefault(currentUserDocument?.nome, ''),
                                                                                cognome: valueOrDefault(currentUserDocument?.cognome, ''),
                                                                                entrato: false,
                                                                                createdBy: currentUserReference?.id,
                                                                                appName: 'Romanytas',
                                                                                userRef: currentUserReference,
                                                                                eventDate: eventiProfileEventiRecord.data,
                                                                              ));
                                                                              logFirebaseEvent('Container_bottom_sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Color(0x43000000),
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
                                                                                      child: SeiInListaWidget(),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 140.0,
                                                                              height: 34.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  'Entra in lista',
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
                                                                            logFirebaseEvent('EVENTI_PROFILE_Container_miq1ugrz_ON_TAP');
                                                                            logFirebaseEvent('Container_backend_call');
                                                                            await containerListaEventiRecord.reference.delete();
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                140.0,
                                                                            height:
                                                                                34.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                'Sei in lista',
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
                                                                  ),
                                                                if (eventiProfileEventiRecord
                                                                    .biglietti)
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
                                                                          'EVENTI_PROFILE_Container_5y4myaxp_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Container_launch_u_r_l');
                                                                      await launchURL(
                                                                          eventiProfileEventiRecord
                                                                              .bigliettiUrl);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          140.0,
                                                                      height:
                                                                          34.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Biglietti',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                if (eventiProfileEventiRecord
                                                                    .tablesFunction)
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
                                                                          'EVENTI_PROFILE_Container_gweprvie_ON_TAP');
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
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: TablesWidget(
                                                                                eventRef: widget.eventoRef!,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          34.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Tavoli',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                              ],
                                                            ),
                                                          ),
                                                        ].addToEnd(SizedBox(
                                                            height: 100.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if ((eventiProfileEventiRecord.eventoAnnullato ==
                                      false) ||
                                  (eventiProfileEventiRecord.eventoAnnullato ==
                                      null))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    height: isiOS ? 95.0 : 70.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Visibility(
                                      visible: !(isWeb
                                          ? MediaQuery.viewInsetsOf(context)
                                                  .bottom >
                                              0
                                          : _isKeyboardVisible),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => StreamBuilder<
                                            List<EventiParticiaptingRecord>>(
                                          stream:
                                              queryEventiParticiaptingRecord(
                                            parent: widget.eventoRef,
                                            queryBuilder: (eventiParticiaptingRecord) =>
                                                eventiParticiaptingRecord.whereIn(
                                                    'userParticipatingEventRef',
                                                    functions.uidsToUserRefs(
                                                        (currentUserDocument
                                                                    ?.friends
                                                                    .toList() ??
                                                                [])
                                                            .toList())),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  child: SpinKitFadingCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 25.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<EventiParticiaptingRecord>
                                                containerFriendsEventiParticiaptingRecordList =
                                                snapshot.data!;

                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 15.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if ((containerFriendsEventiParticiaptingRecordList
                                                                      .length >
                                                                  0) &&
                                                              loggedIn)
                                                            InkWell(
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
                                                                    'EVENTI_PROFILE_PAGE_Row_leon6evf_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Row_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  ParticipatingListEvent100Widget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'eventoRef':
                                                                        serializeParam(
                                                                      widget
                                                                          .eventoRef,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'blink':
                                                                        serializeParam(
                                                                      eventiProfileEventiRecord
                                                                          .blinkEvent,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'eventName':
                                                                        serializeParam(
                                                                      eventiProfileEventiRecord
                                                                          .titolo,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'eventDoc':
                                                                        serializeParam(
                                                                      eventiProfileEventiRecord,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'eventDoc':
                                                                        eventiProfileEventiRecord,
                                                                  },
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      if (_model
                                                                              .myFriendsHere
                                                                              .length >
                                                                          1)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              3.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<EventiParticiaptingRecord>(
                                                                            stream:
                                                                                EventiParticiaptingRecord.getDocument(containerFriendsEventiParticiaptingRecordList.elementAtOrNull(1)!.reference),
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

                                                                              final circleImageEventiParticiaptingRecord = snapshot.data!;

                                                                              return Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    circleImageEventiParticiaptingRecord.photoUrl,
                                                                                    'https://i.postimg.cc/qRLbP6C6/profilo-eaqfv.png',
                                                                                  ),
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      Container(
                                                                        width:
                                                                            48.0,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(100.0),
                                                                            bottomRight:
                                                                                Radius.circular(100.0),
                                                                            topLeft:
                                                                                Radius.circular(100.0),
                                                                            topRight:
                                                                                Radius.circular(100.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                        ),
                                                                        child: StreamBuilder<
                                                                            EventiParticiaptingRecord>(
                                                                          stream: EventiParticiaptingRecord.getDocument(containerFriendsEventiParticiaptingRecordList
                                                                              .firstOrNull!
                                                                              .reference),
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

                                                                            final circleImageEventiParticiaptingRecord =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              width: 44.0,
                                                                              height: 44.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  circleImageEventiParticiaptingRecord.photoUrl,
                                                                                  'https://i.postimg.cc/qRLbP6C6/profilo-eaqfv.png',
                                                                                ),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                containerFriendsEventiParticiaptingRecordList.length.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: containerFriendsEventiParticiaptingRecordList.length == 1 ? ' amico' : ' amici',
                                                                              style: TextStyle(),
                                                                            ),
                                                                            TextSpan(
                                                                              text: containerAllEventiParticiaptingRecordList.length == 1 ? ' e un\'altra persona partecipano' : ' e altre ',
                                                                              style: TextStyle(),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                containerAllEventiParticiaptingRecordList.length == 1 ? ' ' : (containerAllEventiParticiaptingRecordList.length - containerFriendsEventiParticiaptingRecordList.length).toString(),
                                                                                'X',
                                                                              ),
                                                                              style: TextStyle(),
                                                                            ),
                                                                            TextSpan(
                                                                              text: containerAllEventiParticiaptingRecordList.length == 1 ? '  ' : ' persone partecipano',
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if ((containerFriendsEventiParticiaptingRecordList
                                                                      .length ==
                                                                  0) ||
                                                              !loggedIn)
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'EVENTI_PROFILE_PAGE_Text_2rw9aq0m_ON_TAP');
                                                                  if (loggedIn) {
                                                                    logFirebaseEvent(
                                                                        'RichText_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      ParticipatingListEvent100Widget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'eventoRef':
                                                                            serializeParam(
                                                                          widget
                                                                              .eventoRef,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'blink':
                                                                            serializeParam(
                                                                          eventiProfileEventiRecord
                                                                              .blinkEvent,
                                                                          ParamType
                                                                              .bool,
                                                                        ),
                                                                        'eventName':
                                                                            serializeParam(
                                                                          eventiProfileEventiRecord
                                                                              .titolo,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'eventDoc':
                                                                            serializeParam(
                                                                          eventiProfileEventiRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'eventDoc':
                                                                            eventiProfileEventiRecord,
                                                                      },
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'RichText_bottom_sheet');
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
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                InfoFeatureLogOutWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }
                                                                },
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: containerAllEventiParticiaptingRecordList
                                                                            .length
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            ' persone partecipano',
                                                                        style:
                                                                            TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
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
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if (!functions.returnIfAuthUserIsInEventiParticiapting(
                                                                containerAllEventiParticiaptingRecordList
                                                                    .toList(),
                                                                currentUserReference!)) {
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'EVENTI_PROFILE_Container_yztxmatu_ON_TAP');
                                                                  if (loggedIn) {
                                                                    logFirebaseEvent(
                                                                        'Container_bottom_sheet');
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
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                ParticipateEventWidgetWidget(
                                                                              eventiDoc: eventiProfileEventiRecord,
                                                                              eventoRef: eventiProfileEventiRecord.reference,
                                                                              listDocExist: containerListaEventiRecord != null,
                                                                              eventData: eventiProfileEventiRecord.data!,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Container_haptic_feedback');
                                                                    HapticFeedback
                                                                        .lightImpact();
                                                                    logFirebaseEvent(
                                                                        'Container_bottom_sheet');
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
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                InfoFeatureLogOutWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 32.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Partecipa',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'EVENTI_PROFILE_Container_i9fut15q_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Container_bottom_sheet');
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
                                                                              DeleteEventParticipatingWidget(
                                                                            eventParticipantingRef:
                                                                                functions.returnEventiParticiaptingDocRef(containerAllEventiParticiaptingRecordList.toList(), currentUserReference)!,
                                                                            eventRef:
                                                                                widget.eventoRef!,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 150.0,
                                                                  height: 32.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent3,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Stai partecipando',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
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
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 120.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'EVENTI_PROFILE_PAGE_Container_ON_TAP');
                                      if (functions
                                          .returnIfAuthUserIsInEventiParticiapting(
                                              containerAllEventiParticiaptingRecordList
                                                  .toList(),
                                              currentUserReference!)) {
                                        if (FFAppState().swipeTutorial) {
                                          if ((valueOrDefault(
                                                          currentUserDocument
                                                              ?.sex,
                                                          '') ==
                                                      '') ||
                                              (valueOrDefault(
                                                          currentUserDocument
                                                              ?.matchSex,
                                                          '') ==
                                                      '')) {
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              FilterSwipesWidget.routeName,
                                              queryParameters: {
                                                'eventId': serializeParam(
                                                  widget.eventoRef,
                                                  ParamType.DocumentReference,
                                                ),
                                                'participatingDocs':
                                                    serializeParam(
                                                  containerAllEventiParticiaptingRecordList,
                                                  ParamType.Document,
                                                  isList: true,
                                                ),
                                                'eventName': serializeParam(
                                                  eventiProfileEventiRecord
                                                      .titolo,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'participatingDocs':
                                                    containerAllEventiParticiaptingRecordList,
                                              },
                                            );
                                          } else {
                                            if ((currentUserPhoto == '') ||
                                                (currentUserPhoto ==
                                                    'https://i.postimg.cc/6qqxxnmG/user-profile-icon-vector-avatar-600nw-2220431045.png')) {
                                              logFirebaseEvent(
                                                  'Container_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          NoPhotoSwipeWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                SwipeUsersWidget.routeName,
                                                queryParameters: {
                                                  'eventId': serializeParam(
                                                    eventiProfileEventiRecord
                                                        .reference.id,
                                                    ParamType.String,
                                                  ),
                                                  'eventRef': serializeParam(
                                                    eventiProfileEventiRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'eventName': serializeParam(
                                                    eventiProfileEventiRecord
                                                        .titolo,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            TutorialSwipeWidget.routeName,
                                            queryParameters: {
                                              'eventRef': serializeParam(
                                                widget.eventoRef,
                                                ParamType.DocumentReference,
                                              ),
                                              'blink': serializeParam(
                                                true,
                                                ParamType.bool,
                                              ),
                                              'participatingDocs':
                                                  serializeParam(
                                                containerAllEventiParticiaptingRecordList,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                              'eventName': serializeParam(
                                                eventiProfileEventiRecord
                                                    .titolo,
                                                ParamType.String,
                                              ),
                                              'eventType': serializeParam(
                                                eventiProfileEventiRecord
                                                    .eventType,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'participatingDocs':
                                                  containerAllEventiParticiaptingRecordList,
                                            },
                                          );
                                        }
                                      } else {
                                        logFirebaseEvent(
                                            'Container_haptic_feedback');
                                        HapticFeedback.lightImpact();
                                        logFirebaseEvent(
                                            'Container_bottom_sheet');
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
                                                child:
                                                    SwipeNotParticipatingEventWidget(
                                                  eventRef: widget.eventoRef!,
                                                  eventName:
                                                      eventiProfileEventiRecord
                                                          .titolo,
                                                  eventDoc:
                                                      eventiProfileEventiRecord,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(1000.0),
                                          bottomRight: Radius.circular(1000.0),
                                          topLeft: Radius.circular(1000.0),
                                          topRight: Radius.circular(1000.0),
                                        ),
                                      ),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(1000.0),
                                            bottomRight:
                                                Radius.circular(1000.0),
                                            topLeft: Radius.circular(1000.0),
                                            topRight: Radius.circular(1000.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 10.0, 10.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                            child: Image.asset(
                                              'assets/images/swipe_icon2.png',
                                              width: 30.0,
                                              height: 30.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (eventiProfileEventiRecord.contatto)
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 200.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EVENTI_PROFILE_Container_5fy6fccf_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_launch_u_r_l');
                                        await launchURL(functions.whatsappLink(
                                            eventiProfileEventiRecord
                                                .telefonoWa)!);
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(1000.0),
                                            bottomRight:
                                                Radius.circular(1000.0),
                                            topLeft: Radius.circular(1000.0),
                                            topRight: Radius.circular(1000.0),
                                          ),
                                        ),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF25D366),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  Radius.circular(1000.0),
                                              bottomRight:
                                                  Radius.circular(1000.0),
                                              topLeft: Radius.circular(1000.0),
                                              topRight: Radius.circular(1000.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.whatsapp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
