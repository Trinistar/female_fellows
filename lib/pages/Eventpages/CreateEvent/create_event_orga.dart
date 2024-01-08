import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class OrgaEvent extends StatelessWidget {
  const OrgaEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return      Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 1000,
                  height: 650,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 1000,
                        height: 110,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              child: Image.asset(
                                'lib/images/handright.png',
                              ),
                            ),
                            Positioned(
                              top: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Column(
                                  children: [
                                    Text(
                                      'Orga des Events',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40, top: 80),
                              child: Divider(
                                thickness: 5,
                                color: Colors.white,
                                endIndent: 300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Theme.of(context).colorScheme.tertiary,
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Veranstalter',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      TextBar(
                          controller: Controller.hostController,
                          hintText: 'Host',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      Container(
                        color: Theme.of(context).colorScheme.tertiary,
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Kontaktperson',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      TextBar(
                          controller: Controller.contactPersonController,
                          hintText: 'Kontaktperson',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      Container(
                        color: Theme.of(context).colorScheme.tertiary,
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Eventemail',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      TextBar(
                          controller: Controller.eventEmailController,
                          hintText: 'Eventemail',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      Container(
                        color: Theme.of(context).colorScheme.tertiary,
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Eventhandynummer',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      TextBar(
                          controller: Controller.eventPhoneNumberController,
                          hintText: 'Eventhandynummer',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      Image.asset('lib/images/handleft.png')
                    ],
                  ),
                );
  }
}