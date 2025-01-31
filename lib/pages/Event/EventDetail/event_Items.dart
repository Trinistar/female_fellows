import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/pages/Event/EventComponents/participants_image_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';


class EventItems extends StatelessWidget {
  const EventItems({super.key, required this.eventState});

  final Event eventState;

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
            title: Text(
              '${eventState.dates!.eventDate!.toDate().day}.${eventState.dates!.eventDate!.toDate().month}.${eventState.dates!.eventDate!.toDate().year}',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              S.of(context)!.createEventDate2,
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              eventState.host,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              S.of(context)!.createEventsHost,
              style: TextStyle(fontSize: 12),
            ),
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser) {
                return ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: state.user!.emailVerified ? Text(
                    '${eventState.location.street}, ${eventState.location.zipCode} ${eventState.location.city}',
                    style: TextStyle(fontSize: 15),
                  ) : Text(
                    eventState.location.city,
                    style: TextStyle(fontSize: 15),
                  ),
                  subtitle: Text(
                   S.of(context)!.eventAdress ,
                    style: TextStyle(fontSize: 12),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              'lib/images/avatar-5.svg',
              height: 25,
            ),
            title: Text(
              eventState.contactPerson,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
             S.of(context)!.createEventsContactPerson2 ,
              style: TextStyle(fontSize: 12),
            ),
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser &&
                  state.userProfile!.participatingEvents
                      .contains(eventState.id)) {
                return GestureDetector(
                  onTap: () => launchUrl(Uri.parse(eventState.whatsAppLink)),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'lib/images/chat.svg',
                      height: 20,
                    ),
                    title: Text(
                      eventState.whatsAppLink,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      S.of(context)!.createEventWhatsApp2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          ParticipantsImageRow(),
        ],
      ),
    );
  }
}
