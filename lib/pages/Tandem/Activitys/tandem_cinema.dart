import 'package:flutter/material.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:femalefellows/statics.dart';

class TandemCinema extends StatefulWidget {
  const TandemCinema({super.key});

  @override
  State<TandemCinema> createState() => _TandemCinemaState();
}

class _TandemCinemaState extends State<TandemCinema> {
  bool showSteps = false;

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
                      S.of(context)!.tandemActivityTenTitle,
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
                      S.of(context)!.tandemActivityTenBody(cinemastuttgartWebsite, cinemaxXWebsite, sneakcinemaWebsite, paradieslichtspieleWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ])),
        ],
      ),
    );
  }
}
