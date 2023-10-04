import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/Onboarding – Step 3_ Community.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
           AppLocalizations.of(context)!.onboardingPageFourTitle,
              style: TextStyle(
                color: Color.fromRGBO(27, 25, 86, 1),
                fontSize: 35,
              ),
            ),
          ),
        SizedBox(
            height: 40,
          ),
          Divider(
            thickness: 5,
            indent: 70,
            endIndent: 280,
            color: Color.fromRGBO(27, 25, 86, 1),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
             AppLocalizations.of(context)!.onboardingPageFourBody,
              style: TextStyle(
                color: Color.fromRGBO(27, 25, 86, 1),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}