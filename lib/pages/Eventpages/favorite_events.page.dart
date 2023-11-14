import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventComponents/event_ListTile.dart';

class FavoritEvents extends StatefulWidget {
  const FavoritEvents({super.key});

  @override
  State<FavoritEvents> createState() => _FavoritEventsState();
}

class _FavoritEventsState extends State<FavoritEvents> {
  @override
  Widget build(BuildContext context) {
    return           EventListTile();
  }
}