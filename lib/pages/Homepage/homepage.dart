
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/foerderin_homepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/carousel_items.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/challenges_hompage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/end_homepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/event_ideashomepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/events_carouselhomepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_dividersecond.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/newjob_homepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/welcome_containerhomepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/image_button.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/interrest_themshomepage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        //first container
        FirstContainer(),
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
                CarousItem(),
                CarousItem(),
                CarousItem(),
                CarousItem(),
                CarousItem(),
                CarousItem(),
                CarousItem(),
                CarousItem(),
              ],
            ),
          ),
        ),
        ImageButton(),
        DividerBouthCorner(
          color1: Theme.of(context).colorScheme.surface,
          color2: Colors.white,
        ),
        EventCarousel(),
        DividerCornerLeft(
          color1:  Theme.of(context).colorScheme.surfaceVariant,
          color2: Theme.of(context).colorScheme.primary,
        ),
        EventIdeas(),
        DividerBouthCorner(
          color1:  Theme.of(context).colorScheme.surfaceVariant,
          color2: Theme.of(context).colorScheme.primary,
        ),
        ThemeGroups(),
        DividerBouthCorner(
          color1: Colors.white,
          color2:  Theme.of(context).colorScheme.surfaceVariant,
        ),
        Challenges(),
        DividerCornerLeft(
          color1:  Theme.of(context).colorScheme.surfaceVariant,
          color2:  Theme.of(context).colorScheme.primary,
        ),
        NewJobs(),
        DividerBouthCorner(
          color1: Colors.white,
          color2:  Theme.of(context).colorScheme.primary,
        ),
        Foerderin(),
        DividerCornerLeft(
          color1: Colors.white,
          color2: Theme.of(context).colorScheme.tertiary,
        ),
        End(),
      ],
    );
  }
}
