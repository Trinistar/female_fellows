import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                leading: SvgPicture.asset('lib/images/mitglied-werden.svg'),
                title: Text('1 | Werde Mietglied in unserem Verein'),
                trailing: IconButton(onPressed: null, icon: Icon(Icons.add)),
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
                leading: SvgPicture.asset('lib/images/tandem-matching.svg'),
                title: Text('2 | Der Tandem-Matching-Prozess'),
                trailing: IconButton(onPressed: null, icon: Icon(Icons.add)),
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
                leading: SvgPicture.asset('lib/images/kennen-lernen.svg'),
                title: Text('3 | Das Kennenlernen'),
                trailing: IconButton(onPressed: null, icon: Icon(Icons.add)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
