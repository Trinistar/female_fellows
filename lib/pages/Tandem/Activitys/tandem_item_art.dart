import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemArt extends StatelessWidget {
  const ItemArt({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/tandemArt'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.fill, image: AssetImage('lib/images/11-kunst.png')),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          height: 160,
          width: 160,
        ),
      ),
    );
  }
}
