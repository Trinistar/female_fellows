import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/german_locale.dart';
import 'package:vs_femalefellows/pages/Event/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Event/EventComponents/participants_rowWhite.dart';

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
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
              height: 215,
              width: 1000,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'lib/images/Mask group2.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Artbar(colorleft: Theme.of(context).colorScheme.secondary, colorright: Theme.of(context).colorScheme.primary),
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
                        formatDate(widget.event.dates!.created!.toDate(), <String>[d, '. ', MM, ' ', yyyy], locale: GermanLocale()),
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.event.location.street,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${widget.event.location.zipCode} ${widget.event.location.city}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                        widget.event.email,
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
                        widget.event.phoneNumber,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                  ParticipantsImageRowWhite(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                    child: Center(
                      child: GestureDetector(
                        child: Text(
                          'Zum Event Chat',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                        onTap: () {
                          launchUrl(Uri.parse(widget.event.whatsAppLink));
                        },
                      ),
                    ),
                  ),
                  FFButton(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    text: 'Zurück zu den Events',
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
