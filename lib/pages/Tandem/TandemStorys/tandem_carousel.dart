import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemStorys/tandem_item_story1.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemStorys/tandem_item_story2.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemStorys/tandem_item_story3.dart';

class TandemCarousel extends StatelessWidget {
  const TandemCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 1000,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TandemItemStory1(),
          TandemItemStory2(),
          TandemItemStory3(),
        ],
      ),
    );
  }
}
