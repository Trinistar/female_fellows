import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventOverview/event_ListTile.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_detail_page.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllEventsStore, List<Event>>(
      builder: (context, state) {
        return ListView(
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
