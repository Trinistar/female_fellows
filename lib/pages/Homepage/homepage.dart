import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Homepage/foerderin_homepage.dart';
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
  final user = FirebaseAuth.instance.currentUser!;
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
          color1: Color.fromRGBO(236, 240, 243, 1),
          color2: Colors.white,
        ),
        EventCarousel(),
        DividerCornerLeft(
          color1: Color.fromRGBO(236, 240, 243, 1),
          color2: Color.fromRGBO(27, 25, 68, 1),
        ),
        EventIdeas(),
        DividerBouthCorner(
          color1: Color.fromRGBO(236, 240, 243, 1),
          color2: Color.fromRGBO(27, 25, 68, 1),
        ),
        ThemeGroups(),
        DividerBouthCorner(
          color1: Colors.white,
          color2: Color.fromRGBO(236, 240, 243, 1),
        ),
        Challenges(),
        DividerCornerLeft(
          color1: Color.fromRGBO(236, 240, 243, 1),
          color2: Color.fromRGBO(27, 25, 68, 1),
        ),
        NewJobs(),
        DividerBouthCorner(
          color1: Colors.white,
          color2: Color.fromRGBO(27, 25, 68, 1),
        ),
        Foerderin(),
        DividerCornerLeft(
          color1: Colors.white,
          color2: Color.fromRGBO(106, 104, 206, 1),
        ),
        End(),
      ],
    );
  }
}
