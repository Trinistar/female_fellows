import 'package:flutter/material.dart';

class Foerderin extends StatelessWidget {
  const Foerderin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 260,
      child: Padding(
        padding:
            const EdgeInsets.only( left: 45, right: 45, bottom: 40),
        child: GestureDetector(
          onTap: () {},
          child: Image(
            image: AssetImage('lib/images/Foerderin.png'),
          ),
          ),
        ),
    );
  }
}
