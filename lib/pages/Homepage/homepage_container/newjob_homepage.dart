import 'package:flutter/material.dart';

class NewJobs extends StatelessWidget {
  const NewJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return      Container(
          width: 1000,
          height: 250,
          color: Color.fromRGBO(27, 25, 68, 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Neue Jobs',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                'Du möchtest dich ehrenamtlich engagieren. Hier\nsind die neuen Jobangebote für dich.',
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