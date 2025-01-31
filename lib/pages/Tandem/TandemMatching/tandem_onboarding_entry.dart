import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/blocs/TandemOnboardingBloc/tandem_onboarding_bloc.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/pages/Authentication/Login/login_page.dart';
import 'package:femalefellows/pages/Tandem/TandemMatching/tandem_about_you.dart';
import 'package:femalefellows/pages/Tandem/TandemMatching/tandem_languages.dart';
import 'package:femalefellows/provider/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TandemOnboardingEntry extends StatefulWidget {
  const TandemOnboardingEntry({super.key});

  @override
  State<TandemOnboardingEntry> createState() => _TandemOnboardingEntryState();
}

class _TandemOnboardingEntryState extends State<TandemOnboardingEntry> {
  PageController _controller = PageController();
  bool _onLastPage = false;
  UserLanguages _userLanguages = UserLanguages(main: FFLanguage('de', 'German', 'Deutsch'), additional: []);
  void _getUserLanguages(UserLanguages languages) => _userLanguages = languages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticatedUser) {
          return _tandemOnboarding(context, state.userProfile!);
        } else {
          return const LoginPage();
        }
      },
    );
  }

  Scaffold _tandemOnboarding(BuildContext context, FFUser profile) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Image.asset('lib/images/FF-Logo_blau-1.png', height: 80, alignment: Alignment(0, -0.8)),
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
              AppLocalizations.of(context)!.tandemMatchingAnmeldungOverlayTwoSubtitle,
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
                TandemLanguages(userLanguages: _getUserLanguages),
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
                            _controller.previousPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.buttonBack))
                    : Container(
                        width: 85,
                      ),
                Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                  ),
                ),
                _onLastPage
                    ? MaterialButton(
                        disabledTextColor: Colors.grey,
                        onPressed: () {
                          final FFUser updatedUserProfile = profile;
                          updatedUserProfile.aboutMe = Controller.aboutYouController.text;
                          updatedUserProfile.languages = _userLanguages;
                          context.read<AuthenticationBloc>().add(UpdateUserProfileEvent(userId: (context.read<AuthenticationBloc>().state as AuthenticatedUser).user!.uid, userProfile: profile));
                          context.read<TandemOnboardingBloc>().add(TandemOnboardingDoneEvent());

                          Navigator.of(context).maybePop();
                        },
                        child: Text(AppLocalizations.of(context)!.tandemMatchingRouting),
                      )
                    : MaterialButton(
                        disabledTextColor: Colors.grey,
                        onPressed: () {
                          _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                        },
                        child: Text(AppLocalizations.of(context)!.buttonNext),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
