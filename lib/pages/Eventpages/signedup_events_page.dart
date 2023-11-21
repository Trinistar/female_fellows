import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/event_ListTile.dart';
import 'package:vs_femalefellows/pages/Eventpages/event_detail_page.dart';

class SingedUpEvents extends StatefulWidget {
  const SingedUpEvents({super.key});

  @override
  State<SingedUpEvents> createState() => _SingedUpEventsState();
}

class _SingedUpEventsState extends State<SingedUpEvents> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailEvent()));
        },
        child: EventListTile());
  }
}
