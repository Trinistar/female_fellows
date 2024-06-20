import 'package:femalefellows/pages/Authentication/Email/email_verification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/blocs/CategoriesCubit/categories_cubit.dart';
import 'package:femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:femalefellows/blocs/FavoritesBloc/favorites_bloc.dart';
import 'package:femalefellows/blocs/ImageUploadBloc/image_upload_bloc.dart';
import 'package:femalefellows/blocs/OnboardingBloc/onboarding_bloc.dart';
import 'package:femalefellows/blocs/SignedupEvent/signedup_event_bloc.dart';
import 'package:femalefellows/blocs/TandemBloc/tandem_bloc.dart';
import 'package:femalefellows/blocs/TandemOnboardingBloc/tandem_onboarding_bloc.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/pages/AfterTandem/matched_tandem.dart';
import 'package:femalefellows/pages/Authentication/Login/login_page.dart';
import 'package:femalefellows/pages/Authentication/authentication_entry.dart';
import 'package:femalefellows/pages/Event/CreateEvent/create_event.dart';
import 'package:femalefellows/pages/Event/EventDetail/event_detail_page.dart';
import 'package:femalefellows/pages/Event/EventOverview/event_overview.dart';
import 'package:femalefellows/pages/Event/EventSignup/event_authentication_entry.dart';
import 'package:femalefellows/pages/Event/EventSignup/event_authentication_success.dart';
import 'package:femalefellows/pages/Event/EventSignup/event_not_authenticated.dart';
import 'package:femalefellows/pages/Event/UpdateEvent/event_update.dart';
import 'package:femalefellows/pages/Homepage/homepage.dart';
import 'package:femalefellows/pages/Onboarding/onboarding_start.dart';
import 'package:femalefellows/pages/Profile/edit_profile.dart';
import 'package:femalefellows/pages/Profile/profile.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_activ.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_art.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_cinema.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_city.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_coffe.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_cooking.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_creativ.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_digital.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_exchange.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_german.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_green.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_music.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_picknick.dart';
import 'package:femalefellows/pages/Tandem/TandemMatching/tandem_onboarding_entry.dart';
import 'package:femalefellows/pages/Tandem/TandemMatching/tandem_success.dart';
import 'package:femalefellows/pages/Tandem/TandemStorys/tandem_story.dart';
import 'package:femalefellows/pages/Tandem/TandemStorys/tandem_story2.dart';
import 'package:femalefellows/pages/Tandem/TandemStorys/tandem_story3.dart';
import 'package:femalefellows/pages/Tandem/tandem.dart';
import 'package:femalefellows/pages/ToolBarNavigation/navigation_page.dart';
import 'package:femalefellows/provider/firebase/authrepository.dart';
import 'package:femalefellows/provider/firebase/firestore_event_repository.dart';
import 'package:femalefellows/provider/firebase/firestore_user_profile_repository.dart';
import 'package:femalefellows/provider/firebase/messaging.dart';

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

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //await Firebase.initializeApp();

  await Messaging().setupFlutterNotifications();

  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await Messaging().firebaseMessaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

/* final GoRoute _loginTree = GoRoute(
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
); */

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
    GoRoute(
      path: '/tandemStoryOne',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemStoryOne();
      },
    ),
    GoRoute(
      path: '/tandemCoffee',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemCoffee();
      },
    ),
    GoRoute(
      path: '/tandemPicknick',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemPicknick();
      },
    ),
    GoRoute(
      path: '/tandemMusic',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemMusic();
      },
    ),
    GoRoute(
      path: '/tandemCreativ',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemCreativ();
      },
    ),
    GoRoute(
      path: '/tandemGreen',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemGreen();
      },
    ),
    GoRoute(
      path: '/tandemGerman',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemGerman();
      },
    ),
    GoRoute(
      path: '/tandemCook',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemCook();
      },
    ),
    GoRoute(
      path: '/tandemExchange',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemExchange();
      },
    ),
    GoRoute(
      path: '/tandemActiv',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemActiv();
      },
    ),
    GoRoute(
      path: '/tandemCinema',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemCinema();
      },
    ),
    GoRoute(
      path: '/tandemArt',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemArt();
      },
    ),
    GoRoute(
      path: '/tandemCity',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemCity();
      },
    ),
      GoRoute(
      path: '/tandemDigital',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemDigital();
      },
    ),
    GoRoute(
      path: '/tandemStoryOne',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemStoryOne();
      },
    ),
    GoRoute(
      path: '/tandemStoryTwo',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemStoryTwo();
      },
    ),
    GoRoute(
      path: '/tandemStoryThree',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const TandemStoryThree();
      },
    ),
    GoRoute(
      path: '/emailCheck',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return EmailCheck(isDeleteAccount: state.extra as bool);
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
                GoRoute(
                  path: 'tandemSuccess',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return TandemSuccess();
                  },
                ),
                GoRoute(
                  path: 'tandemInfo',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const Tandementry(isInfo: true);
                  },
                ),
                GoRoute(
                  path: 'afterTandem',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const AfterTandem();
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
              routes: [
                GoRoute(
                  path: 'detailEvent/:id',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) =>
                      DetailEvent(eventId: state.pathParameters['id']!),
                ),
              ],
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
                GoRoute(
                  path: 'editProfile',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return EditProfile(userstate: state.extra as FFUser);
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
        BlocProvider<ImageUploadBloc>(
          create: (BuildContext context) => ImageUploadBloc(),
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
