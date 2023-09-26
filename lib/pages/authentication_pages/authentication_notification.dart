import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';

class AuthConnect extends StatefulWidget {
  const AuthConnect({super.key});

  @override
  State<AuthConnect> createState() => _AuthConnectState();
}

class _AuthConnectState extends State<AuthConnect> {
  //namecheck
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 170, right: 70),
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
            CircleAvatar(
              backgroundImage: AssetImage('lib/images/Group 377.png'),
              radius: 100,
              backgroundColor: Color.fromRGBO(252, 208, 220, 1),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 280, bottom: 5),
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
                  padding: const EdgeInsets.only(right: 220, bottom: 5),
                  child: Text(
                    'Handynummer',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: nameController,
                  hintText: '+49 123 456',
                  obscureText: false,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
