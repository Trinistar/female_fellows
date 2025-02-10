import 'package:femalefellows/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';

class FutureComponents extends StatelessWidget {
  const FutureComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerBouthCorner(
          color1: Theme.of(context).colorScheme.surface,
          color2: Colors.white,
        ),
        Container(
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).tandemAftermatchedCheckpoints,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 270,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stuttgart',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Umkreis von 20 km',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text('Anlaufstelle 1'),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Uhlandstraße 26, 70182 Stuttgart')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.link),
                          SizedBox(
                            width: 5,
                          ),
                          Text('www.babeleck.de')
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        DividerBouthCorner(
            color1: Theme.of(context).colorScheme.primary,
            color2: Theme.of(context).colorScheme.surface),
        Container(
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Support & Feedback',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 310,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                FFButton(
                  onTap: () {},
                  text: 'Report Problem',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                FFButton(
                  onTap: () {},
                  text: 'Feedback geben',
                  border: Border.all(color: Colors.white, width: 2),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
