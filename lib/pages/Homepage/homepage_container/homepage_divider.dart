import 'package:flutter/material.dart';

class DividerBouthCorner extends StatelessWidget {
  final Color color1;
  final Color color2;

  
  const DividerBouthCorner({super.key,required this.color1,required this.color2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1000,
          height: 100,
        ),
        Container(
          decoration: BoxDecoration(
              color: color2,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(60))),
          width: 410,
          height: 50,
        ),
        Positioned(
          top: 50,
          child: Container(
            color: color2,
            width: 50,
            height: 50,
          ),
        ),
        Positioned(
          top: 50,
          child: Container(
            decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
            width: 1000,
            height: 50,
          ),
        ),
      ],
    );
  }
}
