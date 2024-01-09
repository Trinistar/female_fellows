import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/pages/Eventpages/CreateEvent/create_event_category.dart';
import 'package:vs_femalefellows/pages/Eventpages/CreateEvent/create_event_description.dart';
import 'package:vs_femalefellows/pages/Eventpages/CreateEvent/create_event_header.dart';
import 'package:vs_femalefellows/pages/Eventpages/CreateEvent/create_event_material.dart';
import 'package:vs_femalefellows/pages/Eventpages/CreateEvent/create_event_orga.dart';

import 'package:vs_femalefellows/pages/Eventpages/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_detail_page.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:date_format/date_format.dart';

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

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.secondary,
        ),
        child: Scaffold(
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
              return ListView(children: [
                HeaderEvent(),
                Artbar(colorleft: Theme.of(context).colorScheme.secondary, colorright: Colors.white),
                Container(
                  color: Colors.white,
                  height: 20,
                ),
                // *************************************  //EVENT DATA //**************************************/
                Container(
                  color: Colors.white,
                  width: 1000,
                  height: 350,
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
                        TextBar(controller: Controller.eventTitleController, hintText: 'Title', obscureText: false, onChange: null, validator: null),
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
                          child: Text(
                            formatDate(
                              _dateTime,
                              <String>[d, '. ', MM, ' ', yyyy],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: OutlinedButton(
                            onPressed: () {
                              _showdatePicker();
                            },
                            child: const Text('Open Date Picker'),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text('Event Location'),
                        ),
                        TextBar(controller: Controller.locationController, hintText: 'Location', obscureText: false, onChange: null, validator: null),
                      ],
                    ),
                  ),
                ),
                DividerBouthCorner(color1: Theme.of(context).colorScheme.tertiary, color2: Colors.white),

                // *************************************  //EVENT ORGA //**************************************/
                OrgaEvent(),
                DividerBouthCorner(color1: Theme.of(context).colorScheme.secondary, color2: Theme.of(context).colorScheme.tertiary),
                // *************************************  //EVENT DESCRIPTION //**************************************/
                DescriptionEvent(),
                DividerBouthCorner(color1: Colors.white, color2: Theme.of(context).colorScheme.secondary),
                // *************************************  //EVENT CATEGORYS //**************************************/
                EventCategory(),
                DividerBouthCorner(color1: Theme.of(context).colorScheme.surfaceVariant, color2: Colors.white),
                // *************************************  //EVENT MATERIALS //**************************************/
                EventMaterial(),
                DividerBouthCorner(color1: Colors.white, color2: Theme.of(context).colorScheme.surfaceVariant),
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
                              eventEmail: Controller.eventEmailController.text,
                              evntPhoneNumber: Controller.eventPhoneNumberController.text,
                              date: Timestamp.fromDate(_dateTime),
                              eventDescription: Controller.descriptionController.text,
                              host: Controller.hostController.text,
                              eventTitle: Controller.eventTitleController.text,
                              contactPerson: Controller.contactPersonController.text,
                              location: Controller.locationController.text,
                              planer: Controller.planerController.text,
                              food: Controller.foodController.text,
                              information: Controller.informationController.text,
                              clothes: Controller.clothesController.text,
                            ));
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                ),
              ]);
            },
          ),
        ));
  }
}