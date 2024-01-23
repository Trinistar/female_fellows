import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_entry.dart';

class SecondStep extends StatelessWidget {
  const SecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          Center(
            child: SvgPicture.asset(
              'lib/images/tandem-matching.svg',
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2 | Der Tandem-\nMatching-Prozess:',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Divider(
                  thickness: 5,
                  indent: 0,
                  endIndent: 280,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Nach deiner Registrierung erhältst du drei auf dich abgestimmte Tandem-Vorschläge. Du hast die Wahl und kannst das Tandem auswählen, das am besten zu deinen Interessen und Zielen passt. Innerhalb von 24 Stunden erhältst du eine Benachrichtigung, ob deine Tandem-Partnerin ebenfalls zustimmt. Dies ist der Moment, in dem eure Reise beginnt.',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegistrationEntry()));
            },
            child: Container(
              padding: EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Center(
                  child: Text(
                'Jetzt mit Tandem matchen',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
            ),
          ),
            SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
