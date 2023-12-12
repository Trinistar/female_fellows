import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventOverview/event_overview.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage.dart';
import 'package:vs_femalefellows/pages/Profil/profil.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';

class Navigation extends StatefulWidget {
  Navigation({super.key});

  @override
  State<Navigation> createState() => _HomepageState();
}

class _HomepageState extends State<Navigation> {
  int _currentIndex = 2;

  void _navigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    Tandementry(),
    EventOverview(),
    Home(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor:   Theme.of(context).colorScheme.primary,),
      child: Scaffold(
        backgroundColor: Colors.white,
        //Pages 
        body: _pages[_currentIndex],
        
        //Navigationbar
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _navigation,
            type: BottomNavigationBarType.fixed,
            selectedItemColor:  Theme.of(context).colorScheme.secondary,
            unselectedItemColor:  Theme.of(context).colorScheme.primary,
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
      ),
    );
  }
}
