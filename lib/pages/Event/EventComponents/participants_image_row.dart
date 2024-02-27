import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParticipantsImageRow extends StatelessWidget {
  const ParticipantsImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Stack(children: [
        SvgPicture.asset(
          'lib/images/avatar-2.svg',
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SvgPicture.asset(
            'lib/images/avatar-5.svg',
            height: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: SvgPicture.asset(
            'lib/images/avatar-2.svg',
            height: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75),
          child: SvgPicture.asset(
            'lib/images/avatar-5.svg',
            height: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120, top: 5),
          child: Text(
            '+ 8 Teilnehmerinnen',
            style: TextStyle(fontSize: 15),
          ),
        )
      ]),
    );
  }
}
