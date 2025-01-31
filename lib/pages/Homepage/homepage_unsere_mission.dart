import 'package:flutter/material.dart';
import 'package:femalefellows/generated/l10n.dart';


class Mission extends StatelessWidget {
  const Mission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView(
        children: [
          Stack(
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
                                Theme.of(context).colorScheme.primary,
                            mini: true,
                            child: Icon(
                              Icons.cancel_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Text(
                        S.of(context)!.homeVereinInfoOneTitle,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Divider(
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
                           S.of(context)!.homeVereinInfoOneBody,
                           style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Image.asset(
                    'lib/images/Onboarding – Step 3_ Community.png'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
