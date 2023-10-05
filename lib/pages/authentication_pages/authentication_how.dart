import 'package:flutter/material.dart';

class AuthHow extends StatefulWidget {
  const AuthHow({super.key});

  @override
  State<AuthHow> createState() => _AuthHowState();
}

class _AuthHowState extends State<AuthHow> {
  //namecontroller
  final nameController = TextEditingController();
  //bool for checklist
  String? question;

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
                    color: Color.fromRGBO(27, 25, 86, 1),
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
                  backgroundColor: Color.fromRGBO(252, 208, 220, 1),
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
                        title: Text('Instagram',style: TextStyle(
                  fontSize: 15,
                ),),
                        value: "Instagram",
                        groupValue: question,
                        onChanged: (newValue) {
                          setState(() {
                            question = newValue;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text('Facebook',style: TextStyle(
                  fontSize: 15,
                ),),
                        value: "Facebook",
                        groupValue: question,
                        onChanged: (newValue) {
                          setState(() {
                            question = newValue;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text('Linkedin',style: TextStyle(
                  fontSize: 15,
                ),),
                        value: "Linkedin",
                        groupValue: question,
                        onChanged: (newValue) {
                          setState(() {
                            question = newValue;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text('Presse/Zeitung',style: TextStyle(
                  fontSize: 15,
                ),),
                        value: "Presse/Zeitung",
                        groupValue: question,
                        onChanged: (newValue) {
                          setState(() {
                            question = newValue;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text('Freunde',style: TextStyle(
                  fontSize: 15,
                ),),
                        value: "Freunde",
                        groupValue: question,
                        onChanged: (newValue) {
                          setState(() {
                            question = newValue;
                          });
                        }),
                    RadioListTile(
                        dense: true,
                        title: Text('Sonstiges',style: TextStyle(
                  fontSize: 15,
                ),),
                        value: "Sonstiges",
                        groupValue: question,
                        onChanged: (newValue) {
                          setState(() {
                            question = newValue;
                          });
                        })
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
