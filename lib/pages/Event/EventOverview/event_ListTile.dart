import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/german_locale.dart';
import 'package:vs_femalefellows/widgets/favorites_icon_widget.dart';

class EventListTile extends StatelessWidget {
  EventListTile({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
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
        ),
        FavoritesIconWidget(event: event),
      ],
    );
  }
}
