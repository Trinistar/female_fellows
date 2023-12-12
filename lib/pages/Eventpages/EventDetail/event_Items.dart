import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/participants_image_row.dart';

class EventItems extends StatelessWidget {
  const EventItems({super.key});

  @override
  Widget build(BuildContext context) {
    var eventState =context.read<Event>();
    return      Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text(
                        eventState.date,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
                    ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text(
                       eventState.host,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text(
                    eventState.location,
                        style: TextStyle(fontSize: 15),
                      ),
                      subtitle: Text(
                        'Adresse anzeigen',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'lib/images/ImageIcon.png',
                        cacheHeight: 25,
                      ),
                      title: Text(
                       eventState.contactPerson,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        'Ansprechpartnerin',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    ParticipantsImageRow(),
                  ],
                ),
              );
  }
}