import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/german_locale.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event.dart';

class EventListTile extends StatelessWidget {
  EventListTile({super.key, required this.event});

  final FirestoreEventRepository repo = FirestoreEventRepository();
  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
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
                        event.eventTitle,
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
                                  formatDate(event.date.toDate(), <String>[d, '. ', MM, ' ', yyyy], locale: GermanLocale()),
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
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 20,
                              ),
                              Text(
                                event.location,
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
                if (state is AuthenticatedUser && event.eventId != null) {
                  print('CALLED ${state.userProfile!.favorites.length}');
                  return _favoriteIcon(state.userProfile!, event.eventId!, context);
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _favoriteIcon(FFUser userProfile, String eventId, BuildContext context) {
    return IconButton(
      onPressed: () async {
        _updateFavorites(userProfile, eventId, context);
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

  void _updateFavorites(FFUser userProfile, String eventId, BuildContext context) async {
    List<String> favorites = List<String>.empty();
    favorites = List.from([...userProfile.favorites], growable: false);
    if (favorites.contains(eventId)) {
      favorites.remove(eventId);
    } else {
      //favorites.add(eventId);
      favorites = List.from([
        ...favorites,
        ...[eventId]
      ]);
    }
    userProfile.favorites = List.from([...favorites], growable: false);
    HapticFeedback.heavyImpact();

    if (BlocProvider.of<AuthenticationBloc>(context).state is AuthenticatedUser) {
      context.read<AuthenticationBloc>().add(UpdateUserProfileEvent((BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).user!.uid, userProfile: userProfile));
    }
  }
}
