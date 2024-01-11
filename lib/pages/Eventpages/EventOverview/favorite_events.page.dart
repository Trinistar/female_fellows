import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/favorites/favorites_bloc.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventDetail/event_detail_page.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventOverview/event_ListTile.dart';

class FavoritEvents extends StatefulWidget {
  const FavoritEvents({super.key});

  @override
  State<FavoritEvents> createState() => _FavoritEventsState();
}

class _FavoritEventsState extends State<FavoritEvents> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailEvent(
                            eventState: state.favorites[index],
                          )));
                },
                child: EventListTile(
                  event: state.favorites[index],
                ),
              );
            },
            itemCount: state.favorites.length,
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
