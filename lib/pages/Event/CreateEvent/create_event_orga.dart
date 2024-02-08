import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/provider/controller.dart';

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
                          'Orga des Events',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  height: 10,
                ),
                Text(
                  'Veranstalter',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextBar(controller: Controller.hostController, hintText: 'Host', obscureText: false, onChange: null, validator: null),
                Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  height: 10,
                ),
                Text(
                  'Kontaktperson',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextBar(controller: Controller.contactPersonController, hintText: 'Kontaktperson', obscureText: false, onChange: null, validator: null),
                Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  height: 20,
                ),
                Text(
                  'Eventemail',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextBar(controller: Controller.eventEmailController, hintText: 'Eventemail', obscureText: false, onChange: null, validator: null),
                Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  height: 20,
                ),
                Text(
                  'Eventhandynummer',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextFormField(
                  controller: Controller.eventPhoneNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
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
                    hintText: 'Eventhandynummer',
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  height: 20,
                ),
                Text(
                  'Event WhatsApp Gruppen Link',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextBar(
                  controller: Controller.whatsAppLinkController,
                  hintText: 'WhatsApp Gruppen Link',
                  obscureText: false,
                  onChange: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Image.asset('lib/images/handleft.png')
        ],
      ),
    );
  }
}
