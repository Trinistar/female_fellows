import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Event/EventComponents/color_artbar.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_Categorys.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_Description.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_Items.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_Materials.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_Pictures.dart';
import 'package:vs_femalefellows/pages/Event/EventDetail/event_data_creator.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_entry.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_not_authenticated.dart';
import 'package:vs_femalefellows/pages/Event/UpdateEvent/event_update.dart';
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
          print(state.event.title);
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UpdateEvent(
                          eventState: event,
                        ),
                      ),
                    );
                  },
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
                    final EventParticipant eventParticipant = EventParticipant(participating: false, userId: state.user!.uid);
                    context.read<AuthenticationBloc>().add(SetEventParticipationEvent(eventId: eventState.id!, userId: state.user!.uid, eventParticipant: eventParticipant, userData: state.userProfile!));
                  },
                  text: 'Anmeldung zurückziehen',
                  color: Colors.red,
                );
              } else {
                return FFButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Evententry(event: eventState)));
                  },
                  text: 'Verbindlich anmelden',
                );
              }
            } else if (state is UnauthenticatedUser) {
              return FFButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventNotAuthenticatedState()));
                },
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
        EventCategorys(),
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
