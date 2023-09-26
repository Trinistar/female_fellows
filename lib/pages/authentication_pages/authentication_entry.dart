import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_start.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 25),
                child: Image.asset('lib/images/FF-Logo_blau-1.png',
                    height: 80, alignment: Alignment(0, -0.8)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 80,
                ),
                child: Text(
                  'Mitglied werden',
                  style: TextStyle(
                    color: Color.fromRGBO(27, 25, 86, 1),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),

          PageView(
            controller: _controller,
            children: [
              // Pages one Onboarding
              AuthWho(),
              AuthAge(),
              AuthPlace(),
              AuthHow(),
              AuthNotification(),
              AuthConnect(),
              AuthSafety(),
            ],
          ),
          //dot indicator
          Container(
            alignment: Alignment(0, 0.90),
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
        ],
      ),
    );
  }
}
