import 'package:flutter/material.dart';

class EventIdeas extends StatelessWidget {
  const EventIdeas({super.key});

  @override
  Widget build(BuildContext context) {
    return      Container(
          width: 1000,
          height: 250,
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Events vorschlagen',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                'Du kannst dein eigenes Events organisieren oder\nEvents von anderen Organisationen vorschlagen.',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
               SizedBox(height: 20,),
             Image(image: AssetImage('lib/images/idea.png')),
             SizedBox(height: 20,),
             Image(image: AssetImage('lib/images/share.png')),
            ],),
          ),
        );
  }
}