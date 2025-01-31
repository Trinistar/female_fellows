import 'package:femalefellows/widgets/activity_tile_widget.dart';
import 'package:flutter/material.dart';

class Challenges extends StatelessWidget {
  const Challenges({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    'Next Challenges',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: FloatingActionButton(
                      onPressed: () {},
                      mini: true,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 150,
              width: 1000,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ActivityTileWidget(
                      assetPath: 'assets/cafe-01.svg',
                      text: 'Ins Café gehen',
                      colorDark: false,
                      route: '/tandemCoffee'),
                  ActivityTileWidget(
                      assetPath: 'assets/cafe-01.svg',
                      text: 'Ins Café gehen',
                      colorDark: false,
                      route: '/tandemCoffee'),
                  ActivityTileWidget(
                      assetPath: 'assets/cafe-01.svg',
                      text: 'Ins Café gehen',
                      colorDark: false,
                      route: '/tandemCoffee'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
