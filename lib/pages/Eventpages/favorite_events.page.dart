import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/event_ListTile.dart';
import 'package:vs_femalefellows/pages/Eventpages/event_detail_page.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event.dart';

class FavoritEvents extends StatefulWidget {
  const FavoritEvents({super.key});

  @override
  State<FavoritEvents> createState() => _FavoritEventsState();
}

class _FavoritEventsState extends State<FavoritEvents> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteEventStore, List<Event>>(
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
