import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/category.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/materials.dart';
import 'package:vs_femalefellows/pages/Event/CreateEvent/event_category_items.dart';
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
  Timestamp _newDate = Timestamp.now();
  List<int> _catIds = [];

  void _getCatIds(List<int> catIds) {
    _catIds = catIds;
  }

  void _getEventDate(Timestamp date) {
    _newDate = date;
  }

  @override
  void initState() {
    _setInputFields(widget.eventState);
    super.initState();
  }

  void _setInputFields(Event eventState) {
    Controller.eventTitleController.text = eventState.title;
  }

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
                            hintText: widget.eventState.title,
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
                UpdateEventDate(eventState: widget.eventState, newEventDate: _getEventDate),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                UpdateDesciption(event: widget.eventState),
                SizedBox(
                  height: 30,
                ),
                Container(
                color: Colors.white,
                width: 1000,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'lib/images/category.png',
                          cacheHeight: 30,
                        ),
                        title: Text('Kategorien'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CategoryItems(selectedCategories: _getCatIds, editingEvent: true, event: widget.eventState),
                    ],
                  ),
                ),
              ),
                UpdateMaterials(event: widget.eventState),
                SizedBox(
                  height: 30,
                ),
                FFButton(
                    onTap: () {
                      context.read<EventBloc>().add(
                            EventUpdate(
                              updateEvent: Event(
                                categories: _catIds,
                                id: widget.eventState.id,
                                whatsAppLink: Controller.whatsAppLinkController.text,
                                email: Controller.eventEmailController.text,
                                phoneNumber: Controller.eventPhoneNumberController.text,
                                dates: EventDates(updated: Timestamp.fromDate(DateTime.now()), eventDate: _newDate),
                                description: Controller.descriptionController.text,
                                host: Controller.hostController.text,
                                title: Controller.eventTitleController.text,
                                contactPerson: Controller.contactPersonController.text,
                                location: Address(street: Controller.streetnameController.text, city: Controller.placeController.text, zipCode: Controller.zipCodeController.text),
                                material: EventMaterials(
                                  planer: Controller.planerController.text,
                                  food: Controller.foodController.text,
                                  information: Controller.informationController.text,
                                  clothes: Controller.clothesController.text,
                                ),
                              ),
                            ),
                          );
                      context.pop();
                    },
                    text: 'Update Event'),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
