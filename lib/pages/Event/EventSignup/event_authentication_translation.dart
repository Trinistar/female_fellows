import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class EventTranslationAuthentication extends StatefulWidget {
  const EventTranslationAuthentication({super.key});

  @override
  State<EventTranslationAuthentication> createState() => _EventTranslationAuthenticationState();
}

bool _language = false;
String? question;

class _EventTranslationAuthenticationState extends State<EventTranslationAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Brauchst du eine\nDolmecherin beim\nEvent?',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/images/dolmetcher.png'),
              radius: 100,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                RadioListTile(
                    dense: true,
                    title: Text(
                      'Ja',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    value: "Ja",
                    groupValue: question,
                    onChanged: (answer) {
                      setState(() {
                        question = answer;
                        _language = true;
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
                    value: "Nein",
                    groupValue: question,
                    onChanged: (answer) {
                      setState(() {
                        question = answer;
                        _language = false;
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                _language
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Sprache',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          TextBar(
                            controller: Controller.languageController,
                            hintText: 'englisch',
                            obscureText: false,
                            onChange: null,
                            validator: null,
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
