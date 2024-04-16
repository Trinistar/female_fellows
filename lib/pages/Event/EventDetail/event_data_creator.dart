import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParticipantsData extends StatelessWidget {
  const ParticipantsData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('TEILNEHMER:',style: TextStyle(fontSize: 25),),
            ),
              Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 5,
              endIndent: 300,
              indent: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 30, bottom: 30),
                    child: SizedBox(
                      height: 90,
                      width: 320,
                      child: ListTile(
                          leading: Image.asset(
                            'lib/images/ImageIcon.png',
                            fit: BoxFit.fill,
                            width: 100,
                          ),
                          title: Text(
                            'NutzerName',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    size: 20,
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: 20,
                                  ),
                                  Text(
                                    '0123012301',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.child_care,
                                    size: 20,
                                  ),
                                  Text(
                                    'Kinder',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_add_outlined,
                                    size: 20,
                                  ),
                                  Text(
                                    'Dolmetcher',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
