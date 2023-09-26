import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';

class AuthPlace extends StatefulWidget {
  const AuthPlace({super.key});

  @override
  State<AuthPlace> createState() => _AuthPlaceState();
}

class _AuthPlaceState extends State<AuthPlace> {
  //namecontroller
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
              padding: const EdgeInsets.only(top: 170, right: 110),
              child: Text(
                'Wo wohnst du?',
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
              backgroundImage: AssetImage('lib/images/Location.png'),
              radius: 100,
              backgroundColor: Color.fromRGBO(252, 208, 220, 1),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 150, bottom: 5),
                  child: Text(
                    'Straße und Hausnummer',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: nameController,
                  hintText: 'Mustersraße 1',
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
