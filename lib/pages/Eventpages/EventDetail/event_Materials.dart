import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';

class EventMaterials extends StatelessWidget {
  const EventMaterials({super.key,});

  @override
  Widget build(BuildContext context) {
    var eventState = context.read<Event>();
    return      Container(
                width: 1000,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Was muss ich mitbringen',
                        style: TextStyle(fontSize: 20),
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.primary,
                        thickness: 5,
                        endIndent: 320,
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/notebook.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Notizbuch & Stifte'),
                        subtitle: Text(eventState.material!.planer),
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/book.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Wörterbuch'),
                        subtitle: Text(eventState.material!.book),
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/food.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Kulinarische Köstlichkeiten'),
                        subtitle: Text(eventState.material!.food),
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/globe.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Kulturelle Informationen'),
                        subtitle: Text(eventState.material!.information),
                      ),
                      ListTile(
                        isThreeLine: true,
                        leading: Image.asset(
                          'lib/images/globe.png',
                          cacheHeight: 45,
                        ),
                        title: Text('Kleidung'),
                        subtitle: Text(eventState.material!.clothes),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
  }
}