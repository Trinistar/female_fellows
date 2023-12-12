import 'package:flutter/material.dart';

class EventImages extends StatelessWidget {
  const EventImages({super.key});

  @override
  Widget build(BuildContext context) {
    return         Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bilder von den letzten Events',
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                      thickness: 5,
                      endIndent: 320,
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              );
  }
}