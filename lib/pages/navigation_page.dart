import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Eventpages/event.dart';
import 'package:vs_femalefellows/pages/Profil/profil.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';
import 'package:vs_femalefellows/pages/homepage.dart';

class Navigation extends StatefulWidget {
  Navigation({super.key});

  @override
  State<Navigation> createState() => _HomepageState();
}

class _HomepageState extends State<Navigation> {
  final user = FirebaseAuth.instance.currentUser!;

  int _currentIndex = 2;

  void _navigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    Tandementry(),
    Eventstart(),
    Home(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:
                Radius.circular(20.0), 
            topRight:
                Radius.circular(20.0), 
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _navigation,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromRGBO(252, 208, 220, 1),
          unselectedItemColor: Color.fromRGBO(25, 27, 68, 1),
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: "Tandem",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: "Event",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profil",
            )
          ],
        ),
      ),
    );
  }
}
