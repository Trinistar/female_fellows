import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/pages/Event/EventSignup/event_authentication_translation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EventPictureAuthentication extends StatefulWidget {
  const EventPictureAuthentication(
      {super.key, required this.event, this.sendRequest, this.mediaConsent});

  final Event event;
  final void Function()? sendRequest;
  final void Function(bool)? mediaConsent;

  @override
  State<EventPictureAuthentication> createState() =>
      _EventPictureAuthenticationState();
}

class _EventPictureAuthenticationState
    extends State<EventPictureAuthentication> {
  late RadioChoices _choices;

  @override
  void initState() {
    _choices = RadioChoices.ja;
    widget.mediaConsent!(true);
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
              AppLocalizations.of(context)!.eventRegistrationThreeTitle,
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
              radius: 50,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset('lib/images/fotoeinwilligung.svg'),
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
                      AppLocalizations.of(context)!.eventRegistrationTwoFilterTwo,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.eventRegistrationThreeFilterTwo,
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
                      AppLocalizations.of(context)!.eventRegistrationTwoFilterOne,
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
                  text: AppLocalizations.of(context)!.eventButtonSignin,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
