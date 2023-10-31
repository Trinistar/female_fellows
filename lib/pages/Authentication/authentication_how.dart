import 'package:flutter/material.dart';

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
                  'Wie bist du auf uns\naufmerksam geworden?',
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
                          'Instagram',
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
                          'Facebook',
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
                          'Linkedin',
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
                          'Presse/Zeitung',
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
                          'Freunde',
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
                          'Sonstiges',
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
