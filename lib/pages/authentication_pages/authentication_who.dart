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
  final lastNameController = TextEditingController();

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
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                'Wer bist du?',
                style: TextStyle(
                  color:  Theme.of(context).colorScheme.primary,
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
                backgroundImage: AssetImage('lib/images/Avatar.png'),
                radius: 100,
                backgroundColor:  Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'Profilbild / Avatar auswählen',
                style: TextStyle(
                  color:  Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:40, bottom: 5),
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
                  padding: const EdgeInsets.only(left:40, bottom: 5),
                  child: Text(
                    'Nachname',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: lastNameController,
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
