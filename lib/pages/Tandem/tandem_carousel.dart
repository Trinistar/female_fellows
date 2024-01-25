import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_carousel_item.dart';

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
          TandemItem(),
          TandemItem(),
          TandemItem(),
          TandemItem(),
        ],
      ),
    );
  }
}
