import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return  ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 1000,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60)),
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
                left: 40,
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
                left: 40,
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
                child: Column(
                  children: [
                    Container(
                      width: 320,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(60),
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                        color: Color.fromRGBO(252, 208, 220, 1),
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -1,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(),
                              color: Color.fromRGBO(252, 208, 220, 1),
                            ),
                          ),
                        ),
                        Container(
                          width: 320,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 270,
                left: 240,
                child: Image.asset('lib/images/federoben.png'),
              ),
              Positioned(
                top: 300,
                left: 210,
                child: Image.asset('lib/images/federlinks.png'),
              ),
              Positioned(
                top: 300,
                left: 270,
                child: Image.asset('lib/images/federrechts.png'),
              ),
              Positioned(
                top: 350,
                left: 280,
                child: Image.asset('lib/images/federunten.png'),
              ),
              Positioned(
                top: 320,
                left: 40,
                child: Text(
                  'Entdecke Events, finde dein\nperfekte Tandem-Partnerin\nund lass dich von unseren\nErfolgsgeschichten inspirieren.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                top: 550,
                left: 40,
                child: Column(
                  children: [
                    Text(
                      'Tandem-Erfolgsstories',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      );
  }
}
