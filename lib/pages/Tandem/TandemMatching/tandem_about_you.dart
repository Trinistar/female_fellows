import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class TandemAboutYou extends StatelessWidget {
  const TandemAboutYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ListView(children: [
        Text(
          'Erzähl uns etwas\nüber dich?',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: CircleAvatar(
           
            radius: 100,
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset('lib/images/Überdich.svg'),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        TextField(
          maxLength: 250,
          maxLines: 7,
          controller: Controller.aboutYouController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87),
              // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Theme.of(context).colorScheme.surface,
            filled: true,
            hintText:
                'z.B. Ich bin aus Syrien und habe Interesse an kulturellem Austausch und beruflicher Orientierung in Deutschland.',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '*Um dich mit deiner perfekten Tandem-Partnerin zu matchen, müssen wir ein bisschen mehr über dich erfahren.',
          style: TextStyle(fontSize: 12),
        ),
      ]),
    );
  }
}
