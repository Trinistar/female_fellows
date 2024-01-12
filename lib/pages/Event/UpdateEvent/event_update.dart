import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/materials.dart';
import 'package:vs_femalefellows/pages/Event/UpdateEvent/update_description.dart';
import 'package:vs_femalefellows/pages/Event/UpdateEvent/update_event_item.dart';
import 'package:vs_femalefellows/pages/Event/UpdateEvent/update_materials.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({super.key, required this.eventState});
  final Event eventState;

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child: RepositoryProvider<Event>(
          create: (context) => widget.eventState,
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                'Bearbeite das Event',
              ),
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          'lib/images/globe.svg',
                          height: 20,
                        ),
                        title: TextFormField(
                          controller: Controller.eventTitleController,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: widget.eventState.whatsAppLink,
                          ),
                        ),
                        subtitle: Text(
                          'Event Title',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                UpdateEventItem(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                UpdateDesciption(),
                SizedBox(
                  height: 30,
                ),
                UpdateMaterials(),
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<EventBloc, EventState>(
                  builder: (context, state) {
                    return FFButton(
                        onTap: () {
                          context.read<EventBloc>().add(EventUpdate(
                              updateEvent: Event(
                                  whatsAppLink: Controller.whatsAppLinkController.text,
                                  eventEmail: Controller.eventEmailController.text,
                                  eventPhoneNumber: Controller.eventPhoneNumberController.text,
                                  date: Timestamp.now(), // falsches Datum !!!!!!!!
                                  eventDescription: Controller.descriptionController.text,
                                  host: Controller.hostController.text,
                                  eventTitle: Controller.eventTitleController.text,
                                  contactPerson: Controller.contactPersonController.text,
                                  location: Address(street: Controller.streetnameController.text, city: Controller.placeController.text, zipCode: Controller.zipCodeController.text),
                                  material: EventMaterials(
                                    planer: Controller.planerController.text,
                                    food: Controller.foodController.text,
                                    information: Controller.informationController.text,
                                    clothes: Controller.clothesController.text,
                                  ))));
                        },
                        text: 'Update Event');
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
