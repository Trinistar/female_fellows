import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class EventKidsAuthentication extends StatefulWidget {
  const EventKidsAuthentication({super.key});

  @override
  State<EventKidsAuthentication> createState() =>
      _EventKidsAuthenticationState();
}

bool _kids = false;
String? question;

class _EventKidsAuthenticationState extends State<EventKidsAuthentication> {
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
                  'Brauchst du eine\nKinderbetreuung?',
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
                  backgroundImage: AssetImage('lib/images/kinder.png'),
                  radius: 100,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
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
                          'Ja',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: "Ja",
                        groupValue: question,
                        onChanged: (answer) {
                          setState(() {
                            question = answer;
                            _kids = true;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text(
                          'Nein',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: "Nein",
                        groupValue: question,
                        onChanged: (answer) {
                          setState(() {
                            question = answer;
                            _kids = false;
                          });
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    _kids
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Text(
                                  'Name des Kindes',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              TextBar(
                                controller: Controller.childNameController,
                                hintText: 'Name',
                                obscureText: false,
                                onChange: null,
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
        ),
      ),
    );
  }
}
