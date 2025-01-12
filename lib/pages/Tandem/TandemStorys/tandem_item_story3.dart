import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TandemItemStoryThree extends StatelessWidget {
  const TandemItemStoryThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => context.push('/tandemStoryThree'),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              height: 160,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: Image.asset(
                  'lib/images/5-sandra-zouzan.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
