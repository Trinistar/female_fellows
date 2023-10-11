import 'package:flutter/material.dart';

class ThridDivider extends StatelessWidget {
  const ThridDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1000,
          height: 100,
          color: Color.fromRGBO(236, 240, 243, 1),
        ),
        Container(
          decoration: BoxDecoration(
       color: Color.fromRGBO(27, 25, 68, 1),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(60))),
          width: 410,
          height: 50,
        ),
        Positioned(
          top: 50,
          child: Container(
         color: Color.fromRGBO(27, 25, 68, 1),
            width: 50,
            height: 50,
          ),
        ),
        Positioned(
          top: 50,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(236, 240, 243, 1),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
            width: 1000,
            height: 50,
          ),
        ),
      ],
    );
  }
}