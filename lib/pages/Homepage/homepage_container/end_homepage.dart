import 'package:flutter/material.dart';

class End extends StatelessWidget {
  const End({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color.fromRGBO(106, 104, 206, 1),

      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('Gemeinsam\ngestalten wir eine\ngleichberechtigte,\nvielfältige Welt.',
        style: TextStyle(color: Colors.white,
        fontSize: 25,
        
        ),
        textAlign: TextAlign.center,
         
        ),
      ),
    );
  }
}
