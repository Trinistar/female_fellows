import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:femalefellows/provider/controller.dart';
import 'package:femalefellows/generated/l10n.dart';



class EventMaterial extends StatelessWidget {
  const EventMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              S.of(context).createEventsMaterialTitle,
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 5,
              endIndent: 220,
            ),
            Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              height: 20,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/notebook.svg',
              ),
              title: Text(S.of(context).eventOneSubtitleOne),
              subtitle: TextField(
                controller: Controller.planerController,
                decoration:
                    InputDecoration(hintText:S.of(context).createEventsMaterial,),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/food.svg',
              ),
              title: Text(S.of(context).eventOneSubtitleTwo),
              subtitle: TextField(
                controller: Controller.foodController,
                decoration:
                    InputDecoration(hintText: S.of(context).createEventsMaterial),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              isThreeLine: true,
              leading: Image.asset(
                'lib/images/Shirt.png',
                cacheHeight: 35,
              ),
              title: Text(S.of(context).eventOneSubtitleThree),
              subtitle: TextField(
                controller: Controller.clothesController,
                decoration:
                    InputDecoration(hintText: S.of(context).createEventsMaterial),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              isThreeLine: true,
              leading: Image.asset(
                'lib/images/Star.png',
                cacheHeight: 35,
              ),
              title: Text(S.of(context).eventOneSubtitleFour),
              subtitle: TextField(
                  controller: Controller.informationController,
                  decoration:
                      InputDecoration(hintText:S.of(context).createEventsMaterial)),
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
