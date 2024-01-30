import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:language_picker/languages.dart';
import 'package:vs_femalefellows/models/event_participant.dart';

enum RadioChoices { ja, nein }

class EventTranslationAuthentication extends StatefulWidget {
  const EventTranslationAuthentication({super.key, this.needsTranslator});

  final void Function(Interpreter)? needsTranslator;

  @override
  State<EventTranslationAuthentication> createState() =>
      _EventTranslationAuthenticationState();
}

class _EventTranslationAuthenticationState
    extends State<EventTranslationAuthentication> {
  RadioChoices _choices = RadioChoices.nein;
  late Language _lang;

  @override
  void initState() {
    _lang = Languages.german;
    widget.needsTranslator!(Interpreter(needed: false, language: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Brauchst du eine Dolmetcherin beim Event?',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset('lib/images/dolmetcher.svg'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                RadioListTile(
                    dense: true,
                    title: Text(
                      'Ja',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    value: RadioChoices.ja,
                    groupValue: _choices,
                    onChanged: (answer) {
                      setState(() {
                        _choices = answer!;
                        widget.needsTranslator!(
                            Interpreter(needed: true, language: _lang.name));
                      });
                    }),
                RadioListTile(
                    dense: true,
                    title: Text(
                      'Nein',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    value: RadioChoices.nein,
                    groupValue: _choices,
                    onChanged: (answer) {
                      setState(() {
                        _choices = answer!;
                        widget.needsTranslator!(
                            Interpreter(needed: false, language: ''));
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                _choices == RadioChoices.ja
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sprache',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          DropdownMenu<Language>(
                            initialSelection: Languages.german,
                            dropdownMenuEntries:
                                Languages.defaultLanguages.map((Language lang) {
                              return DropdownMenuEntry<Language>(
                                  value: lang, label: lang.name);
                            }).toList(),
                            onSelected: (value) {
                              setState(() {
                                _lang = value!;
                                widget.needsTranslator!(Interpreter(
                                    needed: true, language: _lang.name));
                              });
                            },
                          ),
                        ],
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
