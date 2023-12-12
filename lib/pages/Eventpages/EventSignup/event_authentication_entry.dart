import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventSignup/event_authentication_kids.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventSignup/event_authentication_pictures.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventSignup/event_authentication_translation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Evententry extends StatefulWidget {
  const Evententry({super.key, required this.event});
final Event event;
  @override
  State<Evententry> createState() => _EvententryState();
}

class _EvententryState extends State<Evententry> {
  PageController _controller = PageController();
  bool _onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              width: 1000,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(top: 30, child: BackButton()),
                      Padding(
                        padding: const EdgeInsets.only(left: 60, top: 25),
                        child: Image.asset('lib/images/FF-Logo_blau-1.png',
                            height: 80, alignment: Alignment(0, -0.8)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 50,
                    ),
                    child: Text(
                      'Event-Anmeldung',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
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
                  EventTranslationAuthentication(),
                  EventKidsAuthentication(),
                  EventPictureAuthentication(event: widget.event),
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
                          _controller.previousPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.easeIn);
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
                            _controller.nextPage(
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text('Next'),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
