import 'package:flutter/material.dart';

class AuthSafety extends StatefulWidget {
  const AuthSafety({super.key});

  @override
  State<AuthSafety> createState() => _AuthSafetyState();
}

class _AuthSafetyState extends State<AuthSafety> {
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
                  'Datenschutzerlärung\nund Newsletter',
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
                  backgroundImage: AssetImage('lib/images/Anmelden.png'),
                  radius: 100,
                  backgroundColor: Color.fromRGBO(252, 208, 220, 1),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}