import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TandemItemStoryOne extends StatelessWidget {
  const TandemItemStoryOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => context.push('/tandemStoryOne'),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Theme.of(context).colorScheme.secondary,
              ),
              height: 160,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: Image.asset(
                  'lib/images/1-makai-lisa.png',
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
