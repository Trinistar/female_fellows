import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            children: [
              
              // Pages one Onboarding
            ],
          ),
          //dot indicator
          Container(
              alignment: Alignment(0, 0.9),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          _controller.previousPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('Back')),
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
                        children: [Text('Start'), Icon(Icons.arrow_forward)],
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
