import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamFoerderin extends StatefulWidget {
  const TeamFoerderin({super.key});

  @override
  State<TeamFoerderin> createState() => _TeamFoerderinState();
}

final foerderinUrl = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLScsSvgohEYh_PUv9cYMipqOmomXqrqlDnMECPglzP-r3_7_eQ/viewform');
final teamUrl = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLSerxkMBKC4L6ggFCkqpGxpH3nG-Tt9EPUyZZ2JuGy3KfXqgZA/viewform');

class _TeamFoerderinState extends State<TeamFoerderin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 1000,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                launchUrl(teamUrl, mode: LaunchMode.externalApplication);
              });
            },
            child: Stack(
              children: [
                SvgPicture.asset(
                  width: 320,
                  height: 250,
                  'assets/buntes-team.svg',
                ),
                Positioned(
                  left: 40,
                  top: 40,
                  child: Text('Werde Teil unseres bunten \nTeams', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                launchUrl(foerderinUrl, mode: LaunchMode.externalApplication);
              });
            },
            child: Stack(
              children: [
                SvgPicture.asset(
                  width: 320,
                  height: 250,
                  'assets/foerderer-werden.svg',
                ),
                Positioned(
                  left: 40,
                  top: 40,
                  child: Text('Foerder*in werden', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
