import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CarousItem extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  CarousItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color:  Theme.of(context).colorScheme.secondary,
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
                  '${user.email!} & Lisa',
                  style: TextStyle(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
              Image(
                image: AssetImage('lib/images/partner1.png'),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
