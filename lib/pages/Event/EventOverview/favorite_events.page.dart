import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/FavoritesBloc/favorites_bloc.dart';
import 'package:femalefellows/pages/Event/EventOverview/event_list_tile.dart';
import 'package:femalefellows/generated/l10n.dart';


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
          if (state.favorites.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                S.of(context)!.eventsPageFavorits,
                style: TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.go('/events/detailEvent/${state.favorites[index].id!}'),
                child: EventListTile(
                  event: state.favorites[index],
                ),
              );
            },
            itemCount: state.favorites.length,
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
                S.of(context)!.eventsPageFavorits,
              style: TextStyle(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
