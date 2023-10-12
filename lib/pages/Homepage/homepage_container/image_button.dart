import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem.dart';


class ImageButton extends StatelessWidget {
  const ImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 45, right: 45, bottom: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Tandementry(),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Color.fromRGBO(106, 104, 206, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Finde deine perfekte\nTandem-Partnerin',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Image(
                  image: AssetImage('lib/images/Tandemfind.png'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
