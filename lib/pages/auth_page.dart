import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_login.dart';
import 'package:vs_femalefellows/pages/home_page.dart';



class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        //user is logged in
        if (snapshot.hasData){
          return Homepage();
        }
        // user is not logged in 
        else{
          return AuthLoginPage();
        }

      }),
      ),
     );
  }
}
