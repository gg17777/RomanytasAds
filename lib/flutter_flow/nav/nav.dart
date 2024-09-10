import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: RootPageContext.wrap(
          appStateNotifier.loggedIn
              ? entryPage ?? const LoadPageWidget()
              : const EventiHomeWidget(),
          errorRoute: state.uri.toString(),
        ),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn
                ? entryPage ?? const LoadPageWidget()
                : const EventiHomeWidget(),
          ),
          routes: [
            FFRoute(
              name: 'nasoniMap',
              path: 'nasoniMap',
              builder: (context, params) => const NasoniMapWidget(),
            ),
            FFRoute(
              name: 'DiscotecaProfile',
              path: 'discotecaProfile',
              builder: (context, params) => DiscotecaProfileWidget(
                serataRef: params.getParam(
                  'serataRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Serate'],
                ),
              ),
            ),
            FFRoute(
              name: 'EventiProfile',
              path: 'eventiProfile',
              builder: (context, params) => EventiProfileWidget(
                eventoRef: params.getParam(
                  'eventoRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
              ),
            ),
            FFRoute(
              name: 'MostreProfile',
              path: 'mostreProfile',
              builder: (context, params) => MostreProfileWidget(
                mostreRef: params.getParam(
                  'mostreRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Mostre'],
                ),
              ),
            ),
            FFRoute(
              name: 'ConcertoProfile',
              path: 'concertoProfile',
              builder: (context, params) => ConcertoProfileWidget(
                concertoRef: params.getParam(
                  'concertoRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Concerti'],
                ),
              ),
            ),
            FFRoute(
              name: 'banglaMap',
              path: 'banglaMap',
              builder: (context, params) => const BanglaMapWidget(),
            ),
            FFRoute(
              name: 'ciboMap',
              path: 'ciboMap',
              builder: (context, params) => const CiboMapWidget(),
            ),
            FFRoute(
              name: 'Profilo',
              path: 'profilo',
              builder: (context, params) => const ProfiloWidget(),
            ),
            FFRoute(
              name: 'segnalazioneNasoni',
              path: 'segnalazioneNasoni',
              builder: (context, params) => const SegnalazioneNasoniWidget(),
            ),
            FFRoute(
              name: 'SegnalazioneBangla',
              path: 'segnalazioneBangla',
              builder: (context, params) => const SegnalazioneBanglaWidget(),
            ),
            FFRoute(
              name: 'impostazioniAccount',
              path: 'impostazioniAccount',
              builder: (context, params) => const ImpostazioniAccountWidget(),
            ),
            FFRoute(
              name: 'resetPassword',
              path: 'resetPassword',
              builder: (context, params) => const ResetPasswordWidget(),
            ),
            FFRoute(
              name: 'mappaDiscoteche',
              path: 'mappaDiscoteche',
              builder: (context, params) => const MappaDiscotecheWidget(),
            ),
            FFRoute(
              name: 'eventiHome',
              path: 'eventiHome',
              builder: (context, params) => const EventiHomeWidget(),
            ),
            FFRoute(
              name: 'Segnalazione',
              path: 'segnalazione',
              builder: (context, params) => const SegnalazioneWidget(),
            ),
            FFRoute(
              name: 'loadPage',
              path: 'loadPage',
              builder: (context, params) => const LoadPageWidget(),
            ),
            FFRoute(
              name: 'auth12',
              path: 'auth12',
              builder: (context, params) => const Auth12Widget(),
            ),
            FFRoute(
              name: 'mappaEventi',
              path: 'mappaEventi',
              builder: (context, params) => const MappaEventiWidget(),
            ),
            FFRoute(
              name: 'mappaMostre',
              path: 'mappaMostre',
              builder: (context, params) => const MappaMostreWidget(),
            ),
            FFRoute(
              name: 'prova',
              path: 'prova',
              builder: (context, params) => const ProvaWidget(),
            ),
            FFRoute(
              name: 'eventiList',
              path: 'eventiList',
              builder: (context, params) => const EventiListWidget(),
            ),
            FFRoute(
              name: 'discotecheList',
              path: 'discotecheList',
              builder: (context, params) => const DiscotecheListWidget(),
            ),
            FFRoute(
              name: 'concertiList',
              path: 'concertiList',
              builder: (context, params) => const ConcertiListWidget(),
            ),
            FFRoute(
              name: 'mostreList',
              path: 'mostreList',
              builder: (context, params) => const MostreListWidget(),
            ),
            FFRoute(
              name: 'evntiHome2',
              path: 'eventiHome2',
              builder: (context, params) => const EvntiHome2Widget(),
            ),
            FFRoute(
              name: 'concertoInEvidenzaProfile',
              path: 'concertoInEvidenzaProfile',
              builder: (context, params) => ConcertoInEvidenzaProfileWidget(
                concertoInEveidenzaRef: params.getParam(
                  'concertoInEveidenzaRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['concertiInEvidenza'],
                ),
              ),
            ),
            FFRoute(
              name: 'segnalazioneCibo',
              path: 'segnalazioneCibo',
              builder: (context, params) => const SegnalazioneCiboWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/eventiHome';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/LOGO_TONDO.png',
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
