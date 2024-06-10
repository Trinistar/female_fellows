import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:femalefellows/models/enums.dart';
import 'package:femalefellows/pages/Authentication/authentication_adress.dart';
import 'package:femalefellows/pages/Authentication/authentication_age.dart';
import 'package:femalefellows/pages/Authentication/authentication_local.dart';
import 'package:femalefellows/pages/Authentication/authentication_notification.dart';
import 'package:femalefellows/pages/Authentication/authentication_safety.dart';
//import 'package:femalefellows/pages/Authentication/authentication_connection.dart'; // unused page //
import 'package:femalefellows/pages/Authentication/authentication_socialmedia.dart';
import 'package:femalefellows/pages/Authentication/authentication_verification.dart';
import 'package:femalefellows/pages/Authentication/authentication_who.dart';

class RegistrationEntry extends StatefulWidget {
  const RegistrationEntry({super.key, this.isFromOnboarding = false});

  final bool isFromOnboarding;

  @override
  State<RegistrationEntry> createState() => _RegistrationEntryState();
}

class _RegistrationEntryState extends State<RegistrationEntry> {
  PageController _controller = PageController();
  bool _accepted = false;
  bool _disabledNextButton = false;
  bool _choiceNewsletter = false;
  bool _contactcall = false;
  bool _contactemail = false;
  bool _contactwhatsapp = false;
  LocalOrNewcomer _userchoice = LocalOrNewcomer.newcomer;
  Socialmedia _mediachoice = Socialmedia.facebook;
  final int _pageCount = 7;
  Timestamp _birthday = Timestamp.now();
  XFile _picture = XFile('');

  void _choiceForContact(
    bool valuecall,
    bool valuewhatsapp,
    bool valueemail,
  ) {
    setState(() {
      if (valuecall) {
        _contactcall = true;
      } else {
        _contactcall = false;
      }
    });
  }

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

  void _checkNewsletter(bool newsletterchoice) {
    setState(() {
      if (newsletterchoice) {
        _choiceNewsletter = true;
      } else {
        _choiceNewsletter = false;
      }
    });
  }

  void _mediaChosen(Socialmedia socialmedia) {
    _mediachoice = socialmedia;
  }

  void _hasChosen(LocalOrNewcomer localOrNot) {
    _userchoice = localOrNot;
  }

  void updateId(bool newId) {
    setState(() {
      _accepted = newId;
    });
  }

  void _getBirthday(Timestamp birthday) {
    setState(() {
      _birthday = birthday;
    });
  }

  void _profilePicture(XFile picture) {
    _picture = picture;
  }

  void _handlePageChange() {
    if (_controller.page!.toInt() == _pageCount - 1) {
      _accepted ? _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn) : null;
    } else {
      _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('lib/images/FF-Logo_blau-1.png', height: 80, alignment: Alignment(0, -0.8)),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  if (index == _pageCount - 1 && !_accepted) {
                    setState(() {
                      _disabledNextButton = true;
                      _accepted = false;
                    });
                  }
                  if (index == _pageCount) {
                    setState(() {
                      _disabledNextButton = true;
                      //_accepted = false;
                    });
                  }
                },
                children: [
                  // Pages one Onboarding
                  AuthWho(picture: _profilePicture),
                  Authlocal(
                    hasChosen: _hasChosen,
                    onSettingsChanged: updateId,
                  ),
                  AuthAge(birthday: _getBirthday),
                  AuthAdress(),
                  AuthSocialmedia(hasMediaChosen: _mediaChosen),
                  AuthNotification(choiceContact: _choiceForContact),
                  AuthSafety(
                    wantsNewsletter: _checkNewsletter,
                    hasConfessed: _hasUserConfessed,
                    onSettingsChanged: updateId,
                  ),
                  if (_accepted)
                    AuthVerfication(
                      birthday: _birthday,
                      userchoice: _userchoice,
                      mediachoice: _mediachoice,
                      wantsNewsletter: _choiceNewsletter,
                      isFromOnboarding: widget.isFromOnboarding,
                      picture: _picture,
                    )
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
                          Navigator.of(context).pop();
                        } else {
                          _controller.previousPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                        }
                      },
                      child: Text('Back')),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: _pageCount + 1,
                  ),
                  MaterialButton(
                    disabledTextColor: Colors.grey,
                    onPressed: _disabledNextButton ? null : _handlePageChange,
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
