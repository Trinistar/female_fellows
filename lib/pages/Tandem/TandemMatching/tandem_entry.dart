import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_about_you.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_languages.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_matching.dart';

class TandemAuthentication extends StatefulWidget {
  const TandemAuthentication({super.key});

  @override
  State<TandemAuthentication> createState() => _TandemAuthenticationState();
}

class _TandemAuthenticationState extends State<TandemAuthentication> {
  PageController _controller = PageController();
  bool _onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Image.asset('lib/images/FF-Logo_blau-1.png',
            height: 80, alignment: Alignment(0, -0.8)),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 40),
            child: Text(
              'Tandem-Matching',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _onLastPage = (index == 1);
                });
              },
              children: [
                TandemAboutYou(),
                TandemLanguages(),
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
                _onLastPage
                    ? MaterialButton(
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
                        child: Text('Back'))
                    : Container(
                        width: 85,
                      ),
                Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                  ),
                ),
               _onLastPage ? MaterialButton(
                  disabledTextColor: Colors.grey,
                  onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TandemMatching()));
                  },
                  child: Text('Next'),
                ): MaterialButton(
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
    );
  }
}
