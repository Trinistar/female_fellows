import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:femalefellows/data/constants.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/FutureHomepage/image_button.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/events_carouselhomepage.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_about_us.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_team_foederin.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/welcome_containerhomepage.dart';
import 'package:femalefellows/pages/Tandem/TandemStorys/tandem_item_story1.dart';
import 'package:femalefellows/pages/Tandem/TandemStorys/tandem_item_story2.dart';
import 'package:femalefellows/pages/Tandem/TandemStorys/tandem_item_story3.dart';
import 'package:femalefellows/provider/firebase/messaging.dart';

//import 'package:femalefellows/pages/Homepage/homepage_container/foerderin_homepage.dart';
//import 'package:femalefellows/pages/Homepage/homepage_container/challenges_hompage.dart';
//import 'package:femalefellows/pages/Homepage/homepage_container/end_homepage.dart';
//import 'package:femalefellows/pages/Homepage/homepage_container/event_ideashomepage.dart';
//import 'package:femalefellows/pages/Homepage/homepage_container/homepage_dividersecond.dart';
//import 'package:femalefellows/pages/Homepage/homepage_container/newjob_homepage.dart';
//import 'package:femalefellows/pages/Homepage/homepage_container/interrest_themshomepage.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.pagechange});
  final void Function(int)? pagechange;

  @override
  State<Home> createState() => _HomeState();
}

final facebookUrl = Uri.parse('https://www.facebook.com/FemaleFellows');
final linkedUrl = Uri.parse('https://www.linkedin.com/company/10924303/admin/feed/posts/');
final instaUrl = Uri.parse('https://www.instagram.com/femalefellows/?hl=de');
final youtubeUrl = Uri.parse('https://www.youtube.com/channel/UC0qt11OqFnAzPI_IGHnR_2w');
final twitterUrl = Uri.parse('https://twitter.com/femalefellows');

final teamUrl = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLScsSvgohEYh_PUv9cYMipqOmomXqrqlDnMECPglzP-r3_7_eQ/viewform');

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    _initDynamicLinks();

    // App opened from terminated state
    Messaging().firebaseMessaging.getInitialMessage().then(
      (RemoteMessage? message) {
        if (message == null) return;

        _handlePushMessages(message);
      },
    );

    // App active in foreground
    Messaging().onMessage.listen(
      (RemoteMessage message) {
        final RemoteNotification? notification = message.notification;
        final AndroidNotification? android = message.notification?.android;

        if (notification != null && android != null) {
          Messaging().flutterLocalNotificationsPlugin.show(
                notification.hashCode,
                notification.title,
                notification.body,
                const NotificationDetails(
                  android: AndroidNotificationDetails(
                    androidLocalNotificationChannelId,
                    androidLocalNotificationChannelName,
                    channelDescription: androidLocalNotificationChannelDescription,
                    /* importance: Importance.max,
                priority: Priority.high, */
                    // TODO add a proper drawable resource to android, for now using
                    //      one that already exists in example app.
                    icon: '@drawable/ic_notification_icon',
                  ),
                ),
              );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Column(
                children: [
                  Text(notification.title!),
                  Text(notification.body!),
                ],
              ),
              action: SnackBarAction(label: 'Anzeigen', onPressed: () => _handlePushMessages(message)),
            ),
          );
        }
      },
    );

    // App opened from background
    Messaging().onMessageOpenedApp.listen(
      (RemoteMessage message) {
        _handlePushMessages(message);
      },
    );
  }

  Future<void> _initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink.link;

      //TODO make dynamic link work for ios, if clicked card on web

      if (deepLink.pathSegments.last.isNotEmpty) {
        if (deepLink.pathSegments.last == 'verify' && context.read<AuthenticationBloc>().state is AuthenticatedUser) {
          var authState = (context.read<AuthenticationBloc>().state as AuthenticatedUser);
          context.push('/emailCheck');
          //context.read<AuthenticationBloc>().add(ReloadUserEvent(profile: authState.userProfile!, user: authState.user!));
        }
        //_reauth(deepLink.pathSegments.last);
      }
    });

    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      if (!mounted) return;
      if (deepLink.pathSegments.last.isNotEmpty) {
        if (deepLink.pathSegments.last == 'verify' && context.read<AuthenticationBloc>().state is AuthenticatedUser) {
          var authState = (context.read<AuthenticationBloc>().state as AuthenticatedUser);
          context.push('/emailCheck');
          //context.read<AuthenticationBloc>().add(ReloadUserEvent(profile: authState.userProfile!, user: authState.user!));
        }
        //_reauth(deepLink.pathSegments.last);
      }
    }
  }

  void _reauth(String link) {
    if (link == 'verify' && context.read<AuthenticationBloc>().state is AuthenticatedUser) {
      final User user = (context.read<AuthenticationBloc>().state as AuthenticatedUser).user!;
      final AuthCredential credential = AuthCredential(
        providerId: user.providerData.first.providerId,
        signInMethod: 'password',
      );
      (context.read<AuthenticationBloc>().state as AuthenticatedUser).user!.reauthenticateWithCredential(credential);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        toolbarHeight: 10,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          //first container
          HomePageTitle(),
          //Container with title Tandem
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              S.of(context).homeTandemstoriesTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 30),
            child: Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 5,
                endIndent: 320,
                indent: 15,
              ),
          ),
          SizedBox(
            height: 160,
            width: 1000,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: [
                TandemItemStoryOne(),
                TandemItemStoryTwo(),
                TandemItemStoryThree(),
              ],
            ),
          ),
          ImageButton(
            pagechange: widget.pagechange,
          ),
          DividerBouthCorner(color1: Theme.of(context).colorScheme.surfaceContainerHighest, color2: Colors.white),
          EventCarousel(
            pagechange: widget.pagechange,
          ),
          DividerBouthCorner(color1: Colors.white, color2: Theme.of(context).colorScheme.surfaceContainerHighest),
          AboutUs(),
          DividerBouthCorner(color1: Theme.of(context).colorScheme.surfaceContainerHighest, color2: Colors.white),
          TeamFoerderin(),
          DividerBouthCorner(color1: Colors.white, color2: Theme.of(context).colorScheme.surfaceContainerHighest),
          SizedBox(
            width: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Socialmedia',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Divider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 5,
                    endIndent: 320,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(facebookUrl, mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/facebook.png')),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(linkedUrl, mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/linkedin.png')),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(instaUrl, mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/instagram.png')),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(youtubeUrl, mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/youtube.png')),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(twitterUrl, mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/twitter.png')),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          DividerBouthCorner(color1: Theme.of(context).colorScheme.secondary, color2: Colors.white),
          Container(
            width: 1000,
            height: 250,
            color: Theme.of(context).colorScheme.secondary,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: Image.asset('lib/images/Vector.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130, top: 30),
                  child: Text(
                    S.of(context).onboardingPageOneTitle,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 25,
                    ),
                  ),
                ),
                Image.asset('lib/images/hompageFrauLinks.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 300, top: 60),
                  child: Image.asset('lib/images/homepageFrauRechts.png'),
                ),
              ],
            ),
          )

          /*         DividerCornerLeft(
            color1: Theme.of(context).colorScheme.surfaceVariant,
            color2: Theme.of(context).colorScheme.primary,
          ),
          // EventIdeas(),
          DividerBouthCorner(
            color1: Theme.of(context).colorScheme.surfaceVariant,
            color2: Theme.of(context).colorScheme.primary,
          ),
          ThemeGroups(),
          DividerBouthCorner(
            color1: Colors.white,
            color2: Theme.of(context).colorScheme.surfaceVariant,
          ),
          Challenges(),
          DividerCornerLeft(
            color1: Theme.of(context).colorScheme.surfaceVariant,
            color2: Theme.of(context).colorScheme.primary,
          ),
          NewJobs(),
          DividerBouthCorner(
            color1: Colors.white,
            color2: Theme.of(context).colorScheme.primary,
          ),
          Foerderin(),
          DividerCornerLeft(
            color1: Colors.white,
            color2: Theme.of(context).colorScheme.tertiary,
          ),
          End(), */
        ],
      ),
    );
  }
}

void _handlePushMessages(RemoteMessage message) {}
