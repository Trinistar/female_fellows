import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_verification.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_start.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_age.dart';
//import 'package:vs_femalefellows/pages/Authentication/authentication_connection.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_how.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_notification.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_place.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_safety.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_who.dart';

class Authentry extends StatefulWidget {
  const Authentry({super.key});

  @override
  State<Authentry> createState() => _AuthentryState();
}

class _AuthentryState extends State<Authentry> {
  PageController _controller = PageController();

// Value for Checkboxes DataSafety
  void _hasUserConfessed(bool newValue2, bool newValue3) {
    setState(() {
      if (newValue2 && newValue3) {
        _accepted = true;
      } else {
        _accepted = false;
      }
    });
  }

  bool _accepted = false;

  void updateId(bool newId) {
    setState(() {
      _accepted = newId;
    });
  }

  void _handlePageChange() {
    if (_controller.page == 5) {
      _accepted
          ? _controller.nextPage(
              duration: Duration(microseconds: 500), curve: Curves.easeIn)
          : null;
    } else {
      _controller.nextPage(
          duration: Duration(microseconds: 500), curve: Curves.easeIn);
    }
  }

  //keep track of page
  bool onLastPage = false;

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
            onLastPage
                ? Container(
                    height: 150,
                    width: 1000,
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60, top: 25),
                          child: Image.asset('lib/images/FF-Logo_blau-1.png',
                              height: 80, alignment: Alignment(0, -0.8)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 50,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 150,
                    width: 1000,
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60, top: 25),
                          child: Image.asset('lib/images/FF-Logo_blau-1.png',
                              height: 80, alignment: Alignment(0, -0.8)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 50,
                          ),
                          child: Text(
                            'Mitglied werden',
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
                    onLastPage = (index == 6);
                  });

                  if (index == 5) {
                    setState(() {
                      _accepted = false;
                    });
                  }
                },
                children: [
                  // Pages one Onboarding
                  AuthWho(),
                  AuthAge(),
                  AuthPlace(),
                  AuthHow(),
                  AuthNotification(),
                  //  AuthConnect(),
                  AuthSafety(
                    hasConfessed: _hasUserConfessed,
                    onSettingsChanged: updateId,
                  ),
                  if (_accepted) AuthVerfication()
                ],
              ),
            ),
            //dot indicator
            onLastPage
                ? Container()
                : Container(
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
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OnboardingPage(),
                                ));
                              } else {
                                _controller.previousPage(
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.easeIn);
                              }
                            },
                            child: Text('Back')),
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 6,
                        ),
                        MaterialButton(
                          disabledTextColor: Colors.grey,
                          onPressed: _handlePageChange,
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
