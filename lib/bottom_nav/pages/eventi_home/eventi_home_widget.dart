import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/search_concert_widget.dart';
import '/components/search_event_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/info/info_a_i_photo_feature/info_a_i_photo_feature_widget.dart';
import '/info/info_friends_participants/info_friends_participants_widget.dart';
import '/info/info_jump_queue/info_jump_queue_widget.dart';
import '/info/info_lista_special/info_lista_special_widget.dart';
import '/info/info_open/info_open_widget.dart';
import '/info/info_with_drink/info_with_drink_widget.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'eventi_home_model.dart';
export 'eventi_home_model.dart';

class EventiHomeWidget extends StatefulWidget {
  const EventiHomeWidget({super.key});

  static String routeName = 'eventiHome';
  static String routePath = 'eventiHome';

  @override
  State<EventiHomeWidget> createState() => _EventiHomeWidgetState();
}

class _EventiHomeWidgetState extends State<EventiHomeWidget>
    with TickerProviderStateMixin {
  late EventiHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventiHomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'eventiHome'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EVENTI_HOME_eventiHome_ON_INIT_STATE');
      if (!((currentUserDocument?.friends.toList() ?? []).isNotEmpty)) {
        logFirebaseEvent('eventiHome_backend_call');

        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'friends': FieldValue.arrayUnion([FFAppState().OutOutID]),
            },
          ),
        });
      }
      logFirebaseEvent('eventiHome_custom_action');
      await actions.showUpdateDialog(
        context,
        'https://play.google.com/store/apps/details?id=com.mycompany.romanita&hl=en',
        'https://apps.apple.com/it/app/romanytas/id6502392562',
      );
      logFirebaseEvent('eventiHome_update_app_state');
      FFAppState().page = 'events';
      safeSetState(() {});
      if (FFAppState().city == '') {
        logFirebaseEvent('eventiHome_update_app_state');
        FFAppState().city = 'Roma';
        safeSetState(() {});
      }
      logFirebaseEvent('eventiHome_custom_action');
      _model.concertiEv = await actions.fetchVisibleEvents(
        FFAppState().city,
      );
      logFirebaseEvent('eventiHome_custom_action');
      _model.eventis = await actions.fetchEventsSorted(
        FFAppState().city,
        true,
        'event',
      );
      logFirebaseEvent('eventiHome_update_page_state');
      _model.listOfConcerti =
          _model.concertiEv!.toList().cast<ConcertiInEvidenzaRecord>();
      _model.listOfEventEventi = _model.eventis!.toList().cast<EventiRecord>();
      safeSetState(() {});
      if ((valueOrDefault<bool>(
                  currentUserDocument?.matchesNotifications, false) ==
              null) ||
          (valueOrDefault<bool>(
                  currentUserDocument?.likesNotifications, false) ==
              null) ||
          (valueOrDefault<bool>(
                  currentUserDocument?.friendsRequestsNotifications, false) ==
              null)) {
        logFirebaseEvent('eventiHome_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          likesNotifications: true,
          matchesNotifications: true,
          friendsRequestsNotifications: true,
        ));
      }
      if (((valueOrDefault<bool>(currentUserDocument?.syncContacts, false) ==
                  false) ||
              (valueOrDefault<bool>(currentUserDocument?.syncContacts, false) ==
                  null)) &&
          loggedIn) {
        logFirebaseEvent('eventiHome_navigate_to');

        context.pushNamed(SynchroniseContactsWidget.routeName);
      }
      if (FFAppState().lastCacheTime == null) {
        logFirebaseEvent('eventiHome_update_app_state');
        FFAppState().lastCacheTime = getCurrentTimestamp;
        safeSetState(() {});
      }
      logFirebaseEvent('eventiHome_custom_action');
      _model.isCacheOverride = await actions.isOverrideCacheAction(
        FFAppState().lastCacheTime!,
        30,
      );
      if (_model.isCacheOverride!) {
        logFirebaseEvent('eventiHome_update_app_state');
        FFAppState().lastCacheTime = getCurrentTimestamp;
        FFAppState().isCacheOverride = true;
        safeSetState(() {});
        logFirebaseEvent('eventiHome_clear_query_cache');
        FFAppState().clearEventiCacheCache();
        logFirebaseEvent('eventiHome_wait__delay');
        await Future.delayed(const Duration(milliseconds: 1000));
        logFirebaseEvent('eventiHome_update_app_state');
        FFAppState().isCacheOverride = false;
        safeSetState(() {});
      }
      logFirebaseEvent('eventiHome_update_app_state');
      FFAppState().curTime = functions.getDate('all');
      safeSetState(() {});
      logFirebaseEvent('eventiHome_wait__delay');
      await Future.delayed(const Duration(milliseconds: 100));
      await Future.wait([
        Future(() async {
          logFirebaseEvent('eventiHome_update_page_state');
          _model.curDay = functions.getDate('day');
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('eventiHome_update_page_state');
          _model.curMonth = functions.getDate('month');
          safeSetState(() {});
        }),
        Future(() async {
          logFirebaseEvent('eventiHome_update_page_state');
          _model.curYear = functions.getDate('year');
          safeSetState(() {});
        }),
      ]);
      if (FFAppState().eventiState == 'concerti') {
        logFirebaseEvent('eventiHome_page_view');
        await _model.pageViewController?.animateToPage(
          1,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
      if (FFAppState().eventiState == 'eventi') {
        logFirebaseEvent('eventiHome_page_view');
        await _model.pageViewController?.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
      logFirebaseEvent('eventiHome_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('eventiHome_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.light);
      if (FFAppState().review < 4) {
        if (FFAppState().review == 3) {
          logFirebaseEvent('eventiHome_update_app_state');
          FFAppState().review = FFAppState().review + 1;
          safeSetState(() {});
          logFirebaseEvent('eventiHome_custom_action');
          await actions.inAppReview();
          return;
        } else {
          logFirebaseEvent('eventiHome_update_app_state');
          FFAppState().review = FFAppState().review + 1;
          safeSetState(() {});
          return;
        }
      } else {
        return;
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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
          body: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
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
                                'EVENTI_HOME_PAGE_Text_y86rj0a1_ON_TAP');
                            logFirebaseEvent('Text_page_view');
                            await _model.pageViewController?.animateToPage(
                              0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            'EVENTI',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Horizon',
                                  color: valueOrDefault<Color>(
                                    _model.pageViewCurrentIndex == 0
                                        ? FlutterFlowTheme.of(context).primary
                                        : Color(0xFF303030),
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  fontSize: 22.0,
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
                                'EVENTI_HOME_PAGE_Text_opou726q_ON_TAP');
                            logFirebaseEvent('Text_page_view');
                            await _model.pageViewController?.animateToPage(
                              1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            'concerti',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Horizon',
                                  color: _model.pageViewCurrentIndex == 1
                                      ? FlutterFlowTheme.of(context).primary
                                      : Color(0xFF303030),
                                  fontSize: 22.0,
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
                      height: double.infinity,
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) async {
                          logFirebaseEvent(
                              'EVENTI_HOME_PageView_g2ys9ofe_ON_WIDGET_');
                          logFirebaseEvent('PageView_custom_action');
                          _model.concertiEvCopy =
                              await actions.fetchVisibleEvents(
                            FFAppState().city,
                          );
                          logFirebaseEvent('PageView_custom_action');
                          _model.eventisCopy = await actions.fetchEventsSorted(
                            FFAppState().city,
                            true,
                            'event',
                          );
                          logFirebaseEvent('PageView_custom_action');
                          _model.discoCopy = await actions.fetchEventsSorted(
                            FFAppState().city,
                            true,
                            'disco',
                          );
                          logFirebaseEvent('PageView_custom_action');
                          _model.serateCopy = await actions.fetchSerateSorted(
                            FFAppState().city,
                            true,
                          );
                          logFirebaseEvent('PageView_update_page_state');
                          _model.listOfConcerti = _model.concertiEvCopy!
                              .toList()
                              .cast<ConcertiInEvidenzaRecord>();
                          _model.listOfEventEventi =
                              _model.eventisCopy!.toList().cast<EventiRecord>();
                          _model.listOfSerate =
                              _model.serateCopy!.toList().cast<SerateRecord>();
                          _model.listOfDiscoEventi =
                              _model.discoCopy!.toList().cast<EventiRecord>();
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                        scrollDirection: Axis.horizontal,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 25.0, 20.0, 0.0),
                                          child: FlutterFlowChoiceChips(
                                            options: (_model.moreFilters
                                                    ? _model.allFilters
                                                    : _model.lessFilters)
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model.choiceChipsValues =
                                                    val),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              iconSize: 16.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                              elevation: 0.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderWidth: 2.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              iconSize: 16.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                              elevation: 0.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderWidth: 2.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            chipSpacing: 6.0,
                                            rowSpacing: 8.0,
                                            multiselect: true,
                                            initialized:
                                                _model.choiceChipsValues !=
                                                    null,
                                            alignment: WrapAlignment.center,
                                            controller: _model
                                                    .choiceChipsValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [],
                                            ),
                                            wrapped: true,
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final extraConcert = functions
                                                            .getRandomConcert(
                                                                _model
                                                                    .listOfConcerti
                                                                    .toList(),
                                                                1)
                                                            .toList();

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              extraConcert
                                                                  .length,
                                                              (extraConcertIndex) {
                                                            final extraConcertItem =
                                                                extraConcert[
                                                                    extraConcertIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'EVENTI_HOME_PAGE_Row_79jrxtc2_ON_TAP');
                                                                  if (extraConcertItem
                                                                          .eventOrConcert ==
                                                                      'event') {
                                                                    logFirebaseEvent(
                                                                        'Row_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      EventiProfileWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'eventoRef':
                                                                            serializeParam(
                                                                          extraConcertItem
                                                                              .eventRef,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'goBack':
                                                                            serializeParam(
                                                                          'events',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Row_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      ConcertoProfileWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'concertoRef':
                                                                            serializeParam(
                                                                          extraConcertItem
                                                                              .concertReferenceRef,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  }
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        extraConcertItem
                                                                            .locandina,
                                                                        width:
                                                                            160.0,
                                                                        height:
                                                                            90.0,
                                                                        fit: BoxFit
                                                                            .cover,
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
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('EVENTI_HOME_PAGE_Text_k46zhkwi_ON_TAP');
                                                                                  logFirebaseEvent('Text_navigate_to');

                                                                                  context.pushNamed(ProvaWidget.routeName);
                                                                                },
                                                                                child: Text(
                                                                                  extraConcertItem.titolo,
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          extraConcertItem.orario,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Text(
                                                                                      extraConcertItem.localita,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        "d",
                                                                                        extraConcertItem.data!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            fontSize: 15.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        "MMM",
                                                                                        extraConcertItem.data!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 15.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      extraConcertItem.locale,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            lineHeight: 1.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 80.0,
                                                                                  height: 16.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      'In evidenza',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                              height: 20.0)),
                                                        );
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final eventiData = functions
                                                              .sortEventi(
                                                                  _model
                                                                      .listOfEventEventi
                                                                      .where((e) => functions.arrayContainsArrayItems(
                                                                          _model
                                                                              .choiceChipsValues!
                                                                              .toList(),
                                                                          e.tipo
                                                                              .toList()))
                                                                      .toList(),
                                                                  currentUserLocationValue!)
                                                              .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                eventiData
                                                                    .length,
                                                                (eventiDataIndex) {
                                                              final eventiDataItem =
                                                                  eventiData[
                                                                      eventiDataIndex];
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if ((eventiDataIndex ==
                                                                          0) ||
                                                                      (dateTimeFormat(
                                                                            "MMMEd",
                                                                            eventiDataItem.data,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ) !=
                                                                          dateTimeFormat(
                                                                            "MMMEd",
                                                                            functions.sortEventi(_model.listOfEventEventi.where((e) => functions.arrayContainsArrayItems(_model.choiceChipsValues!.toList(), e.tipo.toList())).toList(), currentUserLocationValue!).elementAtOrNull(eventiDataIndex - 1)?.data,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )))
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            valueOrDefault<double>(
                                                                              (eventiDataIndex != 0) &&
                                                                                      (dateTimeFormat(
                                                                                            "MMMEd",
                                                                                            eventiDataItem.data,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ) !=
                                                                                          dateTimeFormat(
                                                                                            "MMMEd",
                                                                                            functions.sortEventi(_model.listOfEventEventi.where((e) => functions.arrayContainsArrayItems(_model.choiceChipsValues!.toList(), e.tipo.toList())).toList(), currentUserLocationValue!).elementAtOrNull(eventiDataIndex - 1)?.data,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ))
                                                                                  ? 10.0
                                                                                  : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                            "MMMMEEEEd",
                                                                            eventiDataItem.data!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
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
                                                                            'EVENTI_HOME_PAGE_Row_hxvamu5s_ON_TAP');
                                                                        if (loggedIn) {
                                                                          if (FFAppState().tutorialParticipate <
                                                                              3) {
                                                                            logFirebaseEvent('Row_update_app_state');
                                                                            FFAppState().tutorialParticipate =
                                                                                FFAppState().tutorialParticipate + 1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Row_navigate_to');

                                                                            context.pushNamed(
                                                                              EventiProfileWidget.routeName,
                                                                              queryParameters: {
                                                                                'eventoRef': serializeParam(
                                                                                  eventiDataItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'goBack': serializeParam(
                                                                                  'events',
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          } else if (FFAppState().tutorialParticipate ==
                                                                              3) {
                                                                            logFirebaseEvent('Row_navigate_to');

                                                                            context.pushNamed(
                                                                              TutorialParticipateWidget.routeName,
                                                                              queryParameters: {
                                                                                'eventRef': serializeParam(
                                                                                  eventiDataItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'outOrIn': serializeParam(
                                                                                  'in',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'eventType': serializeParam(
                                                                                  'event',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'eventDoc': serializeParam(
                                                                                  eventiDataItem,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'eventDoc': eventiDataItem,
                                                                              },
                                                                            );

                                                                            logFirebaseEvent('Row_update_app_state');
                                                                            FFAppState().tutorialParticipate =
                                                                                FFAppState().tutorialParticipate + 1;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            logFirebaseEvent('Row_navigate_to');

                                                                            context.pushNamed(
                                                                              EventiProfileWidget.routeName,
                                                                              queryParameters: {
                                                                                'eventoRef': serializeParam(
                                                                                  eventiDataItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'goBack': serializeParam(
                                                                                  'events',
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }
                                                                        } else {
                                                                          if (FFAppState().tutorialParticipate <
                                                                              3) {
                                                                            logFirebaseEvent('Row_update_app_state');
                                                                            FFAppState().tutorialParticipate =
                                                                                FFAppState().tutorialParticipate + 1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Row_navigate_to');

                                                                            context.pushNamed(
                                                                              EventiProfileLogOutWidget.routeName,
                                                                              queryParameters: {
                                                                                'eventoRef': serializeParam(
                                                                                  eventiDataItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'goBack': serializeParam(
                                                                                  'events',
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          } else if (FFAppState().tutorialParticipate ==
                                                                              3) {
                                                                            logFirebaseEvent('Row_navigate_to');

                                                                            context.pushNamed(
                                                                              TutorialParticipateWidget.routeName,
                                                                              queryParameters: {
                                                                                'eventRef': serializeParam(
                                                                                  eventiDataItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'outOrIn': serializeParam(
                                                                                  'out',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'eventType': serializeParam(
                                                                                  'event',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'eventDoc': serializeParam(
                                                                                  eventiDataItem,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'eventDoc': eventiDataItem,
                                                                              },
                                                                            );

                                                                            logFirebaseEvent('Row_update_app_state');
                                                                            FFAppState().tutorialParticipate =
                                                                                FFAppState().tutorialParticipate + 1;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            logFirebaseEvent('Row_navigate_to');

                                                                            context.pushNamed(
                                                                              EventiProfileLogOutWidget.routeName,
                                                                              queryParameters: {
                                                                                'eventoRef': serializeParam(
                                                                                  eventiDataItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'goBack': serializeParam(
                                                                                  'events',
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }
                                                                        }
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              eventiDataItem.eventoAnnullato ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/content-manager-asgt0n/assets/6pfhelsiy902/Untitled_design_(34).png' : eventiDataItem.locandina,
                                                                              width: 160.0,
                                                                              height: 90.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                    child: Text(
                                                                                      eventiDataItem.titolo,
                                                                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            fontSize: 15.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            lineHeight: 1.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    dateTimeFormat(
                                                                                                      "Hm",
                                                                                                      eventiDataItem.inizioOrario!,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    ' - ',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    dateTimeFormat(
                                                                                                      "Hm",
                                                                                                      eventiDataItem.fineOrario!,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Text(
                                                                                                eventiDataItem.localita,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          if (eventiDataItem.saltafila) {
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('EVENTI_HOME_PAGE_Image_od8ksurc_ON_TAP');
                                                                                                logFirebaseEvent('Image_bottom_sheet');
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
                                                                                                        child: InfoJumpQueueWidget(),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/SkiptheQueue.png',
                                                                                                  width: 30.0,
                                                                                                  height: 30.0,
                                                                                                  fit: BoxFit.cover,
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
                                                                                                logFirebaseEvent('EVENTI_HOME_PAGE_Image_e53n5jil_ON_TAP');
                                                                                                logFirebaseEvent('Image_bottom_sheet');
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
                                                                                                        child: InfoListaSpecialWidget(),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/OutOut_logo_tondo_bigsd.png',
                                                                                                  width: 30.0,
                                                                                                  height: 30.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            if (eventiDataItem.functionPhotoAI) {
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('EVENTI_HOME_PAGE_Image_fbabwj2m_ON_TAP');
                                                                                                  logFirebaseEvent('Image_bottom_sheet');
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
                                                                                                          child: InfoAIPhotoFeatureWidget(),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                },
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.asset(
                                                                                                    'assets/images/563d0201e4359c2e890569e254ea14790eb370b71d08b6de5052511cc0352313c.png',
                                                                                                    width: 35.0,
                                                                                                    height: 35.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else if (eventiDataItem.open) {
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('EVENTI_HOME_PAGE_Image_vdw0y3t6_ON_TAP');
                                                                                                  logFirebaseEvent('Image_bottom_sheet');
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
                                                                                                          child: InfoOpenWidget(),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                },
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.asset(
                                                                                                    'assets/images/images_(14).png',
                                                                                                    width: 35.0,
                                                                                                    height: 35.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else if (eventiDataItem.withDrink) {
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('EVENTI_HOME_PAGE_Image_tboiifh2_ON_TAP');
                                                                                                  logFirebaseEvent('Image_bottom_sheet');
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
                                                                                                          child: InfoWithDrinkWidget(),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                },
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.asset(
                                                                                                    'assets/images/cocktail-icon-614x460.png',
                                                                                                    width: 35.0,
                                                                                                    height: 35.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              return Icon(
                                                                                                Icons.arrow_back,
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                size: 1.0,
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: AuthUserStreamWidget(
                                                                                          builder: (context) => StreamBuilder<List<EventiParticiaptingRecord>>(
                                                                                            stream: queryEventiParticiaptingRecord(
                                                                                              parent: eventiDataItem.reference,
                                                                                              queryBuilder: (eventiParticiaptingRecord) => eventiParticiaptingRecord.whereIn('userParticipatingEventRef', functions.uidsToUserRefs((currentUserDocument?.friends.toList() ?? []).toList())),
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
                                                                                              List<EventiParticiaptingRecord> conditionalBuilderEventiParticiaptingRecordList = snapshot.data!;

                                                                                              return Builder(
                                                                                                builder: (context) {
                                                                                                  if (valueOrDefault<bool>(
                                                                                                    (conditionalBuilderEventiParticiaptingRecordList.length > 0) && loggedIn,
                                                                                                    false,
                                                                                                  )) {
                                                                                                    return InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('EVENTI_HOME_Container_va64imgs_ON_TAP');
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
                                                                                                                child: InfoFriendsParticipantsWidget(
                                                                                                                  friends: conditionalBuilderEventiParticiaptingRecordList,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 35.0,
                                                                                                        height: 35.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              conditionalBuilderEventiParticiaptingRecordList.length.toString(),
                                                                                                              '0',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Montserrat',
                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  fontSize: 17.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  } else {
                                                                                                    return Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          dateTimeFormat(
                                                                                                            "d",
                                                                                                            eventiDataItem.data!,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Montserrat',
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          dateTimeFormat(
                                                                                                            "MMM",
                                                                                                            eventiDataItem.data!,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Montserrat',
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            eventiDataItem.locale,
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 125.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'EVENTI_HOME_PAGE_Icon_u8t493vw_ON_TAP');
                                            await Future.wait([
                                              Future(() async {
                                                logFirebaseEvent(
                                                    'Icon_update_page_state');
                                                _model.moreFilters =
                                                    !_model.moreFilters;
                                                safeSetState(() {});
                                              }),
                                              Future(() async {
                                                if (_model.moreFilters) {
                                                  logFirebaseEvent(
                                                      'Icon_widget_animation');
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation'] !=
                                                      null) {
                                                    await animationsMap[
                                                            'iconOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Icon_widget_animation');
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation'] !=
                                                      null) {
                                                    await animationsMap[
                                                            'iconOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                }
                                              }),
                                            ]);
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconOnActionTriggerAnimation']!,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      0.0,
                                      0.0,
                                      valueOrDefault<double>(
                                        isiOS ? 90.0 : 70.0,
                                        0.0,
                                      )),
                                  child: Container(
                                    width: 280.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(24.0),
                                        topRight: Radius.circular(24.0),
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EVENTI_HOME_PAGE_Row_saclkoyw_ON_TAP');
                                        logFirebaseEvent('Row_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
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
                                                child: SearchEventWidget(),
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
                                                    0.0, 3.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    'CERCA EVENTO',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Horizon',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 25.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'EVENTI_HOME_Container_p16z4124_ON_TAP');
                                    logFirebaseEvent('Container_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
                                            child: SearchConcertWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.search_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Cerca',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.75,
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FutureBuilder<
                                            List<ConcertiInEvidenzaRecord>>(
                                          future:
                                              queryConcertiInEvidenzaRecordOnce(
                                            queryBuilder:
                                                (concertiInEvidenzaRecord) =>
                                                    concertiInEvidenzaRecord
                                                        .where(
                                                          'Data',
                                                          isGreaterThanOrEqualTo:
                                                              functions
                                                                  .getEndOfDay(
                                                                      0),
                                                        )
                                                        .where(
                                                          'city',
                                                          isEqualTo:
                                                              FFAppState().city,
                                                        )
                                                        .orderBy('Data'),
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
                                            List<ConcertiInEvidenzaRecord>
                                                containerConcertiInEvidenzaRecordList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final extraConcert = functions
                                                      .getRandomConcert(
                                                          containerConcertiInEvidenzaRecordList
                                                              .toList(),
                                                          2)
                                                      .toList();

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        extraConcert.length,
                                                        (extraConcertIndex) {
                                                      final extraConcertItem =
                                                          extraConcert[
                                                              extraConcertIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
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
                                                                'EVENTI_HOME_PAGE_Row_be1svvdp_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Row_navigate_to');

                                                            context.pushNamed(
                                                              ConcertoProfileWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'concertoRef':
                                                                    serializeParam(
                                                                  extraConcertItem
                                                                      .concertReferenceRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            logFirebaseEvent(
                                                                'Row_backend_call');

                                                            await extraConcertItem
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'views': FieldValue
                                                                      .increment(
                                                                          1),
                                                                },
                                                              ),
                                                            });
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  extraConcertItem
                                                                      .locandina,
                                                                  width: 160.0,
                                                                  height: 90.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          extraConcertItem
                                                                              .titolo
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                20,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    extraConcertItem.orario,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                extraConcertItem.localita,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  dateTimeFormat(
                                                                                    "d",
                                                                                    extraConcertItem.data!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  dateTimeFormat(
                                                                                    "MMM",
                                                                                    extraConcertItem.data!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              extraConcertItem.locale.maybeHandleOverflow(
                                                                                maxChars: 15,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                80.0,
                                                                            height:
                                                                                16.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                'In evidenza',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(height: 20.0)),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                        FutureBuilder<List<ConcertiRecord>>(
                                          future: queryConcertiRecordOnce(
                                            queryBuilder: (concertiRecord) =>
                                                concertiRecord
                                                    .where(
                                                      'Data',
                                                      isGreaterThanOrEqualTo:
                                                          FFAppState().curTime,
                                                    )
                                                    .where(
                                                      'city',
                                                      isEqualTo:
                                                          FFAppState().city,
                                                    )
                                                    .orderBy('Data'),
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
                                            List<ConcertiRecord>
                                                columnConcertiRecordList =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  columnConcertiRecordList
                                                      .length, (columnIndex) {
                                                final columnConcertiRecord =
                                                    columnConcertiRecordList[
                                                        columnIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          20.0, 10.0),
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
                                                          'EVENTI_HOME_PAGE_Row_x7te2qhm_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                        ConcertoProfileWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'concertoRef':
                                                              serializeParam(
                                                            columnConcertiRecord
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            columnConcertiRecord
                                                                .locandina,
                                                            width: 160.0,
                                                            height: 90.0,
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
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Text(
                                                                    columnConcertiRecord
                                                                        .titolo
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          20,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              columnConcertiRecord.orario,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          columnConcertiRecord
                                                                              .localita,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "d",
                                                                            columnConcertiRecord.data!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "MMM",
                                                                            columnConcertiRecord.data!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    columnConcertiRecord
                                                                        .locale
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          20,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
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
                                                                              FontWeight.w500,
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
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ].addToEnd(SizedBox(height: 100.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 100.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.bottomNavOutOutModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomNavOutOutWidget(),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 150.0),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(100.0),
                      ),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'EVENTI_HOME_PAGE_Icon_87c6gyux_ON_TAP');
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed(MapEventsWidget.routeName);
                      },
                      child: Icon(
                        Icons.map,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 30.0,
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
