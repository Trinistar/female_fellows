import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/models/german_locale.dart';
import 'package:femalefellows/pages/Event/EventComponents/color_artbar.dart';
import 'package:femalefellows/pages/Event/EventComponents/participants_rowWhite.dart';
import 'package:femalefellows/generated/l10n.dart' as intl;


class EventSuccess extends StatelessWidget {
  const EventSuccess({super.key, required this.event});

  final Event event;

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
                      formatDate(event.dates!.created!.toDate(), <String>[d, '. ', MM, ' ', yyyy], locale: GermanLocale()),
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
                      event.host,
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
                        event.location.street,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${event.location.zipCode} ${event.location.city}',
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
                    event.contactPerson,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    intl.S.of(context).eventOneRegisteredPerson,
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
                      event.email,
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
                      event.phoneNumber,
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
                        intl.S.of(context).eventOneRegisteredButtonOne,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(event.whatsAppLink));
                      },
                    ),
                  ),
                ),
                FFButton(
                  onTap: () => context.go('/events/detailEvent/${event.id}', extra: event),
                  text: intl.S.of(context).eventOneRegisteredButtonTwo,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
