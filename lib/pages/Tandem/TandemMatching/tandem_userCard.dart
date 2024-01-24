import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_success.dart';

class TandemUserCard extends StatefulWidget {
  const TandemUserCard({super.key});

  @override
  State<TandemUserCard> createState() => _TandemUserCardState();
}

class _TandemUserCardState extends State<TandemUserCard> {
  @override
  Widget build(BuildContext context) {
    return  Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 170,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 30,
                                    ),
                                    Text(
                                      'Stuttgart-Mitte',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'lib/images/chat.svg',
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Arabisch (Muttersprache), Deutsch (sehr gut), Englisch (sehr gut)',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    '» Ich bin aus Syrien und habe Interesse an kulturellem Austausch und beruflicher Orientierung in Deutschland.«',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Text('-Rahaf,23'),
                                SizedBox(
                                  height: 50,
                                ),
                                GestureDetector(
                                  onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TandemSuccess()));},
                                  child: Container(
                                    padding: EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Als Tandem-Partnerin anfragen',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                                  ),
                                ),
                                SizedBox(height: 50,),
                              ]),
                        ),
                      ),
                      // der Container soll das Profil bild Später ersetzen //
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(60),
                              topLeft: Radius.circular(60)),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200, top: 100),
                        child: Center(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: Theme.of(context).colorScheme.primary),
                            child: Text(
                              '100%\nMatch',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
  }
}