import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class EventMaterial extends StatelessWidget {
  const EventMaterial({super.key});

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
              AppLocalizations.of(context)!.createEventsMaterialTitle,
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 5,
              endIndent: 320,
            ),
            Container(
              color: Theme.of(context).colorScheme.surfaceVariant,
              height: 20,
            ),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/notebook.svg',
              ),
              title: Text(AppLocalizations.of(context)!.eventOneSubtitleOne),
              subtitle: TextField(
                controller: Controller.planerController,
                decoration:
                    InputDecoration(hintText:AppLocalizations.of(context)!.createEventsMaterial,),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: SvgPicture.asset(
                'lib/images/food.svg',
              ),
              title: Text(AppLocalizations.of(context)!.eventOneSubtitleTwo),
              subtitle: TextField(
                controller: Controller.foodController,
                decoration:
                    InputDecoration(hintText: AppLocalizations.of(context)!.createEventsMaterial),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: Image.asset(
                'lib/images/Shirt.png',
                cacheHeight: 35,
              ),
              title: Text(AppLocalizations.of(context)!.eventOneSubtitleThree),
              subtitle: TextField(
                controller: Controller.clothesController,
                decoration:
                    InputDecoration(hintText: AppLocalizations.of(context)!.createEventsMaterial),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: Image.asset(
                'lib/images/Star.png',
                cacheHeight: 35,
              ),
              title: Text(AppLocalizations.of(context)!.eventOneSubtitleFour),
              subtitle: TextField(
                  controller: Controller.informationController,
                  decoration:
                      InputDecoration(hintText:AppLocalizations.of(context)!.createEventsMaterial)),
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
