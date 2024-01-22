import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class AuthNotification extends StatefulWidget {
  const AuthNotification({super.key,required this.choiceContact});
  final void Function (bool ,bool ,bool)? choiceContact;

  @override
  State<AuthNotification> createState() => _AuthNotificationState();
}

class _AuthNotificationState extends State<AuthNotification> {
  //namecheck
  bool _whatsapp = false;
  bool _call = false;
  bool _email = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
            ),
            child: Text(
              AppLocalizations.of(context)!.authenticationNotificationTitle,
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
              backgroundImage: AssetImage('lib/images/Group 377.png'),
              radius: 100,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.only(left: 40),
                  title:
                      Text(AppLocalizations.of(context)!.authenticationCall),
                  value: _call,
                  onChanged: (choice) {
                    setState(() {
                      _call = choice ?? false;
                              widget.choiceContact!(_call,_whatsapp,_email);   
                    });
                  }),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.only(left: 40),
                  title: Text(
                      AppLocalizations.of(context)!.authenticationWhatsApp),
                  value: _whatsapp,
                  onChanged: (choice) {
                    setState(() {
                      _whatsapp = choice ?? false;
                           widget.choiceContact!(_call,_whatsapp,_email);
                    });
                  }),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.only(left: 40),
                  title:
                      Text(AppLocalizations.of(context)!.authenticationEmail),
                  value: _email,
                  onChanged: (choice) {
                    setState(() {
                      _email = choice ?? false;
                              widget.choiceContact!(_call,_whatsapp,_email);
                    });
                  }),
              _call || _whatsapp
                  ? Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 5),
                      child: Text(
                        AppLocalizations.of(context)!.authenticationHandy,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    )
                  : Container(),
              _call || _whatsapp
                  ? BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        return TextBar(
                          controller: Controller.phonenumberController,
                          hintText: '+49 123 456',
                          obscureText: false,
                          onChange: (value) => context
                              .read<AuthenticationBloc>()
                              .add(InputChanged(
                                phonenumber: value,
                              )),
                          validator: null,
                        );
                      },
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
