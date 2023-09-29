import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class AuthAge extends StatefulWidget {
  const AuthAge({super.key});

  @override
  State<AuthAge> createState() => _AuthAgeState();
}

class _AuthAgeState extends State<AuthAge> {
  //namecontroller
  final nameController = TextEditingController();

  //print the choosen date
  DateTime _dateTime = DateTime.now();

  //show DateTimePicker method
  void _showdatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime(3000),
    ).then((value) {
      setState(() {
        if (value != null) {
          _dateTime = value;
        }
      });
    });
  }

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
                'Wie alt bist du?',
                style: TextStyle(
                  color: Color.fromRGBO(27, 25, 86, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: MaterialButton(
                onPressed: _showdatePicker,
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/images/Birthday.png'),
                  radius: 100,
                  backgroundColor: Color.fromRGBO(252, 208, 220, 1),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'Klick auf das Bild',
                style: TextStyle(
                  color: Color.fromRGBO(27, 25, 86, 1),
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5),
                  child: Text(
                    ' Dein Geburtstag:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5),
                  child: Text(
                    formatDate(
                      _dateTime,
                      <String>[d, '. ', MM, ' ', yyyy],
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
