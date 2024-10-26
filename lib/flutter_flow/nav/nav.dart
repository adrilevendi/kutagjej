import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/main.dart';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : WelcomeScreen1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : WelcomeScreen1Widget(),
          routes: [
            FFRoute(
              name: 'DetailedProfile',
              path: 'detailedProfile',
              asyncParams: {
                'chating': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => DetailedProfileWidget(
                userName: params.getParam(
                  'userName',
                  ParamType.String,
                ),
                chating: params.getParam(
                  'chating',
                  ParamType.Document,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'FavouriteProfs',
              path: 'favouriteProfs',
              asyncParams: {
                'favourites': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'FavouriteProfs')
                  : FavouriteProfsWidget(
                      favourites: params.getParam(
                        'favourites',
                        ParamType.Document,
                      ),
                      perdorus: params.getParam(
                        'perdorus',
                        ParamType.DocumentReference,
                        isList: false,
                        collectionNamePath: ['users'],
                      ),
                    ),
            ),
            FFRoute(
              name: 'Search',
              path: 'search',
              // builder: (context, params) => params.isEmpty
              //     ? NavBarPage(initialPage: 'Search')
              //     : SearchWidget(),
              builder: (context, params) => SearchWidget(),
            ),
            FFRoute(
              name: 'Motivation--5--',
              path: 'motivation5',
              builder: (context, params) => Motivation5Widget(),
            ),
            FFRoute(
              name: 'paymentConfirm',
              path: 'paymentConfirm',
              builder: (context, params) => PaymentConfirmWidget(),
            ),
            FFRoute(
              name: 'Auth1',
              path: 'auth1',
              builder: (context, params) => Auth1Widget(
                goToLogin: params.getParam(
                  'goToLogin',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'CheckoutForm',
              path: 'checkoutForm',
              builder: (context, params) => CheckoutFormWidget(),
            ),
            FFRoute(
              name: 'Messages',
              path: 'messages',
              asyncParams: {
                'chating': getDoc(['chats'], ChatsRecord.fromSnapshot),
                'users': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => MessagesWidget(
                chating: params.getParam(
                  'chating',
                  ParamType.Document,
                ),
                users: params.getParam(
                  'users',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'CHAT',
              path: 'chat',
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => ChatWidget(
                chat: params.getParam(
                  'chat',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'INCOMING-CALL',
              path: 'incomingCall',
              builder: (context, params) => IncomingCallWidget(),
            ),
            FFRoute(
              name: 'CALL',
              path: 'call',
              builder: (context, params) => CallWidget(),
            ),
            FFRoute(
              name: 'auth_2_ForgotPassword',
              path: 'auth2ForgotPassword',
              builder: (context, params) => Auth2ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'CreateProfile--4--',
              path: 'createProfile4',
              builder: (context, params) => CreateProfile4Widget(),
            ),
            FFRoute(
              name: 'Profile--1--',
              path: 'profile1',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Profile--1--')
                  : Profile1Widget(),
            ),
            FFRoute(
              name: 'EditProfile--2--',
              path: 'editProfile2',
              builder: (context, params) => EditProfile2Widget(),
            ),
            //  FFRoute(
            //   name: 'EditProfile',
            //   path: 'editProfile',
            //   builder: (context, params) => zz(),
            // ),
            FFRoute(
              name: 'CreateProfessionalAcc-3-',
              path: 'createProfessionalAcc3',
              builder: (context, params) => CreateProfessionalAcc3Widget(),
            ),
            FFRoute(
              name: 'CreateBusinessAccount',
              path: 'createBusinessAccount',
              builder: (context, params) => CreateBusinessAccountWidget(),
            ),
            FFRoute(
              name: 'SelectCategory-2-',
              path: 'selectCategory2',
              builder: (context, params) => SelectCategory2Widget(),
            ),
            FFRoute(
              name: 'WelcomeScreen-1-',
              path: 'welcomeScreen1',
              builder: (context, params) => WelcomeScreen1Widget(),
            ),
            FFRoute(
              name: 'ForgotPasswordConfirmation',
              path: 'forgotPasswordConfirmation',
              builder: (context, params) => ForgotPasswordConfirmationWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Home')
                  : HomeWidget(),
            ),
            FFRoute(
              name: 'testCreateUserPage',
              path: 'testCreateUserPage',
              builder: (context, params) => TestCreateUserPageWidget(),
            ),
            FFRoute(
              name: 'NjoftimePune2',
              path: 'njoftimePune2',
              builder: (context, params) => NjoftimePune2Widget(),
            ),
            FFRoute(
              name: 'NjoftimSingle',
              path: 'njoftimSingle',
              builder: (context, params) => NjoftimSingleWidget(
                postRef: params.getParam(
                  'postRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['post'],
                ),
              ),
            ),
            FFRoute(
              name: 'Plans',
              path: 'plans',
              builder: (context, params) => PlansWidget(),
            ),
            FFRoute(
              name: 'TransactionDetails',
              path: 'transactionDetails',
              builder: (context, params) => TransactionDetailsWidget(),
            ),
            FFRoute(
              name: 'SendMedia',
              path: 'sendMedia',
              builder: (context, params) => SendMediaWidget(
                media: params.getParam(
                  'media',
                  ParamType.FFUploadedFile,
                ),
                chat: params.getParam(
                  'chat',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chats'],
                ),
              ),
            ),
            FFRoute(
              name: 'ViewMedia',
              path: 'viewMedia',
              builder: (context, params) => ViewMediaWidget(),
            ),
            FFRoute(
              name: 'List11Messages',
              path: 'list11Messages',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'List11Messages')
                  : List11MessagesWidget(),
            ),
            FFRoute(
              name: 'NewNjoftim',
              path: 'newNjoftim',
              builder: (context, params) => NewNjoftimWidget(),
            ),
            FFRoute(
              name: 'testCheckout',
              path: 'testCheckout',
              asyncParams: {
                'post': getDoc(['post'], PostRecord.fromSnapshot),
              },
              builder: (context, params) => TestCheckoutWidget(
                post: params.getParam(
                  'post',
                  ParamType.Document,
                ),
                amount: params.getParam(
                  'amount',
                  ParamType.double,
                ),
              ),
            ),
            FFRoute(
              name: 'Affiliate',
              path: 'affiliate',
              builder: (context, params) => AffiliateWidget(),
            ),
            FFRoute(
              name: 'CreateReferal',
              path: 'createReferal',
              builder: (context, params) => CreateReferalWidget(),
            ),
            FFRoute(
              name: 'Createreferal2',
              path: 'createreferal2',
              builder: (context, params) => Createreferal2Widget(),
            ),
            FFRoute(
              name: 'Billing',
              path: 'billing',
              builder: (context, params) => BillingWidget(),
            ),
            FFRoute(
              name: 'newCard',
              path: 'newCard',
              builder: (context, params) => NewCardWidget(),
            ),
            FFRoute(
              name: 'Login1',
              path: 'login1',
              builder: (context, params) => Login1Widget(),
            ),
            FFRoute(
              name: 'Checkout37',
              path: 'checkout37',
              builder: (context, params) => Checkout37Widget(),
            ),
            FFRoute(
              name: 'profilePostsList',
              path: 'profilePostsList',
              builder: (context, params) => ProfilePostsListWidget(),
            ),
            FFRoute(
              name: 'editNjoftim',
              path: 'editNjoftim',
              builder: (context, params) => EditNjoftimWidget(
                postToEdit: params.getParam(
                    'postToEdit', ParamType.DocumentReference,
                    isList: false, collectionNamePath: ['post']),
              ),
            ),
            FFRoute(
              name: 'freeTrial',
              path: 'freeTrial',
              builder: (context, params) => FreeTrialWidget(),
            ),
            FFRoute(
              name: 'store',
              path: 'store',
              builder: (context, params) => StoreWidget(),
            ),
            FFRoute(
              name: 'real_estate',
              path: 'real_estate',
              builder: (context, params) => RealEstateWidget(),
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
            return '/welcomeScreen1';
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
                  color: const Color.fromRGBO(70, 196, 86, 1),
                  child: Image.asset(
                    'assets/images/splash2.gif',
                    fit: BoxFit.contain,
                    // width: 100,
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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
