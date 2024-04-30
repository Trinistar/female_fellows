import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/statics.dart';

class TandemCook extends StatefulWidget {
  const TandemCook({super.key});

  @override
  State<TandemCook> createState() => _TandemCookState();
}

class _TandemCookState extends State<TandemCook> {
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
                      AppLocalizations.of(context)!.tandemActivitySevenTitle,
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
                      AppLocalizations.of(context)!.tandemActivitySevenBody,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                      Text(
                      AppLocalizations.of(context)!.tandemActivitySevenBody2,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                     Text(
                      AppLocalizations.of(context)!.tandemActivitySevenBody3(femaleFellowsMail),
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
