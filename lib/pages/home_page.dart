import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //sign Out mehtod
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink.shade100,
       actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
      body: Center(
        child: Text(
          "Logged in as: " + user.email!,
          style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
        ),
      ),
    );
  }
}
