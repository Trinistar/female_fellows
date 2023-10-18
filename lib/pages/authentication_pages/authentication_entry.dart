import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_start.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/authentication_login.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_age.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_connection.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_how.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_notification.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_place.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_safety.dart';
import 'package:vs_femalefellows/pages/authentication_pages/authentication_who.dart';

class Authentry extends StatefulWidget {
  const Authentry({super.key});

  @override
  State<Authentry> createState() => _AuthentryState();
}

class _AuthentryState extends State<Authentry> {
  PageController _controller = PageController();

  int currentPage = 0;

  //keep track of last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor:  Theme.of(context).colorScheme.surface,),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:  Theme.of(context).colorScheme.surface,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            onLastPage
                ? Container()
                : Container(
                    height: 150,
                    width: 1000,
                    color:  Theme.of(context).colorScheme.surface,
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
                              color:  Theme.of(context).colorScheme.primary,
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
                    onLastPage = (index == 7);
                  });
                },
                children: [
                  // Pages one Onboarding
                  AuthWho(),
                  AuthAge(),
                  AuthPlace(),
                  AuthHow(),
                  AuthNotification(),
                  AuthConnect(),
                  AuthSafety(),
                  AuthLoginPage(),
                ],
              ),
            ),
            //dot indicator
            onLastPage
                ? Container()
                : Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 70,
                      width: 1000,
                      color:  Theme.of(context).colorScheme.surface,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
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
                            count: 7,
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(microseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Text('Next'),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
