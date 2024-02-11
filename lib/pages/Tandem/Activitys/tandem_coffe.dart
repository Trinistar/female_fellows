import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TandemCoffe extends StatefulWidget {
  const TandemCoffe({super.key});

  @override
  State<TandemCoffe> createState() => _TandemCoffeState();
}

class _TandemCoffeState extends State<TandemCoffe> {
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
                    AppLocalizations.of(context)!.tandemActivityOneTitle,
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
                      AppLocalizations.of(context)!.tandemActivityOneBody,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ])),
          SizedBox(
            height: 200,
            width: 1000,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(60)),
                  child: SvgPicture.asset(
                    'lib/images/cafe.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(60)),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(60)),
                ),
              ],
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
                AppLocalizations.of(context)!.eventsPageGetLocation,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
