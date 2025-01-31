import 'package:femalefellows/generated/l10n.dart';
import 'package:femalefellows/widgets/activity_tile_widget.dart';
import 'package:flutter/material.dart';

class ActivitysCarousel extends StatelessWidget {
  const ActivitysCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 1000,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ActivityTileWidget(
              assetPath: 'assets/cafe-01.svg',
              text: S.of(context).tandemActivityOneTitle,
              colorDark: false,
              route: '/tandemCoffee'),
          ActivityTileWidget(
              assetPath: 'assets/picknicken-01.svg',
              text: S.of(context).tandemActivityTwoTitle,
              colorDark: true,
              route: '/tandemPicknick'),
          ActivityTileWidget(
              assetPath: 'assets/musik-01.svg',
              text: S.of(context).tandemActivityThreeTitle,
              colorDark: false,
              route: '/tandemMusic'),
          ActivityTileWidget(
              assetPath: 'assets/kreativ-01.svg',
              text: S.of(context).tandemActivityFourTitle,
              colorDark: false,
              route: '/tandemCreativ'),
          ActivityTileWidget(
              assetPath: 'assets/ab-ins-gruene-01.svg',
              text: S.of(context).tandemActivityFiveTitle,
              colorDark: true,
              route: '/tandemGreen'),
          ActivityTileWidget(
              assetPath: 'assets/deutsch-lernen-01.svg',
              text: S.of(context).tandemActivitySixTitle,
              colorDark: false,
              route: '/tandemGerman'),
          ActivityTileWidget(
              assetPath: 'assets/gemeinsam-kochen.svg',
              text: S.of(context).tandemActivitySevenTitle,
              colorDark: false,
              route: '/tandemCook'),
          ActivityTileWidget(
              assetPath: 'assets/tandem-austausch-01.svg',
              text: S.of(context).tandemActivityEightTitle,
              colorDark: true,
              route: '/tandemExchange'),
          ActivityTileWidget(
              assetPath: 'assets/aktiv-sein-01.svg',
              text: S.of(context).beActive,
              colorDark: false,
              route: '/tandemActiv'),
          ActivityTileWidget(
              assetPath: 'assets/kino-01.svg',
              text: S.of(context).tandemActivityTenTitle,
              colorDark: false,
              route: '/tandemCinema'),
          ActivityTileWidget(
              assetPath: 'assets/kunst.svg',
              text: S.of(context).tandemActivityElevenTitle,
              colorDark: true,
              route: '/tandemArt'),
          ActivityTileWidget(
              assetPath: 'assets/city-erkunden.svg',
              text: S.of(context).cityWalk,
              colorDark: false,
              route: '/tandemCity'),
          ActivityTileWidget(
              assetPath: 'assets/digitale-aktivitaeten-01.svg',
              text: S.of(context).tandemActivityThirteenTitle,
              colorDark: false,
              route: '/tandemDigital'),
        ],
      ),
    );
  }
}
