import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/materials.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/create_event_category.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/create_event_description.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/create_event_header.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/create_event_material.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/create_event_orga.dart';
import 'package:vs_femalefellows/pages/Event/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime _dateTime = DateTime.now();

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
            _dateTime = value;
          }
        });
      });
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<EventBloc, EventState>(
        listener: (context, state) {
          if (state is CreateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Event wurde erfolgreich erstellt'),
              ),
            );
            Navigator.of(context).pop();
            /* Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailEvent(
                      eventState: state.eventdata,
                    ))); */
          }
          if (state is EventFailure) {
            SnackBar(
              content: Text('Failure'),
            );
          }
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              HeaderEvent(),
              Artbar(
                  colorleft: Theme.of(context).colorScheme.secondary,
                  colorright: Colors.white),
              Container(
                color: Colors.white,
                height: 20,
              ),
              // *************************************  //EVENT DATA //**************************************/
              Container(
                color: Colors.white,
                width: 1000,
                height: 550,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text('Event Title'),
                      ),
                      TextBar(
                          controller: Controller.eventTitleController,
                          hintText: 'Title',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      Container(
                        color: Colors.white,
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text('Event Datum'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: OutlinedButton(
                          onPressed: () {
                            _showdatePicker();
                          },
                          child: const Text('Open Date Picker'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          formatDate(
                            _dateTime,
                            <String>[d, '. ', MM, ' ', yyyy],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text('Straße'),
                      ),
                      TextBar(
                          controller: Controller.streetnameController,
                          hintText: 'Straße',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      Container(
                        color: Colors.white,
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text('Ort'),
                      ),
                      TextBar(
                          controller: Controller.placeController,
                          hintText: 'Ort',
                          obscureText: false,
                          onChange: null,
                          validator: null),
                      Container(
                        color: Colors.white,
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text('Postleitzahl'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextFormField(
                          controller: Controller.zipCodeController,
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
                            hintText: 'Postleitzahl',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DividerBouthCorner(
                  color1: Theme.of(context).colorScheme.tertiary,
                  color2: Colors.white),

              // *************************************  //EVENT ORGA //**************************************/
              OrgaEvent(),
              DividerBouthCorner(
                  color1: Theme.of(context).colorScheme.secondary,
                  color2: Theme.of(context).colorScheme.tertiary),
              // *************************************  //EVENT DESCRIPTION //**************************************/
              DescriptionEvent(),
              DividerBouthCorner(
                  color1: Colors.white,
                  color2: Theme.of(context).colorScheme.secondary),
              // *************************************  //EVENT CATEGORYS //**************************************/
              EventCategory(),
              DividerBouthCorner(
                  color1: Theme.of(context).colorScheme.surfaceVariant,
                  color2: Colors.white),
              // *************************************  //EVENT MATERIALS //**************************************/
              EventMaterial(),
              DividerBouthCorner(
                  color1: Colors.white,
                  color2: Theme.of(context).colorScheme.surfaceVariant),
              Container(
                color: Colors.white,
                height: 20,
              ),
              BlocBuilder<EventBloc, EventState>(
                builder: (context, state) {
                  return FFButton(
                    text: 'Create Event',
                    onTap: () {
                      context.read<EventBloc>().add(NewEvent(
                              newEvent: Event(
                            whatsAppLink: Controller.whatsAppLinkController.text,
                            email: Controller.eventEmailController.text,
                            phoneNumber: Controller.eventPhoneNumberController.text,
                            date: Timestamp.fromDate(_dateTime),
                            description: Controller.descriptionController.text,
                            host: Controller.hostController.text,
                            title: Controller.eventTitleController.text,
                            contactPerson: Controller.contactPersonController.text,
                            location: Address(street: Controller.streetnameController.text, city: Controller.placeController.text, zipCode: Controller.zipCodeController.text),
                            material: EventMaterials(
                              planer: Controller.planerController.text,
                              food: Controller.foodController.text,
                              information:
                                  Controller.informationController.text,
                              clothes: Controller.clothesController.text,
                            ),
                          )));
                    },
                  );
                },
              ),
              SizedBox(
                height: 100,
              ),
            ],
          );
        },
      ),
    );
  }
}
