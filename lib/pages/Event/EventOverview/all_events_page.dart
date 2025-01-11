import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/pages/Event/EventOverview/event_list_tile.dart';
import 'package:femalefellows/provider/firebase/firestore_event_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllEventsStore, List<Event>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              AppLocalizations.of(context)!.eventsPageAllState,
              style: TextStyle(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => context.go('/events/detailEvent/${state[index].id!}'),
              child: EventListTile(
                event: state[index],
              ),
            );
          },
          itemCount: state.length,
        );
      },
    );
  }
}
