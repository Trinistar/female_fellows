import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/Onboarding – Step 1_ Tandem.png'),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
          ),
          Text(
           AppLocalizations.of(context)!.onboardingPageTwoTitle,
            style: TextStyle(
              color:  Theme.of(context).colorScheme.primary,
              fontSize: 35,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Divider(
            thickness: 5,
            indent: 70,
            endIndent: 280,
            color:  Theme.of(context).colorScheme.primary,

          ),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
             AppLocalizations.of(context)!.onboardingPageTwoBody,
              style: TextStyle(
                color:  Theme.of(context).colorScheme.primary,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
