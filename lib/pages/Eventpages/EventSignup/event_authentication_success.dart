import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/participants_rowWhite.dart';

class EventSuccess extends StatefulWidget {
  const EventSuccess({super.key, required this.event});
  final Event event;
  @override
  State<EventSuccess> createState() => _EventSuccessState();
}

class _EventSuccessState extends State<EventSuccess> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.secondary,
        ),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: ListView(children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60))),
              height: 215,
              width: 1000,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'lib/images/Mask group2.png',
                    fit: BoxFit.cover,
                  ),
                  BackButton(),
                ],
              ),
            ),
            Artbar(
                colorleft: Theme.of(context).colorScheme.secondary,
                colorright: Theme.of(context).colorScheme.primary),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      title: Text(
                        widget.event.date.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                  ListTile(
                      leading: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        widget.event.host,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                  ListTile(
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      widget.event.location,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Adresse',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'lib/images/ImageIcon.png',
                      cacheHeight: 25,
                    ),
                    title: Text(
                      widget.event.contactPerson,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Ansprechpartnerin',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                        ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      title: Text(
                        widget.event.eventEmail,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                            ListTile(
                      leading: Icon(
                        Icons.phone_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        widget.event.eventPhoneNumber,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                  ParticipantsImageRowWhite(),
                ],
              ),
            ),
          ]),
        ));
  }
}
