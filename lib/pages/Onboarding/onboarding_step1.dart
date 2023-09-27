import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_entry.dart';


class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/Onboarding – Startscreen.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 370,),
            Text(
              'Hinter jeder \nstarken Frau\nstehen starke\n    Frauen',
              style: TextStyle(
                color: Color.fromRGBO(27, 25, 86, 1),
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 25,
            ),
              Divider(
                    thickness: 5,
                    indent: 40,
                    endIndent: 310,
                    color: Color.fromRGBO(27, 25, 86, 1),
        
                  ),
                    SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 140,bottom: 15),
              child: Text(
                'Wir sind hier , um Frauen\nmit Flucht- und Migrations-\nerfahrung zu stärken und\nFempowerment zu leben.',
                style: TextStyle(
                  color: Color.fromRGBO(27, 25, 86, 1),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: LoginButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Authentry(),
                    ));
                  },
                  text: 'Mitglied werden'),
            ),
                SizedBox(height: 140,)
          ],
        ),
      ),
    );
  }
}
