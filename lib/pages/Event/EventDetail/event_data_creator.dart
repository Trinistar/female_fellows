import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/models/user_model.dart';

class ParticipantsData extends StatelessWidget {
  const ParticipantsData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 1500,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'TEILNEHMER:',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 5,
              endIndent: 300,
              indent: 20,
            ),
            SizedBox(
              height: 1000,
              child: BlocBuilder<EventBloc, EventState>(
                builder: (context, state) {
                  if (state is EventLoaded) {
                    if (state.event.participants.isNotEmpty) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return _header();
                          } else {
                            return _partItem(state.event.participants[index - 1]);
                          }
                        },
                        itemCount: state.event.participants.length + 1,
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('Bild'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Kontakt'),
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text('Kinderbetreuung'),
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text('Dolmetscher'),
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              'Fotoeinwilligung',
            ),
          ),
        ),
      ],
    );
  }

  Widget _partItem(FFUser user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user.profilPicture ?? ''),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(user.firstname!),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(user.lastname!),
                      ),
                    ],
                  ),
                  Text(user.email!),
                  Text(user.notification != null ? user.notification!.phonenumber : ''),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(user.eventParticipant != null
                ? user.eventParticipant!.childCare!.needed
                    ? 'ja'
                    : 'nein'
                : 'keine Angabe'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(user.eventParticipant != null
                ? user.eventParticipant!.interpreter!.needed
                    ? 'ja'
                    : 'nein'
                : 'keine Angabe'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(user.eventParticipant != null
                ? user.eventParticipant!.mediaConsent!
                    ? 'ja'
                    : 'nein'
                : 'keine Angabe'),
          ),
        ],
      ),
    );
  }
}
