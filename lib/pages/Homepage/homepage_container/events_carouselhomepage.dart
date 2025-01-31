import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/carousel_items.dart';
import 'package:femalefellows/provider/firebase/firestore_event_repository.dart';

class EventCarousel extends StatelessWidget {
  const EventCarousel({super.key, this.pagechange});
  final void Function(int)? pagechange;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ),
            child: Text(
              S.of(context).homeEventsTeaserTitle,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 5,
              endIndent: 320,
              indent: 15,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          BlocBuilder<AllEventsStore, List<Event>>(
            builder: (context, state) {
              return SizedBox(
                height: 220,
                width: 1000,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount:state.length ,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CarouselItem(
                      event: state [index],
                    );
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,top: 30),
            child: GestureDetector(
              onTap: () => context.go('/events'),
              child: Text(
                'Zu allen Events',
                style: TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
