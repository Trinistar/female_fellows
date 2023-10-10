import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1000,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
              color: Color.fromRGBO(27, 25, 68, 1),
            ),
          ),
          Positioned(
            top: 30,
            left: 350,
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/images/Avatar.png'),
              radius: 25,
              backgroundColor: Color.fromRGBO(252, 208, 220, 1),
            ),
          ),
          Positioned(
            top: 60,
            left: 50,
            child: Text(
              'Hallo ${user.email!},',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 50,
            child: Text(
              'Schön das du dabei bist!',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Positioned(
            top: 110,
            child: Image.asset('lib/images/handleft.png'),
          ),
          Positioned(
            top: 180,
            left: 200,
            child: Image.asset('lib/images/handright.png'),
          ),
          Positioned(
            top: 250,
            child: Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    ),
              color: Color.fromRGBO(252, 208, 220, 1),
              ),
            ),
          ),
            Positioned(
            top: 270,
            left: 220,
            child: Image.asset('lib/images/federoben.png'),
          ),   Positioned(
            top: 300,
            left: 190,
            child: Image.asset('lib/images/federlinks.png'),
          ),   Positioned(
            top: 300,
            left: 250,
            child: Image.asset('lib/images/federrechts.png'),
          ),   Positioned(
            top: 350,
            left: 260,
            child: Image.asset('lib/images/federunten.png'),
          ),

        ],
      ),
    );
  }
}
