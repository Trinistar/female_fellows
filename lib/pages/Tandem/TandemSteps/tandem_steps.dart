import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:femalefellows/pages/Tandem/TandemSteps/tandem_first_step.dart';
import 'package:femalefellows/pages/Tandem/TandemSteps/tandem_second_step.dart';
import 'package:femalefellows/pages/Tandem/TandemSteps/tandem_third_step.dart';
import 'package:femalefellows/generated/l10n.dart';

class TandemSteps extends StatelessWidget {
  const TandemSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20)),
                height: 75,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                leading: SvgPicture.asset('lib/images/mitglied-werden.svg',width: 120,height: 120,),
                title: Text(S.of(context)!.tandemFirstStep,),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Firststep()));
                    },
                    icon: Icon(Icons.add)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20)),
                height: 75,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                leading: SvgPicture.asset('lib/images/tandem-matching.svg',width: 120,height: 120,),
                title:
                    Text(S.of(context)!.tandemSecondStepnoslash),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondStep()));
                    },
                    icon: Icon(Icons.add)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20)),
                height: 75,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                leading: SvgPicture.asset('lib/images/kennen-lernen.svg',width: 140,height: 140,),
                title: Text(S.of(context)!.tandemThirdStep),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ThirdStep()));
                    },
                    icon: Icon(Icons.add)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
