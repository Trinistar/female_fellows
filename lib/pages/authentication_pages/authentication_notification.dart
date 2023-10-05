import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';

class AuthNotification extends StatefulWidget {
  const AuthNotification({super.key});

  @override
  State<AuthNotification> createState() => _AuthNotificationState();
}

class _AuthNotificationState extends State<AuthNotification> {
  //namecheck
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  String? question;

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
                'Wie können wir dich\nerreichen?',
                style: TextStyle(
                  color: Color.fromRGBO(27, 25, 86, 1),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/Group 377.png'),
                radius: 100,
                backgroundColor: Color.fromRGBO(252, 208, 220, 1),
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    bottom: 5,
                  ),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: nameController,
                  hintText: 'lisa@muster.de',
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5),
                  child: Text(
                    'Handynummer',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: numberController,
                  hintText: '+49 123 456',
                  obscureText: false,
                ),
              ],
            ),
            SizedBox(height: 10,)
            ,
            Row(
              children: [
                    Expanded(child: 
                 RadioListTile(
                              contentPadding: EdgeInsets.only(left:40),
                        title: Text('Anruf'),
                          value: "Anruf",
                          groupValue: question,
                          onChanged: (newValue) {
                            setState(() {
                              question = newValue;
                            });
                          }),
                ),
                Expanded(child: 
                 RadioListTile(
                               contentPadding: EdgeInsets.only(left:5),
                        title: Text('Whatsapp'),
                          value: "Whatsapp",
                          groupValue: question,
                          onChanged: (newValue) {
                            setState(() {
                              question = newValue;
                            });
                          }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
