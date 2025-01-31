import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:femalefellows/pages/Homepage/homepage.dart';

class Kooperation extends StatefulWidget {
  const Kooperation({super.key});

  @override
  State<Kooperation> createState() => _KooperationState();
}

final coop = Uri.parse('https://femalefellows.com/unterstuetzen/');

class _KooperationState extends State<Kooperation> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.tertiary,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 300),
                      child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary,
                          mini: true,
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Text(
                      S.of(context).homeVereinInfoThreeTitle,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 5,
                      endIndent: 310,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 300,
                        width: 320,
                        child: Text(
                          S.of(context).homeVereinInfoThreeBody,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          launchUrl(coop, mode: LaunchMode.externalApplication);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 60),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Text(
                            S.of(context)
                                .homeVereinInfoThreeButton,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 80,
            ),
            Image.asset('lib/images/handshake.png')
          ],
        ),
      ),
    );
  }
}
