import 'package:flutter/material.dart';

class TandemItemStory2 extends StatelessWidget {
  const TandemItemStory2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color:  Theme.of(context).colorScheme.primary,
        ),
        height: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Anna & Semhar',
                  style: TextStyle(fontSize: 13,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Image(
                image: AssetImage('lib/images/partner2.png'),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}