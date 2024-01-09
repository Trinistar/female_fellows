import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/german_locale.dart';
import 'package:vs_femalefellows/models/user_model.dart';
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
                          Flexible(
                            child: Text(
                              formatDate(widget.event.date.toDate(), <String>[d, '. ', MM, ' ', yyyy], locale: GermanLocale()),
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
                            widget.event.location,
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticatedUser) {
              return _favoriteIcon(state.userProfile!, widget.event.eventId!);
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  Widget _favoriteIcon(FFUser userProfile, String eventId) {
    return IconButton(
      onPressed: () {
        _updateFavorites(userProfile, eventId);
      },
      icon: (userProfile.favorites.contains(eventId))
          ? Icon(
              Icons.favorite,
            )
          : Icon(
              Icons.favorite_outline,
            ),
    );
  }

  void _updateFavorites(FFUser userProfile, String eventId) async {
    List<String> favorites = <String>[];
    favorites = userProfile.favorites.toList();
    if (userProfile.favorites.contains(eventId)) {
      favorites.remove(eventId);
    } else {
      favorites.add(eventId);
    }
    userProfile.favorites = favorites;
    setState(() {});
    HapticFeedback.heavyImpact();

    if (BlocProvider.of<AuthenticationBloc>(context).state is AuthenticatedUser) {
          context.read<AuthenticationBloc>().add(UpdateUserProfileEvent((BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).user!.uid, userProfile: userProfile));

    }
  }
}
