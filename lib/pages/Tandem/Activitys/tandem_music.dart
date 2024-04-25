import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TandemMusic extends StatefulWidget {
  const TandemMusic({super.key});

  @override
  State<TandemMusic> createState() => _TandemMusicState();
}

class _TandemMusicState extends State<TandemMusic> {
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
                      AppLocalizations.of(context)!.tandemActivityThreeTitle,
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
                      AppLocalizations.of(context)!.tandemActivityThreeBody,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                      Text(
                      AppLocalizations.of(context)!.tandemActivityThreeBody2,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),  Text(
                      AppLocalizations.of(context)!.tandemActivityThreeBody3,
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
