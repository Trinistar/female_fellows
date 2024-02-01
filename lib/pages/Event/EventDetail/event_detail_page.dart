import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Event/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_Items.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_categorys.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_data_creator.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_description.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_materials.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_pictures.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_not_authenticated.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/widgets/favorites_icon_widget.dart';

class DetailEvent extends StatefulWidget {
  DetailEvent({super.key, required this.eventId});

  final String eventId;

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  void initState() {
    BlocProvider.of<EventBloc>(context).add(LoadEvent(eventId: widget.eventId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventBloc, EventState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is EventLoaded) {
          return _scaffold(context, state.event);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Scaffold _scaffold(BuildContext context, Event event) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser && HelperFunctions.isAdmin(state.tokenResult!.claims)) {
                return IconButton(
                  onPressed: () => context.go('/events/detailEvent/${widget.eventId}/updateEvent', extra: event),
                  icon: Icon(Icons.edit),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: _eventDetails(context, event),
    );
  }

  ListView _eventDetails(BuildContext context, Event eventState) {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: [
        Container(
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
          height: 215,
          width: 1000,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'lib/images/Mask group2.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Artbar(colorleft: Theme.of(context).colorScheme.secondary, colorright: Colors.white),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1000,
                height: 30,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      eventState.title,
                      style: TextStyle(fontSize: 20),
                    ),
                    Positioned(
                      top: -10,
                      right: 10,
                      child: FavoritesIconWidget(
                        event: eventState,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 5,
                color: Theme.of(context).colorScheme.primary,
                endIndent: 330,
              ),
            ],
          ),
        ),
        EventItems(
          eventState: eventState,
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticatedUser) {
              if (state.userProfile!.participatingEvents.contains(eventState.id)) {
                return FFButton(
                  onTap: () {
                    final Map<String, dynamic> map = <String, dynamic>{};
                    map['participating'] = false;
                    context.read<AuthenticationBloc>().add(RevokeEventParticipationEvent(userId: state.user!.uid, eventId: widget.eventId, userData: state.userProfile!, participation: map));
                  },
                  text: 'Anmeldung zurückziehen',
                  color: Colors.red,
                );
              } else {
                return FFButton(
                  onTap: () => context.go('/events/detailEvent/${widget.eventId}/eventOnboarding', extra: eventState),
                  text: 'Verbindlich anmelden',
                );
              }
            } else if (state is UnauthenticatedUser) {
              return FFButton(
                onTap: () => context.go('/events/detailEvent/${widget.eventId}/eventNotAuthenticated', extra: eventState),
                text: 'Verbindlich anmelden',
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        SizedBox(
          height: 30,
        ),
        EventDescription(event: eventState),
        EventCategorys(selectedCats: eventState.categories!),
        EventImages(),
        DividerBouthCorner(
          color1: Theme.of(context).colorScheme.surfaceVariant,
          color2: Colors.white,
        ),
        EventMaterials(eventState: eventState),
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticatedUser && HelperFunctions.isAdmin(state.tokenResult!.claims)) {
              return ParticipantsData();
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        Container(
          height: 30,
          color: Theme.of(context).colorScheme.surfaceVariant,
        )
      ],
    );
  }
}
