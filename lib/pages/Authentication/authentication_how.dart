import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthHow extends StatefulWidget {
  const AuthHow({super.key});

  @override
  State<AuthHow> createState() => _AuthHowState();
}

enum Socialmedia {
  insta,
  facebook,
  linkedin,
  newspaper,
  friends,
  everythingelse
}

class _AuthHowState extends State<AuthHow> {
  //namecontroller
  final nameController = TextEditingController();
  //bool for checklist
  Socialmedia? _socialmedia;
  bool? checkbox= false ;

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
                   AppLocalizations.of(context)!.authenticationHow,
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
                  backgroundImage: AssetImage('lib/images/Notification.png'),
                  radius: 100,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  children: [
                    RadioListTile(
                        dense: true,
                        title: Text(
                          AppLocalizations.of(context)!.authenticationInstagram,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: Socialmedia.insta,
                        groupValue: _socialmedia,
                        onChanged: (Socialmedia? value) {
                          setState(() {
                            _socialmedia = value;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text(
              AppLocalizations.of(context)!.authenticationFacebook,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: Socialmedia.facebook,
                        groupValue: _socialmedia,
                        onChanged: (Socialmedia? value) {
                          setState(() {
                            _socialmedia = value;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text(
                         AppLocalizations.of(context)!.authenticationLinkedin,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: Socialmedia.linkedin,
                        groupValue: _socialmedia,
                        onChanged: (Socialmedia? value) {
                          setState(() {
                            _socialmedia = value;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text(
                       AppLocalizations.of(context)!.authenticationPresse,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: Socialmedia.newspaper,
                        groupValue: _socialmedia,
                        onChanged: (Socialmedia? value) {
                          setState(() {
                            _socialmedia = value;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text(
                        AppLocalizations.of(context)!.authenticationFreunde,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: Socialmedia.friends,
                        groupValue: _socialmedia,
                        onChanged: (Socialmedia? value) {
                          setState(() {
                            _socialmedia = value;
                            print(value);
                          });
                        }),
                     RadioListTile(
                        dense: true,
                        title: Text(
                       AppLocalizations.of(context)!.authenticationSonstiges,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: Socialmedia.everythingelse,
                        groupValue: _socialmedia,
                        onChanged: (Socialmedia? value) {
                          setState(() {
                            _socialmedia = value;
                          });
                        }), 
                
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
