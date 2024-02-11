import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_Listtile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  final List<String> _faqTitles = [
/*    AppLocalizations.of(context)!.tandemLocalsQuestion1,
   AppLocalizations.of(context)!.tandemLocalsQuestion2,
   AppLocalizations.of(context)!.tandemLocalsQuestion3,
   AppLocalizations.of(context)!.tandemLocalsQuestion4,
   AppLocalizations.of(context)!.tandemLocalsQuestion5,
   AppLocalizations.of(context)!.tandemLocalsQuestion6,
   AppLocalizations.of(context)!.tandemLocalsQuestion7,
   AppLocalizations.of(context)!.tandemLocalsQuestion8,
   AppLocalizations.of(context)!.tandemLocalsQuestion9,
   AppLocalizations.of(context)!.tandemLocalsQuestion10,
   AppLocalizations.of(context)!.tandemLocalsQuestion11,
    */
    '1 | Was muss ich tun um eine Tandem-Partnerin zu bekommen?',
    '2 | Wie geht es weiter, wenn mir eine Tandem-Partnerin vermittelt wurde?',
    '3 | Was ist der Unterschied zwischen einer Newcomerin und Local?',
    '4 | Mit wie viel Zeitaufwand ist eine Tandem-Partnerschaft ungefähr verbunden?',
    '5 | Ich suche nach einer Wohnung, kann mir eine Tandem-Partnerin helfen?',
    '6 | Ich möchte meinen Führerschein machen und dann eine Ausbildung, kann mir eine Tandem-Partnerin dabei helfen?',
    '7 | Ich kann schlecht Deutsch und auch kein Englisch, wie kann ich mich dann mit einer Tandem-Partnerin verständigen?',
    '8 | Mir fällt es schwer in Deutschland zurecht zu kommen (Behörden, Arzt…?), kann mir eine Tandem-Partnerin helfen?',
    '9 | Wie kann die Tandem-Partnerin mir helfen?',
    '10 | Meine Tandem-Partnerin meldet sich nicht mehr. Was soll ich tun?',
  ];

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
              SizedBox(
                height: 1200,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _faqTitles.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return TandemFAQListTileWidget(
                      faqTitle: _faqTitles[index],
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
