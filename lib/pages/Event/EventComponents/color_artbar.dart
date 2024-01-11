import 'package:flutter/material.dart';

class Artbar extends StatelessWidget {
  const Artbar({super.key, required this.colorleft, required this.colorright});
  final Color colorleft;
  final Color colorright;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: colorleft),
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
              color: colorright
              ),
        ),
      ],
    );
  }
}
