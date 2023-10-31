import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/services/controller.dart';

class AuthNotification extends StatefulWidget {
  const AuthNotification({super.key});

  @override
  State<AuthNotification> createState() => _AuthNotificationState();
}

class _AuthNotificationState extends State<AuthNotification> {
  //namecheck
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
                  color: Theme.of(context).colorScheme.primary,
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
                backgroundColor: Theme.of(context).colorScheme.secondary,
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
                  controller: Controller.emailController,
                  hintText: 'lisa@muster.de',
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
                    'Handynummer',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: Controller.phonenumberController,
                  hintText: '+49 123 456',
                  obscureText: false,
                  onChange: null,
                  validator: null,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                      contentPadding: EdgeInsets.only(left: 40),
                      title: Text('Anruf'),
                      value: "Anruf",
                      groupValue: question,
                      onChanged: (newValue) {
                        setState(() {
                          question = newValue;
                        });
                      }),
                ),
                Expanded(
                  child: RadioListTile(
                      contentPadding: EdgeInsets.only(left: 5),
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
