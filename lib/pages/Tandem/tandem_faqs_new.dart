import 'package:flutter/material.dart';
import 'package:femalefellows/pages/Tandem/tandem_Listtile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FAQsNew extends StatefulWidget {
  const FAQsNew({super.key});

  @override
  State<FAQsNew> createState() => _FAQsNewState();
}

class _FAQsNewState extends State<FAQsNew> {
  late List<String> _faqAnswers = [
    /*    'Auch hier ist es wichtig, dass du sowohl mit deiner Partnerin als auch mit uns darüber sprichst. Gerne kümmern wir uns darum, dass deine Partnerin wieder eine neue Tandempartnerin findet. Vielleicht hast du ja eine Freundin, die das Tandem übernehmen möchte?',
    'Wenn deine Partnerin nicht mehr auf deine Anrufe oder Nachrichten reagiert, gib uns gerne Bescheid. Wir versuchen dann herauszufinden, was los ist und zwischen euch zu vermitteln. Manchmal liegt es am mangelnden Internet in den Unterkünften, manchmal traut sie sich nicht, das Tandem zu beenden. In jedem Fall möchten wir mit euch darüber sprechen und euch bestmöglich in eurem Tandem unterstützen.',
  */
  ];

  late List<String> _faqTitles = [
    /*   '5 | Meine Tandempartnerin meldet sich nicht mehr, was soll ich tun?',
    '6 | Ich ziehe um. Was passiert mit meiner Tandempartnerschaft?', */
  ];
  @override
  void didChangeDependencies() {
    _faqTitles = [
      AppLocalizations.of(context)!.tandemNewComerQuestion1,
      AppLocalizations.of(context)!.tandemNewComerQuestion2,
      AppLocalizations.of(context)!.tandemNewComerQuestion3,
      AppLocalizations.of(context)!.tandemNewComerQuestion4,
      AppLocalizations.of(context)!.tandemNewComerQuestion5,
      AppLocalizations.of(context)!.tandemNewComerQuestion6,
      AppLocalizations.of(context)!.tandemNewComerQuestion7,
      AppLocalizations.of(context)!.tandemNewComerQuestion8,
      AppLocalizations.of(context)!.tandemNewComerQuestion9,
   
    ];

    _faqAnswers = [
      AppLocalizations.of(context)!.tandemNewComerAnswer1,
      AppLocalizations.of(context)!.tandemNewComerAnswer2,
      AppLocalizations.of(context)!.tandemNewComerAnswer3,
      AppLocalizations.of(context)!.tandemNewComerAnswer4,
      AppLocalizations.of(context)!.tandemNewComerAnswer5,
      AppLocalizations.of(context)!.tandemNewComerAnswer6,
      AppLocalizations.of(context)!.tandemNewComerAnswer7,
      AppLocalizations.of(context)!.tandemNewComerAnswer8,
      AppLocalizations.of(context)!.tandemNewComerAnswer9,
    ];

    super.didChangeDependencies();
  }



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
                      faqAnswers: _faqAnswers[index],
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
