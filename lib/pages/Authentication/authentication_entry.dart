import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_local.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_verification.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_start.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_age.dart';
//import 'package:vs_femalefellows/pages/Authentication/authentication_connection.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_socialmedia.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_notification.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_adress.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_safety.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_who.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Authentry extends StatefulWidget {
  const Authentry({super.key});

  @override
  State<Authentry> createState() => _AuthentryState();
}

class _AuthentryState extends State<Authentry> {
  PageController _controller = PageController();
  bool onLastPage = false;
  bool _accepted = false;
  bool _disabledNextButton = false;
  LocalOrNewcomer _userchoice =LocalOrNewcomer.newcomer;
  Socialmedia _mediachoice= Socialmedia.facebook;
// Value for Checkboxes DataSafety

  void _hasUserConfessed(bool newValue2) {
    setState(() {
      if (newValue2) {
        _accepted = true;
        _disabledNextButton = false;
      } else {
        _accepted = false;
        _disabledNextButton = true;
      }
    });
  }

void _mediaChosen(Socialmedia socialmedia){
  _mediachoice =socialmedia;
}

  void _hasChosen( LocalOrNewcomer localOrNot) {
    _userchoice=localOrNot;
  }

  void updateId(bool newId) {
    setState(() {
      _accepted = newId;
    });
  }

  void _handlePageChange() {
    if (_controller.page == 6) {
      _accepted
          ? _controller.nextPage(
              duration: Duration(microseconds: 500), curve: Curves.easeIn)
          : null;
    } else {
      _controller.nextPage(
          duration: Duration(microseconds: 500), curve: Curves.easeIn);
    }
  }

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
                            AppLocalizations.of(context)!.authenticationTitle,
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
                    onLastPage = (index == 7);
                    _disabledNextButton = false;
                  });
                  if (index == 6) {
                    setState(() {
                      _disabledNextButton = true;
                      _accepted = false;
                    });
                  }
                },
                children: [
                  // Pages one Onboarding
                  AuthWho(),
                  Authlocal(
                    hasChosen: _hasChosen,
                    onSettingsChanged: updateId,
                  ),
                  AuthAge(),
                  AuthPlace(),
                  AuthHow(
                    hasMediaChosen: _mediaChosen,
                  ),
                  AuthNotification(),
                  AuthSafety(
                    hasConfessed: _hasUserConfessed,
                    onSettingsChanged: updateId,
                  ),
                  if (_accepted) AuthVerfication(userchoice: _userchoice,mediachoice: _mediachoice,)
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
                          count: 7,
                        ),
                        MaterialButton(
                          disabledTextColor: Colors.grey,
                          onPressed:
                              _disabledNextButton ? null : _handlePageChange,
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
