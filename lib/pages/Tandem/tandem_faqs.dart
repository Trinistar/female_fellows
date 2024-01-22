import 'package:flutter/material.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FAQ´s',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 310,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                    '1 | Was muss ich tun um ein Tandem-Partnerin (deutsche Freundin)zu bekommen?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              ListTile(
                title: Text(
                    '2 | Wie geht es weiter, wenn mir eine Tandem-Partnerin vermittelt wurde?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
                ListTile(
                title: Text(
                    '3 | Was ist der Unterschied zwischen einer Newcomerin und Local?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
                ListTile(
                title: Text(
                    '4 | Mit wie viel Zeitaufwand ist eine Tandem-Partnerschaft ungefähr verbunden?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
                ListTile(
                title: Text(
                    '5 | Ich suche nach einer Wohnung, kann mir eine Tandem-Partnerin helfen?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
                ListTile(
                title: Text(
                    '6 | Ich möchte meinen Führerschein machen und dann eine Ausbildung, kann mir eine Tandem-Partnerin helfen?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),  ListTile(
                title: Text(
                    '7 | Ich kann schlecht Deutsch und auch kein Englisch, wie kann ich mich dann mit einer Tandem-Partnerin verständigen?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),  ListTile(
                title: Text(
                    '8 | Mir fällt es schwer in Deutschland zurecht zu kommen (Behörden, Arzt...?),kann mir eine Tandem-Partnerin helfen? '),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),  ListTile(
                title: Text(
                    '9 | Wie kann die Tandem-Partnerin mir helfen?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
               ListTile(
                title: Text(
                    '10 | Meine Tandem-Partnerin meldet sich nicht mehr. Was soll ich tun?'),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Divider(
                thickness: 3,
                indent: 0,
                endIndent: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ]),
      ),
    );
  }
}
