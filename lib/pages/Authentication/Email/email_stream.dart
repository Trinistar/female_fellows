import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Authentication/Email/email_verification.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login_page.dart';



class Emailstream extends StatelessWidget {
  const Emailstream({super.key});

  @override
  Widget build(BuildContext context) { return
Scaffold(body:StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
builder: (context, snapshot){
if (snapshot.hasData){
  return EmailCheck();
}else {
   return LoginPage(); 
}
},
) ,
);
  }
}