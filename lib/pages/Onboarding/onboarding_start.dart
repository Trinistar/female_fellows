import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_step1.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_step2.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_step3.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_step4.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_end.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  //keep track of pages
  PageController _controller = PageController();

  //keep track of last page
  bool onLastPage = false;

  //colorswitch
  bool colorChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 208, 220, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 25),
            child: Image.asset('lib/images/FF-Logo_blau-1.png',
                height: 80, alignment: Alignment(0, -0.8)),
          ),
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 4);
                colorChange = (index == 2);
              });
            },
            children: [
              // Pages one Onboarding
              Page1(),
              Page2(),
              Page3(),
              Page4(),
              Page5(),
            ],
          ),
          //dot indicator
          onLastPage
              ? Container(
                  alignment: Alignment(0, 0.9),
                  child: GestureDetector(
                      onTap: () {
                        _controller.jumpTo(0);
                      },
                      child: Text('Zurück zur Einleitung')),
                )
              : Container(
                  alignment: Alignment(0, 0.9),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(5);
                            },
                            child: Text('Skip')),
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Row(
                            children: [
                              Text('Start'),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
