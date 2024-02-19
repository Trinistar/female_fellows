import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_Listtile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  late List<String> _faqAnswers = [
    'Auch hier ist es wichtig, dass du sowohl mit deiner Partnerin als auch mit uns darüber sprichst. Gerne kümmern wir uns darum, dass deine Partnerin wieder eine neue Tandempartnerin findet. Vielleicht hast du ja eine Freundin, die das Tandem übernehmen möchte?',
    'Wenn deine Partnerin nicht mehr auf deine Anrufe oder Nachrichten reagiert, gib uns gerne Bescheid. Wir versuchen dann herauszufinden, was los ist und zwischen euch zu vermitteln. Manchmal liegt es am mangelnden Internet in den Unterkünften, manchmal traut sie sich nicht, das Tandem zu beenden. In jedem Fall möchten wir mit euch darüber sprechen und euch bestmöglich in eurem Tandem unterstützen.',
  ];

  late List<String> _faqTitles = [
    '5 | Meine Tandempartnerin meldet sich nicht mehr, was soll ich tun?',
    '6 | Ich ziehe um. Was passiert mit meiner Tandempartnerschaft?',
  ];

  @override
  void initState() {
 /*    _faqTitles = [
      AppLocalizations.of(context)!.tandemLocalsQuestion1,
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
    ]; */
    /*     _faqAnswers = [
      AppLocalizations.of(context)!.tandemLocalsAnswer1,
      AppLocalizations.of(context)!.tandemLocalsAnswer2,
      AppLocalizations.of(context)!.tandemLocalsAnswer3,
      AppLocalizations.of(context)!.tandemLocalsAnswer4,
      AppLocalizations.of(context)!.tandemLocalsAnswer5,
      AppLocalizations.of(context)!.tandemLocalsAnswer6,
      AppLocalizations.of(context)!.tandemLocalsAnswer7,
      AppLocalizations.of(context)!.tandemLocalsAnswer8,
      AppLocalizations.of(context)!.tandemLocalsAnswer9,
      AppLocalizations.of(context)!.tandemLocalsAnswer10,
      AppLocalizations.of(context)!.tandemLocalsAnswer11,
    ]; */
    super.initState();
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
