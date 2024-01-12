import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderEvent extends StatelessWidget {
  const HeaderEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
      height: 215,
      width: 1000,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 26,
              width: 40,
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Image.asset(
              'lib/images/Mask group2.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Create Events',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Divider(
                thickness: 5,
                indent: 40,
                endIndent: 310,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
