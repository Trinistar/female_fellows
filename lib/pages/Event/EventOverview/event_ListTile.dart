import 'package:date_format/date_format.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/models/german_locale.dart';
import 'package:femalefellows/widgets/favorites_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventListTile extends StatelessWidget {
  EventListTile({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: (event.picture != null && event.picture!.isNotEmpty)
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          event.picture!,
                        ))
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'lib/images/partner1.png',
                        )),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Icon(
                              Icons.calendar_month_outlined,
                              size: 20,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              formatDate(event.dates!.created!.toDate(), <String>[d, '. ', MM, ' ', yyyy], locale: GermanLocale()),
                              style: TextStyle(fontSize: 13),
                            ),
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
                            event.host,
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthenticatedUser) {
                            return Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                ),
                                Text(
                                  '${event.location.street}\n${event.location.zipCode}, ${event.location.city}',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            );
                          } else if (state is UnauthenticatedUser) {
                            return Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                ),
                                Text(
                                  event.location.city,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /* Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, bottom: 30),
                child: SizedBox(
                  height: 90,
                  width: 1000,
                  child: ListTile(
                      leading: (event.picture != null && event.picture!.isNotEmpty)
                          ? Image.network(
                              event.picture!,
                              fit: BoxFit.fill,
                              width: 100,
                            )
                          : Image.asset(
                              'lib/images/partner1.png',
                              fit: BoxFit.fill,
                              width: 120,
                            ),
                      title: Text(
                        event.title,
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
                              Flexible(
                                child: Text(
                                  formatDate(event.dates!.created!.toDate(), <String>[d, '. ', MM, ' ', yyyy], locale: GermanLocale()),
                                  style: TextStyle(fontSize: 13),
                                ),
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
                                event.host,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          BlocBuilder<AuthenticationBloc, AuthenticationState>(
                            builder: (context, state) {
                              if (state is AuthenticatedUser) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                    ),
                                    Text(
                                      '${event.location.street}\n${event.location.zipCode}, ${event.location.city}',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                );
                              } else if (state is UnauthenticatedUser) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                    ),
                                    Text(
                                      event.location.city,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                        ],
                      )),
                ),
              ),
            ), */
            FavoritesIconWidget(event: event),
          ],
        ),
      ),
    );
  }
}
