import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/provider/controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthAdress extends StatefulWidget {
  const AuthAdress({super.key});

  @override
  State<AuthAdress> createState() => _AuthAdressState();
}

class _AuthAdressState extends State<AuthAdress> {
  //namecontroller

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
              AppLocalizations.of(context)!.authenticationPlace,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/images/Location.png'),
              radius: 100,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          //TODO inputvalidierung für Plichtfelder
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 5),
                child: Text(
                  AppLocalizations.of(context)!.authenticationStreet,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              TextBar(
                controller: Controller.streetnameController,
                hintText: 'Mustersraße 1',
                obscureText: false,
                onChange: null,
                validator: null,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 5),
                child: Text(
                  AppLocalizations.of(context)!.authenticationPostcode,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 55),
                      child: TextField(
                        controller: Controller.zipCodeController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                            // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Theme.of(context).colorScheme.surface,
                          filled: true,
                          hintText: '35510',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: TextField(
                        controller: Controller.placeController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                            // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Theme.of(context).colorScheme.surface,
                          filled: true,
                          hintText: 'Wohnort',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
