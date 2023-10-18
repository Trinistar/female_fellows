import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/authentication_login.dart';
import 'package:vs_femalefellows/pages/navigation_page.dart';

class Authpage extends StatefulWidget {
  Authpage({super.key});

  get context => null;
  @override
  State<Authpage> createState() => _AuthpageState();

  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign User IN
  login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop Loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop Loading circle
      Navigator.pop(context);

      //show error message
      showErroMessage(e.code);
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Navigation()));
  }

  // Error Messages
  void showErroMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.pink.shade100,
          title: Center(
              child: Text(
            message,
            style: const TextStyle(
              color: Colors.black87,
            ),
          )),
        );
      },
    );
  }
}

class _AuthpageState extends State<Authpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return Navigation();
          }
          // user is not logged in
          else {
            return AuthLoginPage();
          }
        }),
      ),
    );
  }
}
