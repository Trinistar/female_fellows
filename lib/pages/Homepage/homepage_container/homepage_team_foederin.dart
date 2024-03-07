import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TeamFoerderin extends StatefulWidget {
  const TeamFoerderin({super.key});

  @override
  State<TeamFoerderin> createState() => _TeamFoerderinState();
}

final foerderinUrl = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLScsSvgohEYh_PUv9cYMipqOmomXqrqlDnMECPglzP-r3_7_eQ/viewform');
final teamUrl = Uri.parse(
   'https://femalefellows.com/team/#team-unterstuetzen/');

class _TeamFoerderinState extends State<TeamFoerderin> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('lib/images/buntes-team.png')),
                color: Color.fromRGBO(252, 196, 215, 1),
                borderRadius: BorderRadius.circular(40)),
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
            child: SvgPicture.asset('lib/images/foerderer-werden.svg'),
          ),
        )
      ]),
    );
  }
}
