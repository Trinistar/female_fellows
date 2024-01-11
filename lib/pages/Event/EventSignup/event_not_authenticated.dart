import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login.dart';

class EventNotAuthenticatedState extends StatefulWidget {
  const EventNotAuthenticatedState({super.key});

  @override
  State<EventNotAuthenticatedState> createState() =>
      EventNotAuthenticatedStateState();
}

class EventNotAuthenticatedStateState
    extends State<EventNotAuthenticatedState> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              width: 1000,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(top: 30, child: BackButton()),
                      Padding(
                        padding: const EdgeInsets.only(left: 60, top: 25),
                        child: Image.asset('lib/images/FF-Logo_blau-1.png',
                            height: 80, alignment: Alignment(0, -0.8)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'lib/images/Empowerment 1.png',
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: Text(
                'Du hast es gleich geschafft!',
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: Text(
                'Unsere Events sind nur für Mitglieder des Vereins zugänglich. Du bist im Moment noch kein Mitglied.',
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            FFButton(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              text: 'Kostenlos Mitglied werden',
            )
          ],
        ),
      ),
    );
  }
}
