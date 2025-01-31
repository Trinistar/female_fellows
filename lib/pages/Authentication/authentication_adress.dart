import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:femalefellows/components/text_bar.dart';
import 'package:femalefellows/provider/controller.dart';

import 'package:femalefellows/generated/l10n.dart';

class AuthAdress extends StatefulWidget {
  const AuthAdress({super.key});

  @override
  State<AuthAdress> createState() => _AuthAdressState();
}

class _AuthAdressState extends State<AuthAdress> {
  //namecontroller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            Text(
              S.of(context).authenticationPlace,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset('lib/images/wohnort.svg'),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            //TODO inputvalidierung für Plichtfelder
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    S.of(context).authenticationStreet,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextBar(
                  controller: Controller.streetnameController,
                  hintText: 'Mustersraße 1',
                  obscureText: false,
                  onChange: null,
                  validator: null,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    S.of(context).authenticationPostcode,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: Controller.zipCodeController,
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
                          hintText: '35510',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: Controller.placeController,
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
                            hintText: 'Wohnort',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
