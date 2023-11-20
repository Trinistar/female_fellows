import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/event_ListTile.dart';
import 'package:vs_femalefellows/pages/Eventpages/event_authentication_entry.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Evententry()));
                  },
      child: EventListTile());
  }
}
