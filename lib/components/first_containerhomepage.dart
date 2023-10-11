import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirstContainer extends StatelessWidget {
   final user = FirebaseAuth.instance.currentUser!;
FirstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: 520,
          width: 1000,
          child: Stack(
            children: [
              Container(
                width: 1000,
                height: 380,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60)),
                  color: Color.fromRGBO(27, 25, 68, 1),
                ),
              ),

              Positioned(
                top: 25,
                left: 350,
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/images/Avatar.png'),
                  radius: 25,
                  backgroundColor: Color.fromRGBO(252, 208, 220, 1),
                ),
              ),
              Positioned(
                top: 40,
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
                top: 90,
                left: 40,
                child: Text(
                  'Schön das du dabei bist!',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Positioned(
                top: 90,
                child: Image.asset('lib/images/handleft.png'),
              ),
              Positioned(
                top: 160,
                left: 200,
                child: Image.asset('lib/images/handright.png'),
              ),
              //pink Container with text
              Positioned(
                top: 230,
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
              //Feathers in pink container
              Positioned(
                top: 250,
                left: 240,
                child: Image.asset('lib/images/federoben.png'),
              ),
              Positioned(
                top: 280,
                left: 210,
                child: Image.asset('lib/images/federlinks.png'),
              ),
              Positioned(
                top: 280,
                left: 270,
                child: Image.asset('lib/images/federrechts.png'),
              ),
              Positioned(
                top: 330,
                left: 280,
                child: Image.asset('lib/images/federunten.png'),
              ),
              Positioned(
                top: 300,
                left: 40,
                child: Text(
                  'Entdecke Events, finde dein\nperfekte Tandem-Partnerin\nund lass dich von unseren\nErfolgsgeschichten inspirieren.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        );
  }
}