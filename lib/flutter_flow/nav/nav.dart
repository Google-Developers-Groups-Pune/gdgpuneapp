import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

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

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const UserHomePageWidget()
          : const UserLoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const UserHomePageWidget()
              : const UserLoginPageWidget(),
          routes: [
            FFRoute(
              name: 'UserHomePage',
              path: 'userHomePage',
              requireAuth: true,
              builder: (context, params) => const UserHomePageWidget(),
            ),
            FFRoute(
              name: 'UserLoginPage',
              path: 'userLoginPage',
              builder: (context, params) => const UserLoginPageWidget(),
            ),
            FFRoute(
              name: 'UserQRCodeListPage',
              path: 'userQRCodeListPage',
              requireAuth: true,
              asyncParams: {
                'qrData': getDoc(['qr'], QrRecord.fromSnapshot),
              },
              builder: (context, params) => UserQRCodeListPageWidget(
                qrData: params.getParam(
                  'qrData',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'UserQRCodePage',
              path: 'userQRCodePage',
              requireAuth: true,
              builder: (context, params) => UserQRCodePageWidget(
                qrCodeData: params.getParam(
                  'qrCodeData',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ActivityPage',
              path: 'activityPage',
              requireAuth: true,
              builder: (context, params) => const ActivityPageWidget(),
            ),
            FFRoute(
              name: 'MenuPage',
              path: 'menuPage',
              requireAuth: true,
              builder: (context, params) => const MenuPageWidget(),
            ),
            FFRoute(
              name: 'eventDetailsPage',
              path: 'eventDetailsPage',
              requireAuth: true,
              builder: (context, params) => EventDetailsPageWidget(
                eventReference: params.getParam(
                  'eventReference',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['talk_details'],
                ),
              ),
            ),
            FFRoute(
              name: 'networkingPage',
              path: 'networkingPage',
              requireAuth: true,
              builder: (context, params) => const NetworkingPageWidget(),
            ),
            FFRoute(
              name: 'boothDetailsPage',
              path: 'boothDetailsPage',
              requireAuth: true,
              builder: (context, params) => BoothDetailsPageWidget(
                boothReference: params.getParam(
                  'boothReference',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['booths'],
                ),
              ),
            ),
            FFRoute(
              name: 'boothListPageV2',
              path: 'boothListPageV2',
              requireAuth: true,
              builder: (context, params) => const BoothListPageV2Widget(),
            ),
            FFRoute(
              name: 'scanQrPage',
              path: 'scanQrPage',
              requireAuth: true,
              builder: (context, params) => const ScanQrPageWidget(),
            ),
            FFRoute(
              name: 'qrScanner',
              path: 'qrScanner',
              requireAuth: true,
              builder: (context, params) => const QrScannerWidget(),
            ),
            FFRoute(
              name: 'searchPage',
              path: 'searchPage',
              requireAuth: true,
              builder: (context, params) => const SearchPageWidget(),
            ),
            FFRoute(
              name: 'notificationScreen',
              path: 'notificationScreen',
              requireAuth: true,
              builder: (context, params) => const NotificationScreenWidget(),
            ),
            FFRoute(
              name: 'agendaHomeScreen',
              path: 'agendaHomeScreen',
              requireAuth: true,
              builder: (context, params) => const AgendaHomeScreenWidget(),
            ),
            FFRoute(
              name: 'UserProfilePage',
              path: 'userProfilePage',
              requireAuth: true,
              builder: (context, params) => UserProfilePageWidget(
                userReference: params.getParam(
                  'userReference',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'UserProfilePageEdit',
              path: 'userProfilePageEdit',
              requireAuth: true,
              builder: (context, params) => UserProfilePageEditWidget(
                userReference: params.getParam(
                  'userReference',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'notification_page',
              path: 'notificationPage',
              requireAuth: true,
              builder: (context, params) => const NotificationPageWidget(),
            ),
            FFRoute(
              name: 'feedback_page',
              path: 'feedbackPage',
              requireAuth: true,
              builder: (context, params) => FeedbackPageWidget(
                userFeedback: params.getParam(
                  'userFeedback',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['feedbacks'],
                ),
              ),
            ),
            FFRoute(
              name: 'AboutGdgPune',
              path: 'aboutGdgPune',
              requireAuth: true,
              builder: (context, params) => const AboutGdgPuneWidget(),
            ),
            FFRoute(
              name: 'TeamPage',
              path: 'teamPage',
              requireAuth: true,
              builder: (context, params) => const TeamPageWidget(),
            ),
            FFRoute(
              name: 'addSpeakerPage',
              path: 'addSpeakerPage',
              builder: (context, params) => const AddSpeakerPageWidget(),
            ),
            FFRoute(
              name: 'addEventPage',
              path: 'addEventPage',
              builder: (context, params) => const AddEventPageWidget(),
            ),
            FFRoute(
              name: 'feedbackForm',
              path: 'feedbackForm',
              builder: (context, params) => const FeedbackFormWidget(),
            ),
            FFRoute(
              name: 'addDevfestTeam',
              path: 'addDevfestTeam',
              builder: (context, params) => const AddDevfestTeamWidget(),
            ),
            FFRoute(
              name: 'addActivityPage',
              path: 'addActivityPage',
              builder: (context, params) => const AddActivityPageWidget(),
            ),
            FFRoute(
              name: 'addBoothPage',
              path: 'addBoothPage',
              builder: (context, params) => const AddBoothPageWidget(),
            ),
            FFRoute(
              name: 'aboutGdgPage',
              path: 'aboutGdgPage',
              builder: (context, params) => const AboutGdgPageWidget(),
            ),
            FFRoute(
              name: 'qrcode_widget',
              path: 'qrcodeWidget',
              builder: (context, params) => QrcodeWidgetWidget(
                linkedInUrl: params.getParam(
                  'linkedInUrl',
                  ParamType.String,
                ),
              ),
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
            return '/userLoginPage';
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
              ? isWeb
                  ? Container()
                  : Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Image.asset(
                          'assets/images/DevFestLogo.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
              : page;

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
