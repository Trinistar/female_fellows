import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/CategoriesCubit/categories_cubit.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/blocs/FavoritesBloc/favorites_bloc.dart';
import 'package:vs_femalefellows/blocs/OnboardingBloc/onboarding_bloc.dart';
import 'package:vs_femalefellows/blocs/SignedupEvent/signedup_event_bloc.dart';
import 'package:vs_femalefellows/blocs/TandemBloc/tandem_bloc.dart';
import 'package:vs_femalefellows/blocs/TandemOnboardingBloc/tandem_onboarding_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/AfterTandem/matched_tandem.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login_page.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_entry.dart';
import 'package:vs_femalefellows/pages/Chat/chatentry.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/create_event.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_detail_page.dart';
import 'package:vs_femalefellows/pages/Event/EventOverview/event_overview.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_entry.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_success.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_not_authenticated.dart';
import 'package:vs_femalefellows/pages/Event/UpdateEvent/event_update.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_start.dart';
import 'package:vs_femalefellows/pages/Profil/profile.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_onboarding_entry.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';
import 'package:vs_femalefellows/pages/ToolBarNavigation/navigation_page.dart';
import 'package:vs_femalefellows/provider/firestore/authrepository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_user_profile_repository.dart';

import 'provider/firebase_options.dart';

final AuthRepository authenticationRepository = AuthRepository();
final FirestoreEventRepository firestoreEventRepository =
    FirestoreEventRepository();
final FirestoreUserProfileRepository firestoreUserprofileRepository =
    FirestoreUserProfileRepository();

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _tandemTabNavigatorKey = GlobalKey<NavigatorState>();
final _eventTabNavigatorKey = GlobalKey<NavigatorState>();
final _homeTabNavigatorKey = GlobalKey<NavigatorState>();
final _profileTabNavigatorKey = GlobalKey<NavigatorState>();
final _chatTabNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final GoRoute _loginTree = GoRoute(
  path: 'loginPage',
  parentNavigatorKey: _rootNavigatorKey,
  builder: (BuildContext context, GoRouterState state) {
    return const LoginPage();
  },
  routes: [
    GoRoute(
      path: 'registrationPage',
      builder: (BuildContext context, GoRouterState state) {
        return const RegistrationEntry();
      },
    ),
  ],
);

/// The route configuration.
final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      redirect: (context, state) {
        if (context.read<AuthenticationBloc>().state is! AuthenticatedUser) {
          return '/loginPage';
        } else {
          return null;
        }
      },
      path: '/loginPage',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: [
        GoRoute(
          path: 'registrationPage',
          builder: (BuildContext context, GoRouterState state) {
            return const RegistrationEntry();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/registrationPage',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const RegistrationEntry();
      },
    ),
    GoRoute(
      path: '/eventNotAuthenticated',
      builder: (BuildContext context, GoRouterState state) {
        return EventNotAuthenticatedState();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
        // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
        return BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            if (state is IsOnboardingState) {
              return OnboardingPage();
            } else {
              return TabBarNavigation(navigationShell: navigationShell);
            }
          },
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _tandemTabNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/tandem',
              builder: (BuildContext context, GoRouterState state) =>
                  const Tandementry(),
              routes: [
                GoRoute(
                  path: 'tandemOnboarding',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const TandemOnboardingEntry();
                  },
                ),
                GoRoute(
                  path: 'eventNotAuthenticated',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return EventNotAuthenticatedState();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _eventTabNavigatorKey,
          // Add this branch routes
          // each routes with its sub routes if available e.g feed/uuid/details
          routes: <RouteBase>[
            GoRoute(
              path: '/events',
              builder: (BuildContext context, GoRouterState state) =>
                  const EventOverview(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'detailEvent/:id',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) =>
                      DetailEvent(eventId: state.pathParameters['id']!),
                  routes: [
                    GoRoute(
                      redirect: (context, state) {
                        if (context.read<AuthenticationBloc>().state
                            is AuthenticatedUser) {
                          return 'detailEvent/:id';
                        } else {
                          return null;
                        }
                      },
                      path: 'eventNotAuthenticated',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return EventNotAuthenticatedState();
                      },
                    ),
                    GoRoute(
                      path: 'eventOnboarding',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return Evententry(event: state.extra as Event);
                      },
                      routes: [
                        GoRoute(
                          path: 'eventRegisterSuccess',
                          parentNavigatorKey: _rootNavigatorKey,
                          builder: (BuildContext context, GoRouterState state) {
                            return EventSuccess(event: state.extra as Event);
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'updateEvent',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return UpdateEvent(eventState: state.extra as Event);
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: 'createEvent',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) =>
                      CreateEvent(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) =>
                  const Home(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileTabNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              /* redirect: (context, state) {
                if (BlocProvider.of<AuthenticationBloc>(context).state is AuthenticatedUser) {
                  return '/profile';
                } else {
                  return null;
                }
              }, */
              path: '/profile',
              builder: (BuildContext context, GoRouterState state) =>
                  const Profile(),
              routes: [
                GoRoute(
                  path: 'registrationPage',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const RegistrationEntry();
                  },
                ),
                GoRoute(
                  path: 'loginPage',
                  builder: (BuildContext context, GoRouterState state) {
                    return const LoginPage();
                  },
                ),
              ],
            ),
          ],
        ),
       
        StatefulShellBranch(
          navigatorKey: _chatTabNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/chat',
              builder: (BuildContext context, GoRouterState state) =>
     ///********************************* CHANGE ROUTE TO CHATENTRY  **************************************************************///
                  const AfterTandem(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
              authenticationRepository: authenticationRepository),
          lazy: false,
        ),
        BlocProvider(
            create: (BuildContext context) =>
                EventBloc(firestoreEventRepository)),
        BlocProvider<FavoritesBloc>(
          create: (BuildContext context) =>
              FavoritesBloc(BlocProvider.of<AuthenticationBloc>(context)),
          lazy: false,
        ),
        /* BlocProvider<FavoriteEventStore>(
          lazy: false,
          create: (BuildContext context) => FavoriteEventStore(BlocProvider.of<AuthenticationBloc>(context)),
        ), */
        BlocProvider<SignedupEventsBloc>(
          lazy: false,
          create: (BuildContext context) =>
              SignedupEventsBloc(BlocProvider.of<AuthenticationBloc>(context)),
        ),
        /* BlocProvider<SubscribedEventsStore>(
          lazy: false,
          create: (BuildContext context) => SubscribedEventsStore(BlocProvider.of<AuthenticationBloc>(context)),
        ), */
        BlocProvider<AllEventsStore>(
          lazy: false,
          create: (BuildContext context) => AllEventsStore(),
        ),
        BlocProvider<CategoryCubit>(
          lazy: false,
          create: (BuildContext context) => CategoryCubit(),
        ),
        BlocProvider<OnboardingBloc>(
          lazy: false,
          create: (BuildContext context) =>
              OnboardingBloc(BlocProvider.of<AuthenticationBloc>(context)),
        ),
        BlocProvider<TandemOnboardingBloc>(
          lazy: false,
          create: (BuildContext context) => TandemOnboardingBloc(
              BlocProvider.of<AuthenticationBloc>(context)),
        ),
        BlocProvider<TandemBloc>(
          create: (BuildContext context) => TandemBloc(
              firestoreUserprofileRepository,
              BlocProvider.of<AuthenticationBloc>(context)),
          lazy: false,
        ),
        /* RepositoryProvider(
          create: (context) => AuthRepository(),
          child: LoginPage(),
        ) */
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('de'), // Deutsch
        ],
        theme: ThemeData(
          /* appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light
            )
          ), */
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(27, 25, 68, 1),
              primary: Color.fromRGBO(27, 25, 68, 1),
              secondary: Color.fromRGBO(252, 208, 220, 1),
              surface: Color.fromRGBO(242, 242, 242, 1),
              surfaceVariant: Color.fromRGBO(236, 240, 243, 1),
              tertiary: Color.fromRGBO(106, 104, 206, 1),
              onTertiary: Color.fromRGBO(241, 80, 60, 1)),
          textTheme: TextTheme(
            titleSmall: TextStyle(
              color: Color.fromRGBO(59, 57, 102, 1),
            ),
            titleLarge: TextStyle(
              color: Color.fromRGBO(59, 57, 102, 1),
            ),
            bodyLarge: TextStyle(
              color: Color.fromRGBO(59, 57, 102, 1),
            ),
          ),
          useMaterial3: true,
          fontFamily: 'Circular',
        ),
        debugShowCheckedModeBanner: false,
        /* home: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            if (state is IsOnboardingState) {
              return OnboardingPage();
            } else {
              return TabBarNavigation();
            }
          },
        ), */
      ),
    );
  }
}
