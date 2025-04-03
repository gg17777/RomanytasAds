import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: RootPageContext.wrap(
          appStateNotifier.loggedIn
              ? entryPage ?? LoadPageLoggedInWidget()
              : LoadPageLoggedOutWidget(),
          errorRoute: state.uri.toString(),
        ),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn
                ? entryPage ?? LoadPageLoggedInWidget()
                : LoadPageLoggedOutWidget(),
          ),
          routes: [
            FFRoute(
              name: NasoniMapWidget.routeName,
              path: NasoniMapWidget.routePath,
              builder: (context, params) => NasoniMapWidget(),
            ),
            FFRoute(
              name: EventiProfileWidget.routeName,
              path: EventiProfileWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EventiProfileWidget(
                eventoRef: params.getParam(
                  'eventoRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                goBack: params.getParam(
                  'goBack',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ConcertoProfileWidget.routeName,
              path: ConcertoProfileWidget.routePath,
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
              name: BanglaMapWidget.routeName,
              path: BanglaMapWidget.routePath,
              builder: (context, params) => BanglaMapWidget(),
            ),
            FFRoute(
              name: CiboMapWidget.routeName,
              path: CiboMapWidget.routePath,
              builder: (context, params) => CiboMapWidget(),
            ),
            FFRoute(
              name: ProfiloWidget.routeName,
              path: ProfiloWidget.routePath,
              builder: (context, params) => ProfiloWidget(),
            ),
            FFRoute(
              name: SegnalazioneNasoniWidget.routeName,
              path: SegnalazioneNasoniWidget.routePath,
              builder: (context, params) => SegnalazioneNasoniWidget(),
            ),
            FFRoute(
              name: SegnalazioneBanglaWidget.routeName,
              path: SegnalazioneBanglaWidget.routePath,
              builder: (context, params) => SegnalazioneBanglaWidget(),
            ),
            FFRoute(
              name: ModifyDataProfileWidget.routeName,
              path: ModifyDataProfileWidget.routePath,
              builder: (context, params) => ModifyDataProfileWidget(),
            ),
            FFRoute(
              name: ResetPasswordWidget.routeName,
              path: ResetPasswordWidget.routePath,
              builder: (context, params) => ResetPasswordWidget(),
            ),
            FFRoute(
              name: EventiHomeWidget.routeName,
              path: EventiHomeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EventiHomeWidget(),
            ),
            FFRoute(
              name: SegnalazioneWidget.routeName,
              path: SegnalazioneWidget.routePath,
              builder: (context, params) => SegnalazioneWidget(),
            ),
            FFRoute(
              name: LoadPageLoggedInWidget.routeName,
              path: LoadPageLoggedInWidget.routePath,
              builder: (context, params) => LoadPageLoggedInWidget(),
            ),
            FFRoute(
              name: MapEventsWidget.routeName,
              path: MapEventsWidget.routePath,
              builder: (context, params) => MapEventsWidget(),
            ),
            FFRoute(
              name: EventiListHomeWidget.routeName,
              path: EventiListHomeWidget.routePath,
              builder: (context, params) => EventiListHomeWidget(),
            ),
            FFRoute(
              name: ConcertiListWidget.routeName,
              path: ConcertiListWidget.routePath,
              builder: (context, params) => ConcertiListWidget(),
            ),
            FFRoute(
              name: SegnalazioneCiboWidget.routeName,
              path: SegnalazioneCiboWidget.routePath,
              builder: (context, params) => SegnalazioneCiboWidget(),
            ),
            FFRoute(
              name: FriendsMapWidget.routeName,
              path: FriendsMapWidget.routePath,
              builder: (context, params) => FriendsMapWidget(),
            ),
            FFRoute(
              name: SearchPageWidget.routeName,
              path: SearchPageWidget.routePath,
              builder: (context, params) => SearchPageWidget(),
            ),
            FFRoute(
              name: FriendsRequestsWidget.routeName,
              path: FriendsRequestsWidget.routePath,
              builder: (context, params) => FriendsRequestsWidget(),
            ),
            FFRoute(
              name: FriendsRequestsAllWidget.routeName,
              path: FriendsRequestsAllWidget.routePath,
              builder: (context, params) => FriendsRequestsAllWidget(),
            ),
            FFRoute(
              name: FriendsSuggestionsWidget.routeName,
              path: FriendsSuggestionsWidget.routePath,
              builder: (context, params) => FriendsSuggestionsWidget(),
            ),
            FFRoute(
              name: FriendsListWidget.routeName,
              path: FriendsListWidget.routePath,
              builder: (context, params) => FriendsListWidget(),
            ),
            FFRoute(
              name: NewPhotoProfileWidget.routeName,
              path: NewPhotoProfileWidget.routePath,
              builder: (context, params) => NewPhotoProfileWidget(),
            ),
            FFRoute(
              name: MappaEventiFriendsWidget.routeName,
              path: MappaEventiFriendsWidget.routePath,
              builder: (context, params) => MappaEventiFriendsWidget(),
            ),
            FFRoute(
              name: SynchroniseContactsWidget.routeName,
              path: SynchroniseContactsWidget.routePath,
              builder: (context, params) => SynchroniseContactsWidget(),
            ),
            FFRoute(
              name: ContactsBulkSentWidget.routeName,
              path: ContactsBulkSentWidget.routePath,
              asyncParams: {
                'users': getDocList(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ContactsBulkSentWidget(
                users: params.getParam<UsersRecord>(
                  'users',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: UserProfileSearchedWidget.routeName,
              path: UserProfileSearchedWidget.routePath,
              builder: (context, params) => UserProfileSearchedWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: ContactsPageWidget.routeName,
              path: ContactsPageWidget.routePath,
              builder: (context, params) => ContactsPageWidget(),
            ),
            FFRoute(
              name: UserPhoneWidget.routeName,
              path: UserPhoneWidget.routePath,
              builder: (context, params) => UserPhoneWidget(),
            ),
            FFRoute(
              name: MissingDetailsPageWidget.routeName,
              path: MissingDetailsPageWidget.routePath,
              builder: (context, params) => MissingDetailsPageWidget(),
            ),
            FFRoute(
              name: SynchroniseContactsAgainWidget.routeName,
              path: SynchroniseContactsAgainWidget.routePath,
              builder: (context, params) => SynchroniseContactsAgainWidget(),
            ),
            FFRoute(
              name: VideoEventWidget.routeName,
              path: VideoEventWidget.routePath,
              builder: (context, params) => VideoEventWidget(
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
              ),
            ),
            FFRoute(
              name: ChooseCityWidget.routeName,
              path: ChooseCityWidget.routePath,
              builder: (context, params) => ChooseCityWidget(),
            ),
            FFRoute(
              name: LoadPageLoggedOutWidget.routeName,
              path: LoadPageLoggedOutWidget.routePath,
              builder: (context, params) => LoadPageLoggedOutWidget(),
            ),
            FFRoute(
              name: TestWidget.routeName,
              path: TestWidget.routePath,
              builder: (context, params) => TestWidget(),
            ),
            FFRoute(
              name: SwipeUsersWidget.routeName,
              path: SwipeUsersWidget.routePath,
              builder: (context, params) => SwipeUsersWidget(
                eventId: params.getParam(
                  'eventId',
                  ParamType.String,
                ),
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                eventName: params.getParam(
                  'eventName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SettingsWidget.routeName,
              path: SettingsWidget.routePath,
              builder: (context, params) => SettingsWidget(),
            ),
            FFRoute(
              name: PrivacyAccountWidget.routeName,
              path: PrivacyAccountWidget.routePath,
              builder: (context, params) => PrivacyAccountWidget(),
            ),
            FFRoute(
              name: MainMatchesPageWidget.routeName,
              path: MainMatchesPageWidget.routePath,
              builder: (context, params) => MainMatchesPageWidget(),
            ),
            FFRoute(
              name: ParticipatingListEvent100Widget.routeName,
              path: ParticipatingListEvent100Widget.routePath,
              requireAuth: true,
              asyncParams: {
                'eventDoc': getDoc(['Eventi'], EventiRecord.fromSnapshot),
              },
              builder: (context, params) => ParticipatingListEvent100Widget(
                eventoRef: params.getParam(
                  'eventoRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                blink: params.getParam(
                  'blink',
                  ParamType.bool,
                ),
                eventName: params.getParam(
                  'eventName',
                  ParamType.String,
                ),
                eventDoc: params.getParam(
                  'eventDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: FilterSwipesWidget.routeName,
              path: FilterSwipesWidget.routePath,
              asyncParams: {
                'participatingDocs': getDocList(
                    ['Eventi', 'eventiParticiapting'],
                    EventiParticiaptingRecord.fromSnapshot),
              },
              builder: (context, params) => FilterSwipesWidget(
                eventId: params.getParam(
                  'eventId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                participatingDocs: params.getParam<EventiParticiaptingRecord>(
                  'participatingDocs',
                  ParamType.Document,
                  isList: true,
                ),
                eventName: params.getParam(
                  'eventName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EditFiltersSwipesWidget.routeName,
              path: EditFiltersSwipesWidget.routePath,
              builder: (context, params) => EditFiltersSwipesWidget(),
            ),
            FFRoute(
              name: TutorialSwipeWidget.routeName,
              path: TutorialSwipeWidget.routePath,
              asyncParams: {
                'participatingDocs': getDocList(
                    ['Eventi', 'eventiParticiapting'],
                    EventiParticiaptingRecord.fromSnapshot),
              },
              builder: (context, params) => TutorialSwipeWidget(
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                blink: params.getParam(
                  'blink',
                  ParamType.bool,
                ),
                participatingDocs: params.getParam<EventiParticiaptingRecord>(
                  'participatingDocs',
                  ParamType.Document,
                  isList: true,
                ),
                eventName: params.getParam(
                  'eventName',
                  ParamType.String,
                ),
                eventType: params.getParam(
                  'eventType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TutorialParticipateWidget.routeName,
              path: TutorialParticipateWidget.routePath,
              asyncParams: {
                'eventDoc': getDoc(['Eventi'], EventiRecord.fromSnapshot),
              },
              builder: (context, params) => TutorialParticipateWidget(
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                outOrIn: params.getParam(
                  'outOrIn',
                  ParamType.String,
                ),
                eventType: params.getParam(
                  'eventType',
                  ParamType.String,
                ),
                eventDoc: params.getParam(
                  'eventDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: BlockedUsersWidget.routeName,
              path: BlockedUsersWidget.routePath,
              builder: (context, params) => BlockedUsersWidget(),
            ),
            FFRoute(
              name: PrivacyPolicyWidget.routeName,
              path: PrivacyPolicyWidget.routePath,
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: PrivacyPolicyPopUpWidget.routeName,
              path: PrivacyPolicyPopUpWidget.routePath,
              builder: (context, params) => PrivacyPolicyPopUpWidget(),
            ),
            FFRoute(
              name: Prova2Widget.routeName,
              path: Prova2Widget.routePath,
              builder: (context, params) => Prova2Widget(
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                eventId: params.getParam(
                  'eventId',
                  ParamType.String,
                ),
                eventName: params.getParam(
                  'eventName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SecretPartiesHomeWidget.routeName,
              path: SecretPartiesHomeWidget.routePath,
              builder: (context, params) => SecretPartiesHomeWidget(),
            ),
            FFRoute(
              name: CreateSecretPartyWidget.routeName,
              path: CreateSecretPartyWidget.routePath,
              builder: (context, params) => CreateSecretPartyWidget(),
            ),
            FFRoute(
              name: SecretPartyRecapWidget.routeName,
              path: SecretPartyRecapWidget.routePath,
              builder: (context, params) => SecretPartyRecapWidget(),
            ),
            FFRoute(
              name: SwipeUsersCopyWidget.routeName,
              path: SwipeUsersCopyWidget.routePath,
              builder: (context, params) => SwipeUsersCopyWidget(
                eventId: params.getParam(
                  'eventId',
                  ParamType.String,
                ),
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                eventName: params.getParam(
                  'eventName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyPhotosWidget.routeName,
              path: MyPhotosWidget.routePath,
              builder: (context, params) => MyPhotosWidget(
                eventId: params.getParam(
                  'eventId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: NotificationsSettingsWidget.routeName,
              path: NotificationsSettingsWidget.routePath,
              builder: (context, params) => NotificationsSettingsWidget(),
            ),
            FFRoute(
              name: MyEventsWidget.routeName,
              path: MyEventsWidget.routePath,
              builder: (context, params) => MyEventsWidget(),
            ),
            FFRoute(
              name: PastParticipantsEventsWidget.routeName,
              path: PastParticipantsEventsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => PastParticipantsEventsWidget(
                eventoRef: params.getParam(
                  'eventoRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
              ),
            ),
            FFRoute(
              name: PhotoWidget.routeName,
              path: PhotoWidget.routePath,
              builder: (context, params) => PhotoWidget(
                photoRef: params.getParam(
                  'photoRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi', 'photos_event'],
                ),
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                numUsersInPhoto: params.getParam(
                  'numUsersInPhoto',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: LogInWidget.routeName,
              path: LogInWidget.routePath,
              builder: (context, params) => LogInWidget(),
            ),
            FFRoute(
              name: CreateAccountWidget.routeName,
              path: CreateAccountWidget.routePath,
              builder: (context, params) => CreateAccountWidget(),
            ),
            FFRoute(
              name: ModifyEmailWidget.routeName,
              path: ModifyEmailWidget.routePath,
              builder: (context, params) => ModifyEmailWidget(),
            ),
            FFRoute(
              name: ModifyNameWidget.routeName,
              path: ModifyNameWidget.routePath,
              builder: (context, params) => ModifyNameWidget(),
            ),
            FFRoute(
              name: ModifyBioWidget.routeName,
              path: ModifyBioWidget.routePath,
              builder: (context, params) => ModifyBioWidget(),
            ),
            FFRoute(
              name: NameLastnamePhotoWidget.routeName,
              path: NameLastnamePhotoWidget.routePath,
              builder: (context, params) => NameLastnamePhotoWidget(),
            ),
            FFRoute(
              name: ModifyUniWidget.routeName,
              path: ModifyUniWidget.routePath,
              builder: (context, params) => ModifyUniWidget(),
            ),
            FFRoute(
              name: DrinkSaltafilaWidget.routeName,
              path: DrinkSaltafilaWidget.routePath,
              builder: (context, params) => DrinkSaltafilaWidget(
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
              ),
            ),
            FFRoute(
              name: EventiProfileLogOutWidget.routeName,
              path: EventiProfileLogOutWidget.routePath,
              builder: (context, params) => EventiProfileLogOutWidget(
                eventoRef: params.getParam(
                  'eventoRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
                goBack: params.getParam(
                  'goBack',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ManagerProfileWidget.routeName,
              path: ManagerProfileWidget.routePath,
              builder: (context, params) => ManagerProfileWidget(
                managerRef: params.getParam(
                  'managerRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: FriendsListUserWidget.routeName,
              path: FriendsListUserWidget.routePath,
              builder: (context, params) => FriendsListUserWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: AllMatchesWidget.routeName,
              path: AllMatchesWidget.routePath,
              builder: (context, params) => AllMatchesWidget(),
            ),
            FFRoute(
              name: AllLikesWidget.routeName,
              path: AllLikesWidget.routePath,
              builder: (context, params) => AllLikesWidget(),
            ),
            FFRoute(
              name: AllFriendsRequestsWidget.routeName,
              path: AllFriendsRequestsWidget.routePath,
              builder: (context, params) => AllFriendsRequestsWidget(),
            ),
            FFRoute(
              name: EventiHomeLogOutWidget.routeName,
              path: EventiHomeLogOutWidget.routePath,
              builder: (context, params) => EventiHomeLogOutWidget(),
            ),
            FFRoute(
              name: BuyTicketWidget.routeName,
              path: BuyTicketWidget.routePath,
              builder: (context, params) => BuyTicketWidget(
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Eventi'],
                ),
              ),
            ),
            FFRoute(
              name: MyEventsCopyWidget.routeName,
              path: MyEventsCopyWidget.routePath,
              builder: (context, params) => MyEventsCopyWidget(),
            ),
            FFRoute(
              name: ProvaWidget.routeName,
              path: ProvaWidget.routePath,
              builder: (context, params) => ProvaWidget(),
            ),
            FFRoute(
              name: UpdateImgWidget.routeName,
              path: UpdateImgWidget.routePath,
              builder: (context, params) => UpdateImgWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
            return '/loadPageLoggedOut';
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
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Untitled_design_(52).png',
                      width: 175.0,
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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

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

    String? location;

    /*
    Handle `links` routes that have dynamic-link entangled with deep-link 
    */
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.queryParameters.containsKey('deep_link_id')) {
      final deepLinkId = widget.state.uri.queryParameters['deep_link_id'];
      if (deepLinkId != null) {
        final deepLinkUri = Uri.parse(deepLinkId);
        final link = deepLinkUri.toString();
        final host = deepLinkUri.host;
        location = link.split(host).last;
      }
    }

    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      location = '/';
    }

    if (location != null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => context.go(location!));
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
