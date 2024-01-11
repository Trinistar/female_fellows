import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_success.dart';

class EventPictureAuthentication extends StatefulWidget {
  const EventPictureAuthentication({super.key, required this.event});
  final Event event;

  @override
  State<EventPictureAuthentication> createState() => _EventPictureAuthenticationState();
}

bool _pictures = false;
String? _question;

class _EventPictureAuthenticationState extends State<EventPictureAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  radius: 100,
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
                        title: Text(
                          'Ja',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: "Ja",
                        groupValue: _question,
                        onChanged: (answer) {
                          setState(() {
                            _question = answer;
                            _pictures = true;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        isThreeLine: true,
                        title: Text(
                          'Nein',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text(
                          'ich bin damit einverstanden, dass Female Fellows e.V.\n(nachfolgend bezeichnet als "Verein")\nFilmaufnahmen/Fotos von mir zum Zwecke der\nPresse- und Öffentlichkeitsarbeit des Fundraisings\ndes Marketings der internen Verwendung von\nWerbemaßnahmen und eventuellen\nSpendeaktionen verabeiter und veröffentlicht\n werden dürfen. Ebenfalls bin ich einverstanden, dass\nmeine Daten zum Zwecke der Vereinsorganisation\ngespeichert werden. Ebenefalls bin ich einverstanden,\ndass meine Daten zum Zwecke der\nVereinsorganisation gespeichert werden.',
                          style: TextStyle(fontSize: 10),
                        ),
                        value: "Nein",
                        groupValue: _question,
                        onChanged: (answer) {
                          setState(() {
                            _question = answer;
                            _pictures = false;
                          });
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    FFButton(
                      onTap: () {
                        if (BlocProvider.of<AuthenticationBloc>(context).state is AuthenticatedUser) {
                          final String userId = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).user!.uid;
                          final EventParticipant eventParticipant = EventParticipant(participating: true, userId: userId, interpreter: Interpreter(needed: true, language: 'English'), childCare: ChildCare(needed: false, childName: null), mediaConsent: true);
                          context.read<AuthenticationBloc>().add(SetEventParticipationEvent(eventId: widget.event.eventId!, userId: userId, eventParticipant: eventParticipant));
                        }
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventSuccess(event: widget.event)));
                      },
                      text: 'Verbindlich anmelden',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
