import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/generated/l10n.dart';


class EventMaterials extends StatelessWidget {
  const EventMaterials({
    super.key, required this.eventState,
  });

  final Event eventState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              S.of(context).eventOneTitleFour,
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
              title: Text(S.of(context).eventOneSubtitleOne),
              subtitle: Text(eventState.material!.planer),
            ),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/food.svg',
              ),
              title: Text(S.of(context).eventOneSubtitleTwo),
              subtitle: Text(eventState.material!.food),
            ),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/kleidung.svg',
                
              ),
              title: Text(S.of(context).eventOneSubtitleThree),
              subtitle: Text(eventState.material!.clothes),
            ),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/sonstiges.svg',
                
              ),
              title: Text(S.of(context).eventOneSubtitleFour),
              subtitle: Text(eventState.material!.information),
            ),
            Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
