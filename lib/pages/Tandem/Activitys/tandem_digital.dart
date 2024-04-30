import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/statics.dart';

class TandemDigital extends StatefulWidget {
  const TandemDigital({super.key});

  @override
  State<TandemDigital> createState() => _TandemDigitalState();
}

class _TandemDigitalState extends State<TandemDigital> {
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
                      AppLocalizations.of(context)!.tandemActivityThirteenTitle,
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
                      AppLocalizations.of(context)!.tandemActivityThirteenBody,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                       Text(
                      AppLocalizations.of(context)!.tandemActivityThirteenBody2(femaleFellowsMail),
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
