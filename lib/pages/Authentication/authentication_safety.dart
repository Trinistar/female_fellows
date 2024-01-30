import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef void BoolCallback(bool id);

class AuthSafety extends StatefulWidget {
  AuthSafety(
      {super.key,
      required this.hasConfessed,
      required this.onSettingsChanged,
      required this.wantsNewsletter});

  final void Function(bool)? hasConfessed;
  final void Function(bool)? wantsNewsletter;

  final BoolCallback onSettingsChanged;

  @override
  State<AuthSafety> createState() => _AuthSafetyState();
}

class _AuthSafetyState extends State<AuthSafety> {
  // Checkbox Radio
  bool _checkNewsletter = false;
  bool _question2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
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
            
              radius: 100,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset('lib/images/datenschutz.svg'),
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
                  value: _checkNewsletter,
                  onChanged: (newsletter) {
                    setState(() {
                      _checkNewsletter = newsletter ?? false;
                      widget.wantsNewsletter!(_checkNewsletter);
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
        ],
      ),
    );
  }
}
