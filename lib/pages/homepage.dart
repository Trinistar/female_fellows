import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/carousel_items.dart';
import 'package:vs_femalefellows/components/event_ideashomepage.dart';
import 'package:vs_femalefellows/components/events_carouselhomepage.dart';
import 'package:vs_femalefellows/components/first_containerhomepage.dart';
import 'package:vs_femalefellows/components/homepage_divider.dart';
import 'package:vs_femalefellows/components/image_button.dart';
import 'package:vs_femalefellows/components/second_dividerhompage.dart';
import 'package:vs_femalefellows/components/third_dividerhomepage.dart';

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
        //Carousel for Tandem
        ImageButton(),
        //Divider for grey and white space
        Artbar(),
        //Container for eventscarousel
        EventCarousel(),
        //divider grey and blue
        SecondDivider(),
        //Contianer eventsideas
        EventIdeas(),
        //third divider grey and blue
        ThridDivider(),
      ],
    );
  }
}
