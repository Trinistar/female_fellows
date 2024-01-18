import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_kids.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_pictures.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_success.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_authentication_translation.dart';

class Evententry extends StatefulWidget {
  const Evententry({super.key, required this.event});
  final Event event;
  @override
  State<Evententry> createState() => _EvententryState();
}

class _EvententryState extends State<Evententry> {
  PageController _controller = PageController();
  bool _onLastPage = false;
  Interpreter? _interpreter;

  void _getTranslator(Interpreter interpreter) => _interpreter = interpreter;

  void _sendRequest() {
    if (BlocProvider.of<AuthenticationBloc>(context).state is AuthenticatedUser) {
      final String userId = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).user!.uid;
      final FFUser data = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticatedUser).userProfile!;

      final EventParticipant eventParticipant = EventParticipant(participating: true, userId: userId, interpreter: _interpreter, childCare: ChildCare(needed: false, childName: null), mediaConsent: true);
      context.read<AuthenticationBloc>().add(SetEventParticipationEvent(eventId: widget.event.id!, userId: userId, eventParticipant: eventParticipant, userData: data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface,
      ),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticatedUser && state.userProfile!.participatingEvents.contains(widget.event.id)) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventSuccess(event: widget.event)));

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Du hast dich erfolgreich für dieses Event angemeldet'),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset('lib/images/FF-Logo_blau-1.png', height: 80, alignment: Alignment(0, -0.8)),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: Text(
                  'Event-Anmeldung',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _onLastPage = (index == 2);
                    });
                  },
                  children: [
                    EventTranslationAuthentication(needsTranslator: _getTranslator),
                    EventKidsAuthentication(),
                    EventPictureAuthentication(event: widget.event, sendRequest: _sendRequest),
                  ],
                ),
              ),
              //dot indicator
              Container(
                height: 70,
                width: 1000,
                color: Theme.of(context).colorScheme.surface,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        disabledTextColor: Colors.grey,
                        onPressed: () {
                          if (_controller.page == 0) {
                            Navigator.pop(context);
                          } else {
                            _controller.previousPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                          }
                        },
                        child: Text('Back')),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                    ),
                    _onLastPage
                        ? Container()
                        : MaterialButton(
                            disabledTextColor: Colors.grey,
                            onPressed: () {
                              _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                            },
                            child: Text('Next'),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
