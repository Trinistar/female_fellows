import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class UpdateEventItem extends StatefulWidget {
  const UpdateEventItem({super.key});

  @override
  State<UpdateEventItem> createState() => UpdateEventItemState();
}

class UpdateEventItemState extends State<UpdateEventItem> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    void _showdatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime(3000),
      ).then((value) {
        setState(() {
          if (value != null) {
            dateTime = value;
          }
        });
      });
    }

    var eventState = context.read<Event>();
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: GestureDetector(
              onTap: () {
                _showdatePicker();
              },
              child: Text(
                dateTime != null
                    ? '${dateTime.day}.${dateTime.month}.${dateTime.year}'
                    : '${eventState.date.toDate().day}.${eventState.date.toDate().month}.${eventState.date.toDate().year}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            subtitle: Text(
              'Datum des Events',
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: TextFormField(
              controller: Controller.hostController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: eventState.host,
              ),
            ),
            subtitle: Text(
              'Veranstalter',
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: TextFormField(
              controller: Controller.locationController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText:eventState.location.street,
              ),
            ),
            subtitle: Text(
              'Straße',
              style: TextStyle(fontSize: 12),
            ),
          ),
              ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: TextFormField(
              controller: Controller.locationController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText:eventState.location.city
              ),
            ),
            subtitle: Text(
              'Ort',
              style: TextStyle(fontSize: 12),
            ),
          ),
              ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: TextFormField(
              controller: Controller.locationController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText:eventState.location.zipCode,
              ),
            ),
            subtitle: Text(
              'Postleitzahl',
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'lib/images/ImageIcon.png',
              cacheHeight: 25,
            ),
            title: TextFormField(
              controller: Controller.contactPersonController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: eventState.contactPerson,
              ),
            ),
            subtitle: Text(
              'Ansprechpartnerin',
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'lib/images/chat.svg',
              height: 20,
            ),
            title: TextFormField(
              controller: Controller.eventPhoneNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: eventState.eventPhoneNumber,
              ),
            ),
            subtitle: Text(
              'Handynummer ',
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'lib/images/chat.svg',
              height: 20,
            ),
            title: TextFormField(
              controller: Controller.whatsAppLinkController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: eventState.whatsAppLink,
              ),
            ),
            subtitle: Text(
              'WhatsApp Gruppenlink',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
