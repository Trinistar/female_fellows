import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemStorys/tandem_story3.dart';

class TandemItemStory3 extends StatelessWidget {
  const TandemItemStory3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TandemStory3()),
          );
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          height: 160,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            child: SvgPicture.asset(
              ('lib/images/sandra-zouzan.svg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
