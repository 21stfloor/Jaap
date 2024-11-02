import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

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

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn
            ? RedirectionWidget()
            : AuthWelcomeScreenWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? RedirectionWidget()
              : AuthWelcomeScreenWidget(),
        ),
        FFRoute(
          name: 'auth_WelcomeScreen',
          path: '/authWelcomeScreen',
          builder: (context, params) => AuthWelcomeScreenWidget(),
        ),
        FFRoute(
          name: 'auth_CreateApplicant',
          path: '/authCreateApplicant',
          builder: (context, params) => AuthCreateApplicantWidget(
            role: params.getParam(
              'role',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'auth_Login',
          path: '/authLogin',
          builder: (context, params) => AuthLoginWidget(),
        ),
        FFRoute(
          name: 'auth_ForgotPassword',
          path: '/authForgotPassword',
          builder: (context, params) => AuthForgotPasswordWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'adminVideos',
          path: '/adminVideos',
          requireAuth: true,
          builder: (context, params) => AdminVideosWidget(),
        ),
        FFRoute(
          name: 'adminpayments',
          path: '/adminpayments',
          requireAuth: true,
          builder: (context, params) => AdminpaymentsWidget(),
        ),
        FFRoute(
          name: 'JobPostCreate',
          path: '/jobPostCreate',
          requireAuth: true,
          builder: (context, params) => JobPostCreateWidget(),
        ),
        FFRoute(
          name: 'auth_CreateAgency',
          path: '/authCreateAgency',
          builder: (context, params) => AuthCreateAgencyWidget(
            role: params.getParam(
              'role',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'JobList',
          path: '/jobList',
          builder: (context, params) => JobListWidget(),
        ),
        FFRoute(
          name: 'ProfileApplicant',
          path: '/profileApplicant',
          requireAuth: true,
          builder: (context, params) => ProfileApplicantWidget(),
        ),
        FFRoute(
          name: 'ProfileAgency',
          path: '/profileAgency',
          requireAuth: true,
          builder: (context, params) => ProfileAgencyWidget(),
        ),
        FFRoute(
          name: 'ListofApplicants',
          path: '/listofApplicants',
          requireAuth: true,
          builder: (context, params) => ListofApplicantsWidget(),
        ),
        FFRoute(
          name: 'joblistPostedByAgency',
          path: '/joblistPostedByAgency',
          requireAuth: true,
          builder: (context, params) => JoblistPostedByAgencyWidget(),
        ),
        FFRoute(
          name: 'redirection',
          path: '/redirection',
          requireAuth: true,
          builder: (context, params) => RedirectionWidget(),
        ),
        FFRoute(
          name: 'editprofileapplicant',
          path: '/editprofileapplicant',
          requireAuth: true,
          builder: (context, params) => EditprofileapplicantWidget(),
        ),
        FFRoute(
          name: 'jobPostPreviewPage',
          path: '/jobPostPreviewPage',
          asyncParams: {
            'jobPost': getDoc(['Job'], JobRecord.fromSnapshot),
          },
          builder: (context, params) => JobPostPreviewPageWidget(
            jobPost: params.getParam(
              'jobPost',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'videoPage',
          path: '/videoPage',
          requireAuth: true,
          builder: (context, params) => VideoPageWidget(),
        ),
        FFRoute(
          name: 'pendingPage',
          path: '/pendingPage',
          requireAuth: true,
          builder: (context, params) => PendingPageWidget(),
        ),
        FFRoute(
          name: 'communityPage',
          path: '/communityPage',
          requireAuth: true,
          builder: (context, params) => CommunityPageWidget(),
        ),
        FFRoute(
          name: 'createPost',
          path: '/createPost',
          requireAuth: true,
          builder: (context, params) => CreatePostWidget(),
        ),
        FFRoute(
          name: 'AdminVideoPostCreate',
          path: '/adminVideoPostCreate',
          requireAuth: true,
          builder: (context, params) => AdminVideoPostCreateWidget(),
        ),
        FFRoute(
          name: 'JobPostEdit',
          path: '/jobPostEdit',
          requireAuth: true,
          asyncParams: {
            'jobToEdit': getDoc(['Job'], JobRecord.fromSnapshot),
          },
          builder: (context, params) => JobPostEditWidget(
            jobToEdit: params.getParam(
              'jobToEdit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_mainApplicant',
          path: '/chat2MainApplicant',
          requireAuth: true,
          builder: (context, params) => Chat2MainApplicantWidget(),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          requireAuth: true,
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'editprofileAgency',
          path: '/editprofileAgency',
          requireAuth: true,
          builder: (context, params) => EditprofileAgencyWidget(),
        ),
        FFRoute(
          name: 'adminApplicants',
          path: '/adminApplicants',
          requireAuth: true,
          builder: (context, params) => AdminApplicantsWidget(),
        ),
        FFRoute(
          name: 'adminAgencies',
          path: '/adminAgencies',
          requireAuth: true,
          builder: (context, params) => AdminAgenciesWidget(),
        ),
        FFRoute(
          name: 'adminSubscriptions',
          path: '/adminSubscriptions',
          requireAuth: true,
          builder: (context, params) => AdminSubscriptionsWidget(),
        ),
        FFRoute(
          name: 'adminSettings',
          path: '/adminSettings',
          requireAuth: true,
          builder: (context, params) => AdminSettingsWidget(),
        ),
        FFRoute(
          name: 'editPost',
          path: '/editPost',
          requireAuth: true,
          asyncParams: {
            'postToEdit': getDoc(['users', 'post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => EditPostWidget(
            postToEdit: params.getParam(
              'postToEdit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_mainAgency',
          path: '/chat2MainAgency',
          requireAuth: true,
          builder: (context, params) => Chat2MainAgencyWidget(),
        ),
        FFRoute(
          name: 'AdminVideosPostEdit',
          path: '/adminVideosPostEdit',
          requireAuth: true,
          asyncParams: {
            'videoToEdit': getDoc(['VideoPost'], VideoPostRecord.fromSnapshot),
          },
          builder: (context, params) => AdminVideosPostEditWidget(
            videoToEdit: params.getParam(
              'videoToEdit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'communityPageAgency',
          path: '/communityPageAgency',
          requireAuth: true,
          builder: (context, params) => CommunityPageAgencyWidget(),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          requireAuth: true,
          builder: (context, params) => DashboardWidget(),
        ),
        FFRoute(
          name: 'chat_2_DetailsAgency',
          path: '/chat2DetailsAgency',
          requireAuth: true,
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
            'jobPost': getDoc(['Job'], JobRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsAgencyWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
            jobPost: params.getParam(
              'jobPost',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_DetailsApplicant',
          path: '/chat2DetailsApplicant',
          requireAuth: true,
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
            'job': getDoc(['Job'], JobRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsApplicantWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
            job: params.getParam(
              'job',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'notificationApplicantPage',
          path: '/notificationApplicantPage',
          requireAuth: true,
          builder: (context, params) => NotificationApplicantPageWidget(),
        ),
        FFRoute(
          name: 'notificationAgencyPage',
          path: '/notificationAgencyPage',
          requireAuth: true,
          builder: (context, params) => NotificationAgencyPageWidget(),
        ),
        FFRoute(
          name: 'deployedlistByAgency',
          path: '/deployedlistByAgency',
          requireAuth: true,
          builder: (context, params) => DeployedlistByAgencyWidget(),
        ),
        FFRoute(
          name: 'jobHistory',
          path: '/jobHistory',
          requireAuth: true,
          builder: (context, params) => JobHistoryWidget(),
        ),
        FFRoute(
          name: 'employingHistory',
          path: '/employingHistory',
          requireAuth: true,
          builder: (context, params) => EmployingHistoryWidget(),
        ),
        FFRoute(
          name: 'notificationAdmin',
          path: '/notificationAdmin',
          requireAuth: true,
          builder: (context, params) => NotificationAdminWidget(),
        )
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
            return '/authWelcomeScreen';
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
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      child: Center(
                        child: Image.asset(
                          'assets/images/449886094_857317443192678_3985085505549334033_n_(1).jpg',
                          width: 180.0,
                          height: MediaQuery.sizeOf(context).height * 1.8,
                          fit: BoxFit.contain,
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

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.scale,
        alignment: Alignment.bottomCenter,
        duration: Duration(milliseconds: 300),
      );
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
