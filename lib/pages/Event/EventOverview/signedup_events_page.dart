import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/SignedupEvent/signedup_event_bloc.dart';
import 'package:femalefellows/pages/Event/EventOverview/event_list_tile.dart';
import 'package:femalefellows/generated/l10n.dart';

class SingedUpEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignedupEventsBloc, SignedupEventsState>(
      builder: (context, state) {
        if (state is SignedupEventsLoaded) {
          if (state.favorites.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                S.of(context).eventsPageEventState,
                style: TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context
                    .go('/events/detailEvent/${state.favorites[index].id!}'),
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
              S.of(context).eventsPageEventState,
              style: TextStyle(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
