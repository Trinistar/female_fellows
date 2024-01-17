import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Event/EventOverview/event_ListTile.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_detail_page.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';

class SingedUpEvents extends StatefulWidget {
  const SingedUpEvents({super.key});

  @override
  State<SingedUpEvents> createState() => _SingedUpEventsState();
}

class _SingedUpEventsState extends State<SingedUpEvents> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribedEventsStore, List<Event>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              'Du hast dich noch für keine Events angemeldet',
              style: TextStyle(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailEvent(
                      eventId: state[index].id!,
                    ),
                  ),
                );
              },
              child: EventListTile(
                event: state[index],
              ),
            );
          },
          itemCount: state.length,
        );
      },
    );
  }
}
