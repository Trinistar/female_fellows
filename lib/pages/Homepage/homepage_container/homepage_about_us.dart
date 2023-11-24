import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_fempowerment.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_kooperations_partner.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_unsere_mission.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 450,
      width: 1000,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Über den Verein',
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 5,
                endIndent: 320,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mission()));
                  },
                  child: Container(
                    width: 320,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset('lib/images/unsereMission.png')),
                        Text(
                          'Unsere Mission',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FemPower()));
                  },
                  child: Container(
                    width: 320,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset('lib/images/Fempower.png')),
                        Text(
                          'Fempowerment',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Kooperation()));
                  },
                  child: Container(
                    width: 320,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset('lib/images/kooperation.png')),
                        Text(
                          'Kooperationsparnter',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
