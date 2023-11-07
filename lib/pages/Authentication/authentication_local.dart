import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef bool hasChoosed( String LocalOrNot);

typedef void BoolCallback(bool id);

class Authlocal extends StatefulWidget {
 Authlocal({super.key, required this.onSettingsChanged, required this.hasChoosed});

  final void Function(LocalOrNot)? hasChoosed;

  final BoolCallback onSettingsChanged;

  @override
  State<Authlocal> createState() => _AuthlocalState();
}

enum LocalOrNot {
  local,
  newcomer,
}

class _AuthlocalState extends State<Authlocal> {
  LocalOrNot? localOrNot;

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
                  backgroundImage: AssetImage('lib/images/Group 377.png'),
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
                  child: RadioListTile(
                      isThreeLine: true,
                      groupValue: localOrNot,
                      dense: true,
                      title: Text(
                        AppLocalizations.of(context)!
                            .authenticationNewcomerTitle,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      subtitle: Text(
                          AppLocalizations.of(context)!.authenticationNewcomer),
                      value: LocalOrNot.newcomer,
                      onChanged: (newValue) {
                        setState(() {
                          localOrNot = newValue;
                                widget.hasChoosed!(LocalOrNot.newcomer);

                          //widget.onSettingsChanged(_question);
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
                  child: RadioListTile(
                      isThreeLine: true,
                      groupValue: localOrNot,
                      dense: true,
                      title: Text(
                        AppLocalizations.of(context)!.authenticationLocalTitle,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      subtitle: Text(
                          AppLocalizations.of(context)!.authenticationLocal),
                      value: LocalOrNot.local,
                      onChanged: (newValue) {
                        setState(() {
                          localOrNot = newValue;
                           widget.hasChoosed!(LocalOrNot.local);
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
