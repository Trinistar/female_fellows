import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemCreative extends StatelessWidget {
  const ItemCreative({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/tandemCreativ'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.fill, image: AssetImage('lib/images/4-krativ.png')),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          height: 160,
          width: 160,
        ),
      ),
    );
  }
}
