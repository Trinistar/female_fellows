import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TandemItemStory3 extends StatelessWidget {
  const TandemItemStory3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color:  Theme.of(context).colorScheme.tertiary,
        ),
        height: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: 
              SvgPicture.asset(
                ('lib/images/yasna-franziska.svg'),
                fit: BoxFit.cover,
              ),
          
        ),
      ),
    );
  }
}