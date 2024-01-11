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
        return ListView(
          physics: NeverScrollableScrollPhysics(),
          children: state
              .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailEvent(
                              eventState: e,
                            )));
                  },
                  child: EventListTile(
                    event: e,
                  )))
              .toList(),
        );
      },
    );
  }
}
