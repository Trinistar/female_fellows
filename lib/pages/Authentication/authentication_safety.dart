import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef bool hasConfessed(bool newValue);

typedef void BoolCallback(bool id);

class AuthSafety extends StatefulWidget {
  AuthSafety(
      {super.key, required this.hasConfessed, required this.onSettingsChanged});

  final void Function(bool)? hasConfessed;

  final BoolCallback onSettingsChanged;

  @override
  State<AuthSafety> createState() => _AuthSafetyState();
}

class _AuthSafetyState extends State<AuthSafety> {
  // Checkbox Radio
  bool _question = false;

  bool _question2 = false;

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
                AppLocalizations.of(context)!.authenticationSafetyTitle,
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
                  backgroundImage: AssetImage('lib/images/Anmelden.png'),
                  radius: 100,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: 350,
                  child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title: Text(
                        AppLocalizations.of(context)!.authenticationNewsletter,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      value: _question,
                      onChanged: (newsletter) {
                        setState(() {
                          _question = newsletter ?? false;

                          //widget.onSettingsChanged(_question);
                        });
                      }),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: 350,
                  child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Tandementry(),
                        )),
                        child: Text(
                          AppLocalizations.of(context)!.authenticationAGBS,
                         style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      value: _question2,
                      onChanged: (newValue) {
                        setState(() {
                          _question2 = newValue ?? false;
                          widget.hasConfessed!(_question2);
                        });
                      }),
                ),
              ),
          /*     Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: 350,
                  child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title: Text(
                        'Ich habe die AGB`s von\nFemale Fellows gelesen und stimme zu. ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      value: _question3,
                      onChanged: (newValue) {
                        setState(() {
                          _question3 = newValue ?? false;
                          widget.hasConfessed!(_question2, _question3);
                        });
                      }),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
