import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/Onboarding – Step 2_ Events.png'),
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
            padding: const EdgeInsets.only(right:80),
            child: Text(
             AppLocalizations.of(context)!.onboardingPageThreeTitle,
              style: TextStyle(
                color: Color.fromRGBO(27, 25, 86, 1),
                fontSize: 35,
              ),
            ),
          ),
           Padding(
                padding: const EdgeInsets.only(top: 10,left: 200),
                child: Image.asset('lib/images/Vector.png'),
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
            AppLocalizations.of(context)!.onboardingPageThreeBody,
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
