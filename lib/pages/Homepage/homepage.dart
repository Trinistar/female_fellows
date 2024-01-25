import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_about_us.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/carousel_items.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/events_carouselhomepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/welcome_containerhomepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/FutureHomepage/image_button.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_team_foederin.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/foerderin_homepage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/challenges_hompage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/end_homepage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/event_ideashomepage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_dividersecond.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/newjob_homepage.dart';
//import 'package:vs_femalefellows/pages/Homepage/homepage_container/interrest_themshomepage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
              'Tandem-Erfolgsstories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          //carousel
          SizedBox(
            height: 150,
            width: 1000,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CarouselItem(),
                  CarouselItem(),
                  CarouselItem(),
                  CarouselItem(),
                  CarouselItem(),
                  CarouselItem(),
                  CarouselItem(),
                  CarouselItem(),
                ],
              ),
            ),
          ),
          ImageButton(),
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.surfaceVariant,
              color2: Colors.white),
    
          EventCarousel(),
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
          Container(
            height: 350,
            width: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Neuigkeiten',
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
                /////////////
                /////////
                //////
                ///
                SizedBox(
                  height: 200,
                ), //TODO content ersetzen
                /////////////
                /////////
                //////
                ///
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
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(60)),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 30,
                        ),
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
