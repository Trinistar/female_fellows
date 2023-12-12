import 'package:flutter/material.dart';

class ParticipantsImageRowWhite extends StatelessWidget {
  const ParticipantsImageRowWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Stack(children: [
        Image.asset(
          'lib/images/ImageIcon.png',
          cacheHeight: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Image.asset(
            'lib/images/ImageIcon.png',
            cacheHeight: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset(
            'lib/images/ImageIcon.png',
            cacheHeight: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Image.asset(
            'lib/images/ImageIcon.png',
            cacheHeight: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120, top: 5),
          child: Text(
            '+ 8 Teilnehmerinnen',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
