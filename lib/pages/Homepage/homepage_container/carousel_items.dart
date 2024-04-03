import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/widgets/favorites_icon_widget.dart';

class CarouselItem extends StatelessWidget {
  CarouselItem({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () => context.go('/home/detailEvent/${event.id}'),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    children: [
                      Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                          child: Image.asset('lib/images/Mask group2.png')),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: SizedBox(height: 25, child: Text(event.title)),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_2_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(
                                  event.host,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(
                                  event.location.city,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                )),
                                FavoritesIconWidget(event: event),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 25),
              child: Center(
                  child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Versatz des Schattens
                  ),
                ], color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 40,
                height: 40,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Text(
                        formatDate(
                          event.dates!.created!.toDate(),
                          <String>[d],
                        ),
                        style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          formatDate(
                            event.dates!.created!.toDate(),
                            <String>[
                              MM,
                            ],
                          ),
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
