import 'package:flutter/material.dart';
import 'package:femalefellows/generated/l10n.dart';

class TandemCoffee extends StatefulWidget {
  const TandemCoffee({super.key});

  @override
  State<TandemCoffee> createState() => _TandemCoffeeState();
}

class _TandemCoffeeState extends State<TandemCoffee> {
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).tandemActivityOneTitle,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Divider(
                      thickness: 5,
                      indent: 0,
                      endIndent: 280,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      S.of(context).tandemActivityOneBody,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ])),
          SizedBox(
            height: 200,
            width: 1000,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 250,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: Image.asset(
                      'lib/images/sprachcafe-1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 250,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: Image.asset(
                      'lib/images/sprachcafe-2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Gemütliches Ambiente direkt in der Nähe der Haltestelle Olgaeck. Es gibt einen Außen- und Innenbereich und leckere Gerichte zum Essen. Im Babel steckt ein Stück Female Fellows Geschichte. Hier haben unsere Treffen vor und während der Gründung stattgefunden. Dieser Ort hat uns sehr inspiriert, um kreativ zu arbeiten. Er gab uns neue Energie und die Kraft, an uns zu glauben und weiterzumachen.',
                  style: TextStyle(color: Colors.white),
                ),
                /*  Text(
                S.of(context)!.eventsPageGetLocation,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Divider(
                  thickness: 5,
                  indent: 0,
                  endIndent: 280,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'Stuttgart',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Umkreis von 10km',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: toggleSteps,
                        icon: Icon(
                          showSteps
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 40,
                          color: Colors.white,
                        )),
                  ],
                ),
                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                // One Element of Coffe´s
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Café Babel:',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Uhlandstraße 26, 70182 Stuttgart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'www.babeleck.de',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: toggleSteps,
                        icon: Icon(
                          showSteps
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 40,
                          color: Colors.white,
                        )),
                  ],
                ),
                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Café Babel:',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Uhlandstraße 26, 70182 Stuttgart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'www.babeleck.de',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: toggleSteps,
                        icon: Icon(
                          showSteps
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 40,
                          color: Colors.white,
                        )),
                  ],
                ),

                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Café Babel:',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Uhlandstraße 26, 70182 Stuttgart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'www.babeleck.de',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: toggleSteps,
                        icon: Icon(
                          showSteps
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 40,
                          color: Colors.white,
                        )),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
