import 'package:flutter/material.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/pages/Authentication/authentication_entry.dart';
import 'package:femalefellows/generated/l10n.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/Onboarding – Startscreen.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 370,
            ),
            Text(
              S.of(context)!.onboardingPageOneTitle,
              style: TextStyle(
                color:  Theme.of(context).colorScheme.primary,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              thickness: 5,
              indent: 40,
              endIndent: 310,
              color:  Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 140, bottom: 15),
              child: Text(
                S.of(context)!.onboardingPageOneBody,
                style: TextStyle(
                  color:  Theme.of(context).colorScheme.primary,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: FFButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationEntry(isFromOnboarding: true),
                    ));
                  },
                  text: S.of(context)!.buttonRegistration,
                  )
            ),
            SizedBox(
              height: 140,
            )
          ],
        ),
      ),
    );
  }
}
