import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:femalefellows/statics.dart';

class TandemGerman extends StatefulWidget {
  const TandemGerman({super.key});

  @override
  State<TandemGerman> createState() => _TandemGermanState();
}

class _TandemGermanState extends State<TandemGerman> {
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
                      AppLocalizations.of(context)!.tandemActivitySixTitle,
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
                      AppLocalizations.of(context)!.tandemActivitySixBody('<a href="https://learngerman.dw.com/de/placementDashboard">https://learngerman.dw.com/de/placementDashboard</a>'),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivitySixBody2(alphabetisierungDownload, goetheWebsite, youtubedeutsch, deutschtrainerWebsite, deutschenglischWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivitySixBody3(goetheappWebsite, stadtderwoerterWebsite, kennenlernenWebsite, meinwegWebsite),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.tandemActivitySixBody4('<a href="https://femalefellows.com/deutsch-lernen/make-it-in-germany.com">https://femalefellows.com/deutsch-lernen/make-it-in-germany.com</a>', '<a href="https://welcome.stuttgart.de/deutsch-lernen/suche-nach-deutschkursen.php">https://welcome.stuttgart.de/deutsch-lernen/suche-nach-deutschkursen.php</a>', arbeitsplatzgoetheWebsite),
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
