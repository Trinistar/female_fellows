import 'package:flutter/material.dart';

class DividerCornerLeft extends StatelessWidget {
  final  Color color1;
  final Color color2;
  const DividerCornerLeft({super.key,required this.color1,required this.color2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 40,
          width: 50,
          color: color1,
          //Color.fromRGBO(236, 240, 243, 1),
        ),
        Container(
          width: 1000,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
            color:color2,
            // Color.fromRGBO(27, 25, 68, 1),
          ),
        )
      ],
    );
  }
}