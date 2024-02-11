import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TeamFoerderin extends StatefulWidget {
  const TeamFoerderin({super.key});

  @override
  State<TeamFoerderin> createState() => _TeamFoerderinState();
}
final foerderinUrl = Uri.parse(
    'Link: https://docs.google.com/forms/d/e/1FAIpQLScsSvgohEYh_PUv9cYMipqOmomXqrqlDnMECPglzP-r3_7_eQ/viewform');
final teamUrl = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLScsSvgohEYh_PUv9cYMipqOmomXqrqlDnMECPglzP-r3_7_eQ/viewform');

class _TeamFoerderinState extends State<TeamFoerderin> {
  @override
  Widget build(BuildContext context) {
    return    Container(
          height: 550,
          width: 1000,
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Column(children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  // launchUrl(teamurl,mode: LaunchMode.inAppWebView);
                  launchUrl(teamUrl, mode: LaunchMode.externalApplication);
                });
              },
              child: Container(
                width: 320,
                height: 250,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 196, 215, 1),
                    borderRadius: BorderRadius.circular(40)),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 35),
                    child: Image.asset('lib/images/foerderer-werden.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 70),
                    child: Text(
                      AppLocalizations.of(context)!.homeLinkOneTitle,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  // launchUrl(teamurl,mode: LaunchMode.inAppWebView);
                  launchUrl(foerderinUrl, mode: LaunchMode.externalApplication);
                });
              },
              child: Container(
                width: 320,
                height: 250,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(40)),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 35),
                    child: Image.asset('lib/images/foerderer-werden.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 70),
                    child: Text(
                      AppLocalizations.of(context)!.homeLinkTwoTitle,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
              ),
            )
          ]),
        );
  }
}