import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_translation.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EventChildCareAuthentication extends StatefulWidget {
  const EventChildCareAuthentication({super.key, this.needsChildCare});

  final void Function(ChildCare)? needsChildCare;

  @override
  State<EventChildCareAuthentication> createState() =>
      _EventChildCareAuthenticationState();
}

class _EventChildCareAuthenticationState
    extends State<EventChildCareAuthentication> {
  RadioChoices _choices = RadioChoices.nein;

  @override
  void initState() {
    widget.needsChildCare!(ChildCare(needed: false, childName: ''));
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
              AppLocalizations.of(context)!.eventRegistrationTwoTitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset('lib/images/kinderbetreuung.svg'),
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
                      AppLocalizations.of(context)!.eventRegistrationTwoFilterTwo,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    value: RadioChoices.ja,
                    groupValue: _choices,
                    onChanged: (answer) {
                      setState(() {
                        _choices = answer!;
                        widget.needsChildCare!(ChildCare(
                            needed: true,
                            childName: Controller.childNameController.text));
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
                        widget.needsChildCare!(
                            ChildCare(needed: false, childName: ''));
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
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              AppLocalizations.of(context)!.eventRegistrationTwoFieldTwo,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          TextBar(
                            controller: Controller.childNameController,
                            hintText: AppLocalizations.of(context)!.eventRegistrationTwoFieldTwo1,
                            obscureText: false,
                            onChange: (String text) => widget.needsChildCare!(
                                ChildCare(needed: true, childName: text)),
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
