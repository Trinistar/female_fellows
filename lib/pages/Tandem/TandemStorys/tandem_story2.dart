import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TandemStory2 extends StatelessWidget {
  const TandemStory2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                color: Colors.green,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Container(
                      width: 1000,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              AppLocalizations.of(context)!.tandemStory2Title,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Yasna & Franziska',
                              style: TextStyle(fontSize: 25),
                            ),
                            Divider(
                              thickness: 3,
                              indent: 0,
                              endIndent: 280,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .tandemStory2Body,
                              style: TextStyle(fontSize: 15),
                            ),
                              SizedBox(
                              height: 20,
                            ),
                               Text(
                              AppLocalizations.of(context)!
                                  .tandemStory2Body1,
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                               Text(
                              AppLocalizations.of(context)!
                                  .tandemStory2Body2,
                              style: TextStyle(fontSize: 15),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100)
                ],
              ),
              BackButton(
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
