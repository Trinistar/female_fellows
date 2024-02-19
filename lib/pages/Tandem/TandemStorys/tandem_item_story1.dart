import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemStorys/tandem_story.dart';

class TandemItemStory1 extends StatelessWidget {
  const TandemItemStory1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TandemStory1()),);
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color:  Theme.of(context).colorScheme.secondary,
          ),
          height: 160,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            child: SvgPicture.asset(
            'lib/images/makai-lisa.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}