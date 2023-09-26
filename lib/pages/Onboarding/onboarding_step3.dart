import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/Onboarding – Step 2_ Events.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.only(right:80),
            child: Text(
              'Nehme an\nspannenden\nEvents teil.',
              style: TextStyle(
                color: Color.fromRGBO(27, 25, 86, 1),
                fontSize: 35,
              ),
            ),
          ),
           Padding(
                padding: const EdgeInsets.only(top: 10,left: 200),
                child: Image.asset('lib/images/Vector.png'),
              ),
          Divider(
            thickness: 5,
            indent: 70,
            endIndent: 280,
            color: Color.fromRGBO(27, 25, 86, 1),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
              'Genieße eine Vielzahl von\nVeranstaltungen, die von Frauen\nfür Frauen organisiert werden. Du\nkannst an Live-Events und\ndigitalen Aktivitäten teilnehmen.',
              style: TextStyle(
                color: Color.fromRGBO(27, 25, 86, 1),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
