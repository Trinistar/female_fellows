import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:femalefellows/generated/l10n.dart';


class FemPower extends StatelessWidget {
  const FemPower({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 300),
                      child: FloatingActionButton(
                        elevation: 0,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          mini: true,
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Text(
                      'Fempowerment',
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                      thickness: 5,
                      endIndent: 310,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 420,
                        width: 320,
                        child: Text(
                        S.of(context).homeVereinInfoTwoBody),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 72),
                      child: Image.asset('lib/images/kugeln.png'),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
