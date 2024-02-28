import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _navigation,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'lib/images/tandem-active.svg',
              height: 30,
            ),
            icon: SvgPicture.asset(
              'lib/images/tandem.svg',
              height: 25,
            ),
            label: "Tandem",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'lib/images/events-active.svg',
              height: 30,
            ),
            icon: SvgPicture.asset(
              'lib/images/events.svg',
              height: 25,
            ),
            label: "Event",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'lib/images/home-active.svg',
              height: 50,
            ),
            icon: SvgPicture.asset(
              'lib/images/home.svg',
              height: 50,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'lib/images/profil-active.svg',
              height: 30,
            ),
            icon: SvgPicture.asset(
              'lib/images/profil.svg',
              height: 25,
            ),
            label: "Profil",
          ),
          /*     BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('lib/images/community-active.svg',height: 30,),
            icon: SvgPicture.asset('lib/images/community.svg',height: 25,),
            label:"Chat"
          ) */
        ],
      ),
    );
  }
}
