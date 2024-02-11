import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EventMaterials extends StatelessWidget {
  const EventMaterials({
    super.key, required this.eventState,
  });

  final Event eventState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.eventOneTitleFour,
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 5,
              endIndent: 320,
            ),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/notebook.svg',
              ),
              title: Text(AppLocalizations.of(context)!.eventOneSubtitleOne),
              subtitle: Text(eventState.material!.planer),
            ),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/food.svg',
              ),
              title: Text(AppLocalizations.of(context)!.eventOneSubtitleTwo),
              subtitle: Text(eventState.material!.food),
            ),
            ListTile(
              isThreeLine: true,
              leading: Image.asset(
                'lib/images/Shirt.png',
                cacheHeight: 35,
              ),
              title: Text(AppLocalizations.of(context)!.eventOneSubtitleThree),
              subtitle: Text(eventState.material!.clothes),
            ),
            ListTile(
              isThreeLine: true,
              leading: Image.asset(
                'lib/images/Star.png',
                cacheHeight: 35,
              ),
              title: Text(AppLocalizations.of(context)!.eventOneSubtitleFour),
              subtitle: Text(eventState.material!.information),
            ),
            Container(
              color: Theme.of(context).colorScheme.surfaceVariant,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
