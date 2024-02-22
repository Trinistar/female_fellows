import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AfterTandemHeader extends StatelessWidget {
  const AfterTandemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              color: Theme.of(context).colorScheme.tertiary,
              child: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.tandemAftermatchedTitle,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Divider(
                          thickness: 5,
                          indent: 0,
                          endIndent: 300,
                          color: Colors.white,
                        )
                      ])),
            ),
            DividerBouthCorner(
                color1: Colors.white,
                color2: Theme.of(context).colorScheme.tertiary),
            Text(
              'Jana & Rahaf',
              style: TextStyle(fontSize: 25),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.supervised_user_circle_sharp),
                Text('gematched seit 08.08.2023'),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
                
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 165),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.amber,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.green,
                  ),
                ),
             
              ],
            ),
          ),
        ),
          ],
        ),
      ],
    );
  }
}
