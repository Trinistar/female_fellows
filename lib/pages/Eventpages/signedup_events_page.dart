import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/event_ListTile.dart';

class SingedUpEvents extends StatefulWidget {
  const SingedUpEvents({super.key});

  @override
  State<SingedUpEvents> createState() => _SingedUpEventsState();
}

class _SingedUpEventsState extends State<SingedUpEvents> {
  @override
  Widget build(BuildContext context) {
    return EventListTile();
  }
}