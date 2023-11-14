import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/event_ListTile.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return 
              EventListTile();

  }
}