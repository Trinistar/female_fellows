import 'package:flutter/material.dart';

class SecondDivider extends StatelessWidget {
  const SecondDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 40,
          width: 50,
          color: Color.fromRGBO(236, 240, 243, 1),
        ),
        Container(
          width: 1000,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
            color: Color.fromRGBO(27, 25, 68, 1),
          ),
        )
      ],
    );
  }
}
