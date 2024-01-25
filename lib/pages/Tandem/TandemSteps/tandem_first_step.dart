import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_entry.dart';

class Firststep extends StatelessWidget {
  const Firststep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: ListView(
        children: [
          Center(
            child: SvgPicture.asset(
              'lib/images/mitglied-werden.svg',
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
                  '1 | Werde Mitglied in unserem Verein',
                  style: TextStyle(fontSize: 25),
                ),
                Divider(
                  thickness: 5,
                  indent: 0,
                  endIndent: 280,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Deine Reise beginnt, indem du Mitglied bei uns wirst. Nur als Mitglied hast du die Möglichkeit, dich für ein Tandem-Matching zu registrieren. Das ist der erste Schritt, um Teil unserer wachsenden Community zu werden.',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrationEntry()));},
            child: Container(
              padding: EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                  child: Text(
                'Jetzt Mietglied werden',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
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
