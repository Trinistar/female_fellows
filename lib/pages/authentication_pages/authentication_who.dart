import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';

class AuthWho extends StatefulWidget {
  const AuthWho({super.key});

  @override
  State<AuthWho> createState() => _AuthWhoState();
}

class _AuthWhoState extends State<AuthWho> {
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
              padding: const EdgeInsets.only(top: 170, right: 150),
              child: Text(
                'Wer bist du?',
                style: TextStyle(
                  color: Color.fromRGBO(27, 25, 86, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('lib/images/Avatar.png'),
              radius: 100,
              backgroundColor: Color.fromRGBO(252, 208, 220, 1),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Profilbild / Avatar auswählen',
              style: TextStyle(
                color: Color.fromRGBO(27, 25, 86, 1),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 250, bottom: 5),
                  child: Text(
                    'Vorname',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: nameController,
                  hintText: 'Lisa',
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250, bottom: 5),
                  child: Text(
                    'Nachname',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: nameController,
                  hintText: 'Musterfrau',
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
