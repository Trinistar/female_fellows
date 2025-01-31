import 'package:femalefellows/generated/l10n.dart';
import 'package:femalefellows/pages/AfterTandem/matched_tandemheader.dart';
import 'package:femalefellows/pages/Event/EventOverview/signedup_events_page.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/events_carouselhomepage.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_activitys.dart';
import 'package:femalefellows/pages/Tandem/TandemStorys/tandem_carousel.dart';
import 'package:flutter/material.dart';

class AfterTandem extends StatefulWidget {
  const AfterTandem({super.key});

  @override
  State<AfterTandem> createState() => _AfterTandemState();
}

class _AfterTandemState extends State<AfterTandem> {
  bool showSteps = false;
  void toggleSteps() {
    setState(() {
      showSteps = !showSteps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: ListView(
        children: [
          AfterTandemHeader(),
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.surface,
              color2: Colors.white),
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350,
                    child: Text(
                      S.of(context)!.tandemAftermatchedActivities,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    indent: 0,
                    endIndent: 310,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ActivitysCarousel(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          DividerBouthCorner(
              color1: Colors.white,
              color2: Theme.of(context).colorScheme.surface),
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    S.of(context)!.tandemStorys,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Divider(
                    thickness: 3,
                    indent: 0,
                    endIndent: 310,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TandemCarousel(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.surfaceContainerHighest,
              color2: Colors.white),
          EventCarousel(),
          DividerBouthCorner(
            color1: Colors.white,
            color2: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context)!.tandemAftermatchedEvents,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    indent: 0,
                    endIndent: 310,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 400,
                      child: SingedUpEvents(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 // FutureComponents(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
