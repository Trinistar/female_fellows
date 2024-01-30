import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Tandem/Activitys/tandem_acticityItem.dart';

class ActivitysCarousel extends StatelessWidget {
  const ActivitysCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 1000,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ActivityCofe(),
         
        ],
      ),
    );
  }
}