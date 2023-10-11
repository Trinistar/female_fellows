import 'package:flutter/material.dart';

class Artbar extends StatelessWidget {
  const Artbar({super.key});

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
              color: Colors.white,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(60))),
          width: 410,
          height: 50,
        ),
        Positioned(
          top: 50,
          child: Container(
            color: Colors.white,
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
