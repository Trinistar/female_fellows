import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/services/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthNotification extends StatefulWidget {
  const AuthNotification({super.key});

  @override
  State<AuthNotification> createState() => _AuthNotificationState();
}

class _AuthNotificationState extends State<AuthNotification> {
  //namecheck
  bool _whatsapp = false;
  bool _number = false;
  bool _email = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    title: Text(AppLocalizations.of(context)!.authenticationCall),
                    value: _number,
                    onChanged: (newValue) {
                      setState(() {
                        _number = newValue ?? false;
                      });
                    }),
                CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.only(left: 40),
                    title: Text(AppLocalizations.of(context)!.authenticationWhatsApp),
                    value: _whatsapp,
                    onChanged: (newValue) {
                      setState(() {
                        _whatsapp = newValue ?? false;
                      });
                    }),
                CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.only(left: 40),
                    title: Text(AppLocalizations.of(context)!.authenticationEmail),
                    value: _email,
                    onChanged: (newValue) {
                      setState(() {
                        _email = newValue ?? false;
                      });
                    }),

                _number || _whatsapp
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

                _number || _whatsapp
                    ? TextBar(
                        controller: Controller.phonenumberController,
                        hintText: '+49 123 456',
                        obscureText: false,
                        onChange: null,
                        validator: null,
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
