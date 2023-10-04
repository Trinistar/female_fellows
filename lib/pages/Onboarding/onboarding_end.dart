import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_entry.dart';
import 'package:vs_femalefellows/pages/toggle_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/Diagram - Female Fellows App.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                LoginButton(
                      onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Authentry(),
                    ));
                  },
                    text: AppLocalizations.of(context)!.buttonRegistration,
                    ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TogglePage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color.fromRGBO(27, 25, 86, 27),
                          width: 2.0,
                        ),
                        color: Colors.transparent),
                    child: Center(
                        child: Text(
                     AppLocalizations.of(context)!.login,
                      style: const TextStyle(
                          color: Color.fromRGBO(27, 25, 86, 27),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  ),
                ),
                SizedBox(
                  height: 120,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
