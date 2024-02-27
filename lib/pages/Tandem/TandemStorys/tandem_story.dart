import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TandemStory1 extends StatelessWidget {
  const TandemStory1({super.key});

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
                              AppLocalizations.of(context)!
                                  .homeTandemstoryOneSubTitle,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Makai & Lisa',
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
                               AppLocalizations.of(context)!.homeTandemstoryOneBodyOne,
                               style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 1000,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(60)),
                          child: SvgPicture.asset(
                            'lib/images/cafe.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(60)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(60)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                              AppLocalizations.of(context)!.homeTandemstoryOneBodyTwo,
                              style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  )
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
