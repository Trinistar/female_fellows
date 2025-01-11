import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/helper_functions.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/pages/Event/EventComponents/color_artbar.dart';
import 'package:femalefellows/pages/Event/EventDetail/event_Items.dart';
import 'package:femalefellows/pages/Event/EventDetail/event_categorys.dart';
import 'package:femalefellows/pages/Event/EventDetail/event_data_creator.dart';
import 'package:femalefellows/pages/Event/EventDetail/event_description.dart';
import 'package:femalefellows/pages/Event/EventDetail/event_materials.dart';
import 'package:femalefellows/pages/Event/EventDetail/event_pictures.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:femalefellows/widgets/favorites_icon_widget.dart';

class DetailEvent extends StatefulWidget {
  DetailEvent({super.key, required this.eventId});

  final String eventId;

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  void initState() {
    if (BlocProvider.of<AuthenticationBloc>(context).state
            is AuthenticatedUser &&
        HelperFunctions.isAdmin((BlocProvider.of<AuthenticationBloc>(context)
                .state as AuthenticatedUser)
            .tokenResult!
            .claims)) {
      BlocProvider.of<EventBloc>(context)
          .add(LoadEvent(eventId: widget.eventId, isAdmin: true));
    } else {
      BlocProvider.of<EventBloc>(context)
          .add(LoadEvent(eventId: widget.eventId));
    }
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => _reportDialog(context),
              icon: Icon(Icons.report),
            ),
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser &&
                  HelperFunctions.isAdmin(state.tokenResult!.claims)) {
                return IconButton(
                  onPressed: () => context.go(
                      '/events/detailEvent/${widget.eventId}/updateEvent',
                      extra: event),
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

  Future<void> _reportDialog(BuildContext context) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Event melden'),
          content: const Text(
              'Möchten Sie dieses Event wegen unangemessener Inhalte melden?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Abbrechen'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Melden'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _eventDetails(BuildContext context, Event eventState) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(top: 0),
          children: [
            Container(
              decoration: BoxDecoration(
                image: (eventState.picture != null &&
                        eventState.picture!.isNotEmpty)
                    ? DecorationImage(
                        image: NetworkImage(
                          eventState.picture!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage(
                          'lib/images/Mask group2.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60),
                ),
              ),
              height: 215,
              width: 1000,
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
                          eventState.title,
                          style: TextStyle(fontSize: 20),
                        ),
                        Positioned(
                          top: -10,
                          right: 10,
                          child: FavoritesIconWidget(
                            event: eventState,
                          ),
                        ),
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
            SizedBox(
              height: 30,
            ),
            EventDescription(event: eventState),
            EventCategorys(selectedCats: eventState.categories!),
            EventImages(),
            DividerBouthCorner(
              color1: Theme.of(context).colorScheme.surfaceContainerHighest,
              color2: Colors.white,
            ),
            EventMaterials(eventState: eventState),
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
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            )
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SignUpEventButtonWidget(
                    eventId: widget.eventId, eventState: eventState),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpEventButtonWidget extends StatelessWidget {
  const SignUpEventButtonWidget(
      {super.key, required this.eventId, required this.eventState});

  final String eventId;
  final Event eventState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticatedUser) {
          if (state.user!.emailVerified) {
            if (state.userProfile!.participatingEvents
                .contains(eventState.id)) {
              return FFButton(
                onTap: () {
                  final Map<String, dynamic> map = <String, dynamic>{};
                  map['participating'] = false;
                  context.read<AuthenticationBloc>().add(
                      RevokeEventParticipationEvent(
                          userId: state.user!.uid,
                          eventId: eventId,
                          userData: state.userProfile!,
                          participation: map));
                },
                text: AppLocalizations.of(context)!.eventButtonSignout,
                color: Colors.red,
              );
            } else {
              return FFButton(
                onTap: () => context.go(
                    '/events/detailEvent/$eventId/eventOnboarding',
                    extra: eventState),
                text: AppLocalizations.of(context)!.eventButtonSignin,
              );
            }
          } else {
            return Column(
              children: [
                FFButton(
                  color: Colors.redAccent,
                  onTap: () => (BlocProvider.of<AuthenticationBloc>(context)
                          .state as AuthenticatedUser)
                      .user!
                      .sendEmailVerification(
                          HelperFunctions.getActionCodeSettings(
                              (BlocProvider.of<AuthenticationBloc>(context)
                                      .state as AuthenticatedUser)
                                  .user!
                                  .email!)),
                  text: 'E-Mail-Adresse verifizieren',
                ),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                      'Bitte E-Mail verifizieren um an Events oder dem Tandem-Projekt teilzunehmen. Falls du keine Mail von uns bekommen hast, schaue im Spamordner nach. Wenn du den Link in der Mail bereits geklickt hast und diesen Text immer noch siehst, logge dich bitte erneut ein.'),
                )
              ],
            );
          }
        } else if (state is UnauthenticatedUser) {
          return FFButton(
            onTap: () => context.go(
                '/events/detailEvent/$eventId/eventNotAuthenticated',
                extra: eventState),
            text: AppLocalizations.of(context)!.eventButtonSignin,
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
