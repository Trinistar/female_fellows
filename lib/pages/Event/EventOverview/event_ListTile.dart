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
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
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
            ),
            Expanded(
              child: SizedBox(
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                formatDate(event.dates!.eventDate!.toDate(),
                                    <String>[d, '. ', MM, ' ', yyyy],
                                    locale: GermanLocale()),
                                style: TextStyle(fontSize: 13),
                              ),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              event.host,
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthenticatedUser) {
                            return state.user!.emailVerified
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '${event.location.street}\n${event.location.zipCode}, ${event.location.city}',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          event.location.city,
                                          style: TextStyle(fontSize: 13),
                                        ),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    event.location.city,
                                    style: TextStyle(fontSize: 13),
                                  ),
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
            FavoritesIconWidget(event: event),
          ],
        ),
      ),
    );
  }
}
