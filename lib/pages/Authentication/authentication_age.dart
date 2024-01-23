import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthAge extends StatefulWidget {
  const AuthAge({super.key, required this.birthday});

  final void Function(Timestamp)? birthday;

  @override
  State<AuthAge> createState() => _AuthAgeState();
}

class _AuthAgeState extends State<AuthAge> {
  final nameController = TextEditingController();

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
          widget.birthday!(Timestamp.fromDate(value));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              AppLocalizations.of(context)!.authenticationAge,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
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
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              AppLocalizations.of(context)!.authenticationAgeImage,
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
                  AppLocalizations.of(context)!.authenticationAgeBirthday,
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
    );
  }
}
