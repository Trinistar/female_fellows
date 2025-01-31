import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:femalefellows/components/text_bar.dart';
import 'package:femalefellows/provider/controller.dart';
import 'package:femalefellows/generated/l10n.dart';

class OrgaEvent extends StatelessWidget {
  const OrgaEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.tertiary,
      width: 1000,
      height: 750,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          S.of(context)!.createEventOrga,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
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
              S.of(context)!.createEventsHost,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextBar(
                controller: Controller.hostController,
                hintText: S.of(context)!.createEventsHost,
                obscureText: false,
                onChange: null,
                validator: null),
          ),
          Container(
            color: Theme.of(context).colorScheme.tertiary,
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              S.of(context)!.createEventsContactPerson,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextBar(
                controller: Controller.contactPersonController,
                hintText:
                    S.of(context)!.createEventsContactPerson,
                obscureText: false,
                onChange: null,
                validator: null),
          ),
          Container(
            color: Theme.of(context).colorScheme.tertiary,
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              S.of(context)!.createEventMail,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextBar(
                controller: Controller.eventEmailController,
                hintText: S.of(context)!.createEventMail,
                obscureText: false,
                onChange: null,
                validator: null),
          ),
          Container(
            color: Theme.of(context).colorScheme.tertiary,
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              S.of(context)!.createEventHandy,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: Controller.eventPhoneNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
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
                hintText: S.of(context)!.createEventHandy,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.tertiary,
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              S.of(context)!.createEventWhatsApp,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextBar(
              controller: Controller.whatsAppLinkController,
              hintText: S.of(context)!.createEventWhatsApp,
              obscureText: false,
              onChange: null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Image.asset('lib/images/handleft.png')
        ],
      ),
    );
  }
}
