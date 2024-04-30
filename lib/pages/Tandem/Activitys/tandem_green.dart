import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/statics.dart';

class TandemGreen extends StatefulWidget {
  const TandemGreen({super.key});

  @override
  State<TandemGreen> createState() => _TandemGreenState();
}

class _TandemGreenState extends State<TandemGreen> {
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
                      AppLocalizations.of(context)!.tandemActivityFiveTitle,
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
                      AppLocalizations.of(context)!.tandemActivityFiveBody,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody2(fernsehturmWebsite, waldauWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody3(kraehenwaldWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody4(bismarckturmWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody5(killesberparkWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody6(kriegsbergturmWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody7(kriegsbergturmWebsite, chinesischegartenWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody8,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody9,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody10(zackeWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody11(ausblickeWebsite, siebenmuehlentalWebsite, grabkapelleWebsite, solitudeWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody12(besigheimWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody13(kapelleWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody14(badurachWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivityFiveBody15(femaleFellowsMail),
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
