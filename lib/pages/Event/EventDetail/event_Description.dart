import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';

class EventDescription extends StatelessWidget {
  const EventDescription({super.key, });

  @override
  Widget build(BuildContext context) {
    var event = context.read<Event>();
    return    Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Über das Event',
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(
                      thickness: 5,
                      endIndent: 320,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 150,
                      width: 350,
                      child: Text(
                        event.description,
                       style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              );
  }
}