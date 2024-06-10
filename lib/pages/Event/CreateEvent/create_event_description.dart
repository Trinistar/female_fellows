import 'package:flutter/material.dart';
import 'package:femalefellows/provider/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DescriptionEvent extends StatelessWidget {
  const DescriptionEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      height: 350,
      width: 1000,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Image.asset('lib/images/Vector.png'),
            ),
            Text(
              AppLocalizations.of(context)!.createEventsDescription,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Divider(
              color: Colors.white,
              thickness: 5,
              endIndent: 280,
            ),
            TextField(
              maxLength: 150,
              maxLines: 6,
              controller: Controller.descriptionController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                  // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Theme.of(context).colorScheme.surface,
                filled: true,
                hintText: 'Description',
              ),
            ),
            Image.asset('lib/images/Vector.png'),
          ],
        ),
      ),
    );
  }
}
