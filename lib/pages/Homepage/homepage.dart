import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/FutureHomepage/image_button.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/events_carouselhomepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_about_us.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_team_foederin.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/welcome_containerhomepage.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemStorys/tandem_item_story1.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemStorys/tandem_item_story2.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemStorys/tandem_item_story3.dart';

//import 'package:vs_femalefellows/pages/Homepage/homepage_container/foerderin_homepage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/challenges_hompage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/end_homepage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/event_ideashomepage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_dividersecond.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/newjob_homepage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/interrest_themshomepage.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.pagechange});
  final void Function(int)? pagechange;

  @override
  State<Home> createState() => _HomeState();
}

final facebookUrl = Uri.parse(' https://www.facebook.com/FemaleFellows');
final linkedUrl = Uri.parse('https://www.linkedin.com/company/10924303/admin/feed/posts/');
final instaUrl = Uri.parse(' https://www.instagram.com/femalefellows/?hl=de');
final youtubeUrl = Uri.parse('https://www.youtube.com/channel/UC0qt11OqFnAzPI_IGHnR_2w');
final twitterUrl = Uri.parse('https://twitter.com/femalefellows');


final teamUrl = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLScsSvgohEYh_PUv9cYMipqOmomXqrqlDnMECPglzP-r3_7_eQ/viewform');

class _HomeState extends State<Home> {
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
              AppLocalizations.of(context)!.homeTandemstoriesTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          //carousel
          SizedBox(
            height: 150,
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
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.surfaceVariant,
              color2: Colors.white),

          EventCarousel(
            pagechange: widget.pagechange,
          ),
          DividerBouthCorner(
              color1: Colors.white,
              color2: Theme.of(context).colorScheme.surfaceVariant),
          AboutUs(),
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.surfaceVariant,
              color2: Colors.white),
          TeamFoerderin(),
          DividerBouthCorner(
              color1: Colors.white,
              color2: Theme.of(context).colorScheme.surfaceVariant),
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
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(facebookUrl,
                                    mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/facebook.png')),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(linkedUrl,
                                    mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/linkedin.png')),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(instaUrl,
                                    mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/instagram.png')),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(youtubeUrl,
                                    mode: LaunchMode.externalApplication);
                              });
                            },
                            child: Image.asset('lib/images/youtube.png')),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                launchUrl(twitterUrl,
                                    mode: LaunchMode.externalApplication);
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
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.secondary,
              color2: Colors.white),
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
                    AppLocalizations.of(context)!.onboardingPageOneTitle,
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
