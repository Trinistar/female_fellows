import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login.dart';
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
  const DetailEvent({super.key, required this.eventState});
  final Event eventState;

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Event>(
      create: (context) => widget.eventState,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is AuthenticatedUser &&
                    HelperFunctions.isAdmin(state.tokenResult!.claims)) {
                  return IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UpdateEvent(
                            eventState: widget.eventState,
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
        body: BlocListener<EventBloc, EventState>(
          listener: (context, state) {
            if (state is UpdateEventSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                      'Event erfolgreich bearbeitet'),
                ),
              );
            }
          },
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(60))),
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
              Artbar(
                  colorleft: Theme.of(context).colorScheme.secondary,
                  colorright: Colors.white),
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
                            widget.eventState.title,
                            style: TextStyle(fontSize: 20),
                          ),
                          Positioned(
                            top: -10,
                            right: 10,
                            child: FavoritesIconWidget(
                              event: widget.eventState,
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
                event: widget.eventState,
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticatedUser) {
                    if (state.userProfile!.participatingEvents
                        .contains(widget.eventState.id)) {
                      return FFButton(
                        onTap: () {
                          final EventParticipant eventParticipant =
                              EventParticipant(
                                  participating: false,
                                  userId: state.user!.uid);
                          context.read<AuthenticationBloc>().add(
                              SetEventParticipationEvent(
                                  eventId: widget.eventState.id!,
                                  userId: state.user!.uid,
                                  eventParticipant: eventParticipant,
                                  userData: state.userProfile!));
                        },
                        text: 'Anmeldung zurückziehen',
                        color: Colors.red,
                      );
                    } else {
                      return FFButton(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Evententry(event: widget.eventState)));
                        },
                        text: 'Verbindlich anmelden',
                      );
                    }
                  } else if (state is UnauthenticatedUser) {
                    return FFButton(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EventNotAuthenticatedState()));
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
              EventDescription(),
              EventCategorys(),
              EventImages(),
              DividerBouthCorner(
                color1: Theme.of(context).colorScheme.surfaceVariant,
                color2: Colors.white,
              ),
              EventMaterials(),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticatedUser &&
                      HelperFunctions.isAdmin(state.tokenResult!.claims)) {
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
          ),
        ),
      ),
    );
  }
}
