import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/provider/controller.dart';
import 'package:femalefellows/generated/l10n.dart';


class UpdateEventDate extends StatefulWidget {
  const UpdateEventDate({super.key, required this.eventState, this.newEventDate});

  final Event eventState;
  final void Function(Timestamp date)? newEventDate;


  @override
  State<UpdateEventDate> createState() => UpdateEventDateState();
}

class UpdateEventDateState extends State<UpdateEventDate> {
  late DateTime _dateTime;

  @override
  void initState() {
    _setInputFields(widget.eventState);
    _dateTime = widget.eventState.dates!.eventDate!.toDate();
    widget.newEventDate!(widget.eventState.dates!.eventDate!);
    super.initState();
  }

  void _setInputFields(Event eventState) {
    Controller.hostController.text = eventState.host;
    Controller.streetnameController.text = eventState.location.street;
    Controller.placeController.text = eventState.location.city;
    Controller.zipCodeController.text = eventState.location.zipCode;
    Controller.contactPersonController.text = eventState.contactPerson;
    Controller.eventPhoneNumberController.text = eventState.phoneNumber;
    Controller.whatsAppLinkController.text = eventState.whatsAppLink;
  }

  void _showdatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime(3000),
    ).then((value) {
      setState(() {
        if (value != null) {
          _dateTime = value;
          widget.newEventDate!(Timestamp.fromDate(_dateTime));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                '${_dateTime.day}.${_dateTime.month}.${_dateTime.year}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            subtitle: Text(
              S.of(context).createEventDate2,
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
                hintText: widget.eventState.host,
              ),
            ),
            subtitle: Text(
              S.of(context).createEventsHost,
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: TextFormField(
              controller: Controller.streetnameController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: widget.eventState.location.street,
              ),
            ),
            subtitle: Text(
              S.of(context).createEventStreet,
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: TextFormField(
              controller: Controller.placeController,
              decoration: InputDecoration(disabledBorder: InputBorder.none, focusedBorder: InputBorder.none, fillColor: Theme.of(context).colorScheme.surface, hintText: widget.eventState.location.city),
            ),
            subtitle: Text(
              S.of(context).createEventPlace,
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: TextFormField(
              controller: Controller.zipCodeController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: widget.eventState.location.zipCode,
              ),
            ),
            subtitle: Text(
              S.of(context).createEventZipCode,
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
                hintText: widget.eventState.contactPerson,
              ),
            ),
            subtitle: Text(
              S.of(context).eventOneRegisteredPerson,
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
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: widget.eventState.phoneNumber,
              ),
            ),
            subtitle: Text(
              S.of(context).authenticationHandy,
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
                hintText: widget.eventState.whatsAppLink,
              ),
            ),
            subtitle: Text(
              S.of(context).updateEventWhatsApp,
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
