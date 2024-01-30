import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Event/EventOverview/event_overview.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage.dart';
import 'package:vs_femalefellows/pages/Profil/profil.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';

class TabBarNavigation extends StatefulWidget {
  TabBarNavigation({super.key});

  @override
  State<TabBarNavigation> createState() => _HomepageState();
}

class _HomepageState extends State<TabBarNavigation> {
  int _currentIndex = 2;

  void _navigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      Tandementry(),
      EventOverview(),
      Home(
        pagechange: _navigation,
      ),
      Profil(),
    ];

    super.initState();
  }

  List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
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
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Theme.of(context).colorScheme.primary,
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
