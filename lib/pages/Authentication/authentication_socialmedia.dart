import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/models/enums.dart';


class AuthSocialmedia extends StatefulWidget {
  const AuthSocialmedia({super.key, required this.hasMediaChosen});

    final void Function(Socialmedia)? hasMediaChosen;

  @override
  State<AuthSocialmedia> createState() => _AuthSocialmediaState();
}

class _AuthSocialmediaState extends State<AuthSocialmedia> {
  //bool for checklist
  Socialmedia? _socialmedia;
  bool? checkbox= false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
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
      
              radius: 100,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset('lib/images/aufmerksamkeit.svg'),
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
                        widget.hasMediaChosen!(Socialmedia.insta);
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
                         widget.hasMediaChosen!(Socialmedia.facebook);
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
                         widget.hasMediaChosen!(Socialmedia.linkedin);
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
                         widget.hasMediaChosen!(Socialmedia.newspaper);
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
                       widget.hasMediaChosen!(Socialmedia.friends);
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
                         widget.hasMediaChosen!(Socialmedia.everythingelse);
                      });
                    }), 
            
              ],
            ),
          )
        ],
      ),
    );
  }
}
