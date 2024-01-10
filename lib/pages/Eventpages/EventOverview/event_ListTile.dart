import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event.dart';

class EventListTile extends StatefulWidget {
  EventListTile({super.key, required this.event});
  final Event event;
 

  @override
  State<EventListTile> createState() => _EventListTileState();
}


class _EventListTileState extends State<EventListTile> {
  final FirestoreEventRepository repo = FirestoreEventRepository();
 

  @override
  Widget build(BuildContext context) {
        print(widget.event.eventTitle);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30, bottom: 30),
          child: SizedBox(
            height: 80,
            width: 320,
            child: ListTile(
                leading: Image.asset(
                  'lib/images/partner1.png',
                  fit: BoxFit.fill,
                  width: 80,
                ),
                title: Text(
                  widget.event.eventTitle,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 20,
                        ),
                        Text(
                       '${ widget.event.date.toDate().day}.${ widget.event.date.toDate().month}.${ widget.event.date.toDate().year}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          size: 20,
                        ),
                        Text(
                          widget.event.host,
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20,
                        ),
                        Text(
                           '${widget.event.location.street},${widget.event.location.city}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
        Icon(Icons.favorite_outline)
      ],
    );
  }
}
