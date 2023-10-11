import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/carousel_items.dart';

class EventCarousel extends StatelessWidget {
  const EventCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
          width: 1000,
          height: 300,
          color: Color.fromRGBO(236, 240, 243, 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 20),
                  child: Text(
                    'Diese Events könnten\ndich interessieren',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: 1000,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CarousItem(),
                      CarousItem(),
                      CarousItem(),
                      CarousItem(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top:20),
                  child: Text(
                    'Zu allen Events',
                    style: TextStyle(fontSize: 13,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}