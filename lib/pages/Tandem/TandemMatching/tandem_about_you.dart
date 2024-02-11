import 'package:flutter/material.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TandemAboutYou extends StatelessWidget {
  const TandemAboutYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView(
          children: [
            Text(
              AppLocalizations.of(context)!.tandemMatchingAnmeldungOverlayOneTitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/dolmetcher.png'),
                radius: 100,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              maxLength: 250,
              maxLines: 7,
              controller: Controller.aboutYouController,
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
                hintText:AppLocalizations.of(context)!.tandemMatchingAnmeldungOverlayOneFieldPlaceholder,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.tandemMatchingAnmeldungOverlayOneFieldPlaceholder2,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
