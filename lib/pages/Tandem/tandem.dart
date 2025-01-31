import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:femalefellows/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/blocs/TandemOnboardingBloc/tandem_onboarding_bloc.dart';
import 'package:femalefellows/models/enums.dart';
import 'package:femalefellows/pages/AfterTandem/matched_tandem.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:femalefellows/pages/Tandem/Activitys/tandem_activitys.dart';
import 'package:femalefellows/pages/Tandem/TandemMatching/tandem_matching.dart';
import 'package:femalefellows/pages/Tandem/TandemSteps/tandem_steps.dart';
import 'package:femalefellows/pages/Tandem/TandemStorys/tandem_carousel.dart';
import 'package:femalefellows/pages/Tandem/tandem_comments.dart';
import 'package:femalefellows/pages/Tandem/tandem_faqs.dart';
import 'package:femalefellows/pages/Tandem/tandem_faqs_new.dart';
import 'package:femalefellows/pages/Tandem/tandem_header.dart';

class Tandementry extends StatefulWidget {
  const Tandementry({super.key, this.isInfo = false});

  final bool isInfo;

  @override
  State<Tandementry> createState() => _TandementryState();
}

class _TandementryState extends State<Tandementry> {
  bool showSteps = false;
  bool showMoreText = false;
  void toggleSteps() {
    setState(() {
      showSteps = !showSteps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        if (widget.isInfo) {
          return _tandemOnboarding(context, authState);
        } else {
          return BlocBuilder<TandemOnboardingBloc, TandemOnboardingState>(
            builder: (context, tandemState) {
              if (tandemState is IsTandemOnboardingState) {
                return _tandemOnboarding(context, authState);
              } else {
                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticatedUser) {
                      final DateTime currentLocalTimeMinus24 = DateTime.now();
                      bool tooLate = false;
                      Duration difference = Duration.zero;
                      if (state.userProfile!.tandemMatches != null) {
                        difference = currentLocalTimeMinus24.difference(state
                            .userProfile!.tandemMatches!.first.requested
                            .toDate());
                        tooLate = difference.inHours >= 24;
                      }
                      if (state.userProfile!.tandemMatches != null &&
                          state.userProfile!.tandemMatches!.first.state ==
                              TandemMatchesState.confirmed) {
                        return AfterTandem();
                      }
                      final bool tandemRequestExists = (state
                                      .userProfile!.tandemMatches !=
                                  null &&
                              !tooLate &&
                              state.userProfile!.tandemMatches!.first.state !=
                                  TandemMatchesState.declined) &&
                          ((state.userProfile!.localMatch != null &&
                                  state.userProfile!.localMatch!.isNotEmpty) ||
                              (state.userProfile!.newcomerMatches != null &&
                                  state.userProfile!.newcomerMatches!
                                      .isNotEmpty));
                      if (tandemRequestExists) {
                        if (state.userProfile!.tandemMatches!.first.state ==
                            TandemMatchesState.confirmed) {
                          return AfterTandem();
                        } else if (state
                                .userProfile!.tandemMatches!.first.state ==
                            TandemMatchesState.requested) {
                          if (state.userProfile!.tandemMatches!.first
                                  .requester ==
                              state.userProfile!.id) {
                            return _tandemOnboarding(context, authState);
                          } else {
                            return TandemMatching();
                          }
                        } else {
                          return TandemMatching();
                        }
                      }
                      return TandemMatching();
                    } else {
                      return _tandemOnboarding(context, authState);
                    }
                  },
                );
              }
            },
          );
        }
      },
    );
  }

  Scaffold _tandemOnboarding(BuildContext context, AuthenticationState state) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: ListView(
        children: [
          TandemHeader(),
          DividerBouthCorner(
              color1: Colors.white,
              color2: Theme.of(context).colorScheme.tertiary),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              //Local//Newcomer
              if (state is AuthenticatedUser) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          state.userProfile?.localOrNewcomer ==
                                  LocalOrNewcomer.local
                              ? S.of(context).tandemMatchLocal
                              : S.of(context)
                                  .tandemMatchNewcomer,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        indent: 20,
                        endIndent: 310,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          state.userProfile?.localOrNewcomer ==
                                  LocalOrNewcomer.local
                              ? S.of(context)
                                  .tandemThirdStepBody
                              : S.of(context)
                                  .tandemThirdStepBody2,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
                //Unauthenticated
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          S.of(context).tandemLocalOrNewcomer,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        endIndent: 310,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          showMoreText
                              ? S.of(context).tandemSloganBody
                              : S.of(context).tandemSlogan,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showMoreText = !showMoreText;
                          });
                        },
                        child: Text(
                          showMoreText
                              ? S.of(context).getLess
                              : S.of(context).getMore,
                          style:
                              TextStyle(fontSize: 12, color: Colors.amber[900]),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          /*   Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              S.of(context)!.getMore,
              style: TextStyle(fontSize: 12, color: Colors.amber[900]),
            ),
          ), */
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [
                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).tandemHowDoesItWork,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: toggleSteps,
                        icon: Icon(
                          showSteps
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          if (showSteps) TandemSteps(),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<TandemOnboardingBloc, TandemOnboardingState>(
            builder: (context, tandemState) {
              if (tandemState is IsTandemOnboardingState) {
                return _tandemOnboardingButton(context);
              }
              return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticatedUser) {
                    final DateTime currentLocalTimeMinus24 = DateTime.now();
                    bool tooLate = false;
                    Duration difference = Duration.zero;
                    if (state.userProfile!.tandemMatches != null) {
                      difference = currentLocalTimeMinus24.difference(state
                          .userProfile!.tandemMatches!.first.requested
                          .toDate());
                      tooLate = difference.inHours >= 24;
                    }
                    final bool tandemRequestExists =
                        (state.userProfile!.tandemMatches != null &&
                                !tooLate &&
                                state.userProfile!.tandemMatches!.first.state !=
                                    TandemMatchesState.declined) &&
                            ((state.userProfile!.localMatch != null &&
                                    state
                                        .userProfile!.localMatch!.isNotEmpty) ||
                                (state.userProfile!.newcomerMatches != null &&
                                    state.userProfile!.newcomerMatches!
                                        .isNotEmpty));
                    if (tandemRequestExists) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        child: Row(
                          children: [
                            Center(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: CircularProgressIndicator(
                                      strokeCap: StrokeCap.round,
                                      backgroundColor: Colors.grey[100],
                                      value: (24 - difference.inHours) / 24,
                                      strokeWidth: 8,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    ),
                                  ),
                                  Text(
                                    '${24 - difference.inHours}h',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Dein Tandem-Match wird angefragt',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return _tandemOnboardingButton(context);
                    }
                  } else {
                    return GestureDetector(
                      onTap: () => context.go('/tandem/eventNotAuthenticated'),
                      child: Container(
                        padding: EdgeInsets.all(25),
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).tandemMatchNow,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.surface,
              color2: Colors.white),
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350,
                    child: Text(
                      S.of(context).tandemActivitiesTitle,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    indent: 0,
                    endIndent: 310,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ActivitysCarousel(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.tertiary,
              color2: Theme.of(context).colorScheme.surface),
          TandemComments(),
          DividerBouthCorner(
            color1: Colors.white,
            color2: Theme.of(context).colorScheme.tertiary,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      S.of(context).tandemStorys,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Divider(
                      thickness: 3,
                      indent: 0,
                      endIndent: 310,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TandemCarousel(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60))),
            height: 50,
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser) {
                if (state.userProfile?.localOrNewcomer ==
                    LocalOrNewcomer.local) {
                  return FAQs();
                }
              }
              return FAQsNew();
            },
          ),
        ],
      ),
    );
  }

  Widget _tandemOnboardingButton(BuildContext context) {
    var authState = context.read<AuthenticationBloc>().state;
    if (authState is AuthenticatedUser) {
      if (authState.user!.emailVerified) {
        return FFButton(
          onTap: () {
            widget.isInfo
                ? context.pop()
                : context.go('/tandem/tandemOnboarding');
          },
          text: 'Jetzt mit Tandem matchen',
        );
      } else {
        return Column(
          children: [
            FFButton(
              color: Colors.redAccent,
              onTap: () => (BlocProvider.of<AuthenticationBloc>(context).state
                      as AuthenticatedUser)
                  .user!
                  .sendEmailVerification(HelperFunctions.getActionCodeSettings(
                      (BlocProvider.of<AuthenticationBloc>(context).state
                              as AuthenticatedUser)
                          .user!
                          .email!)),
              text: 'E-Mail-Adresse verifizieren',
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text(
                  'Bitte E-Mail verifizieren um an Events oder dem Tandem-Projekt teilzunehmen. Falls du keine Mail von uns bekommen hast, schaue im Spamordner nach. Wenn du den Link in der Mail bereits geklickt hast und diesen Text immer noch siehst, logge dich bitte erneut ein.'),
            )
          ],
        );
      }
    } else {
      return FFButton(
        onTap: () {
          widget.isInfo
              ? context.pop()
              : context.go('/tandem/tandemOnboarding');
        },
        text: 'Jetzt mit Tandem matchen',
      );
    }
  }
}
