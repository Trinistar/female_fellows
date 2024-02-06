import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/pages/Event/EventOverview/event_overview.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage.dart';
import 'package:vs_femalefellows/pages/Profil/profile.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';

class TabBarNavigation extends StatelessWidget {
  const TabBarNavigation({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _navigation(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  /* final List<Widget> _pages = [
    Tandementry(),
    EventOverview(),
    Home(),
    Profile(),
  ]; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      //Pages
      body: navigationShell,

      //Navigationbar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
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
