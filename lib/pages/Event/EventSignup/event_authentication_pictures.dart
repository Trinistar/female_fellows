import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_translation.dart';

class EventPictureAuthentication extends StatefulWidget {
  const EventPictureAuthentication({super.key, required this.event, this.sendRequest, this.mediaConsent});

  final Event event;
  final void Function()? sendRequest;
  final void Function(bool)? mediaConsent;

  @override
  State<EventPictureAuthentication> createState() => _EventPictureAuthenticationState();
}

class _EventPictureAuthenticationState extends State<EventPictureAuthentication> {
  late RadioChoices _choices;

  @override
  void initState() {
    _choices = RadioChoices.nein;
    widget.mediaConsent!(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Fotoeinwilligung\nbeim Event?',
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
              backgroundImage: AssetImage('lib/images/fotoeinwilligung.png'),
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                RadioListTile(
                    dense: true,
                    isThreeLine: true,
                    title: Text(
                      'Ja',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      'Ich bin damit einverstanden, dass Female Fellows e.V.\n(nachfolgend bezeichnet als "Verein")\nFilmaufnahmen/Fotos von mir zum Zwecke der\nPresse- und Öffentlichkeitsarbeit des Fundraisings\ndes Marketings der internen Verwendung von\nWerbemaßnahmen und eventuellen\nSpendeaktionen verabeiter und veröffentlicht\n werden dürfen. Ebenfalls bin ich einverstanden, dass\nmeine Daten zum Zwecke der Vereinsorganisation\ngespeichert werden. Ebenefalls bin ich einverstanden,\ndass meine Daten zum Zwecke der\nVereinsorganisation gespeichert werden.',
                      style: TextStyle(fontSize: 10),
                    ),
                    value: RadioChoices.ja,
                    groupValue: _choices,
                    onChanged: (answer) {
                      setState(() {
                        _choices = answer!;
                        widget.mediaConsent!(true);
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
                        widget.mediaConsent!(false);
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                FFButton(
                  onTap: () {
                    widget.sendRequest!();
                  },
                  text: 'Verbindlich anmelden',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
