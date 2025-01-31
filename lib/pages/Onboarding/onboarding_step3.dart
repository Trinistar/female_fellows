import 'package:flutter/material.dart';
import 'package:femalefellows/generated/l10n.dart';

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
             S.of(context).onboardingPageThreeTitle,
              style: TextStyle(
                color:  Theme.of(context).colorScheme.primary,
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
            color:  Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
            S.of(context).onboardingPageThreeBody,
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
