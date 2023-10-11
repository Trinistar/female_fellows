import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vs_femalefellows/components/carousel_items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
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

              //White Container next to Pink
              Positioned(
                top: 320,
                left: 200,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 320,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          left: 110,
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(60),
                              ),
                              color:Color.fromRGBO(27, 25, 68, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
              //Container with title
              Positioned(
                top: 510,
                child: Column(
                  children: [
                    Container(
                      width: 1000,
                      height: 500,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Tandem-Erfolgsstories',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Carousel Slider
              Positioned(
                top: 550,
                left: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarousItem(),
                    CarousItem(),
                    CarousItem(),
                  ],
                ),
              ),
              // Image for Tandem clickable ???
              Positioned(
                top: 730,
                left: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Color.fromRGBO(106, 104, 206, 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Finde deine perfekte\nTandem-Partnerin',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Image(
                            image: AssetImage('lib/images/Findpartner.png'),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
