import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/TandemOnboardingBloc/tandem_onboarding_bloc.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/pages/Event/EventSignup/event_not_authenticated.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemMatching/tandem_matching.dart';
import 'package:vs_femalefellows/pages/Tandem/TandemSteps/tandem_steps.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_carousel.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_comments.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_faqs.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_header.dart';

class Tandementry extends StatefulWidget {
  const Tandementry({super.key});

  @override
  State<Tandementry> createState() => _TandementryState();
}

class _TandementryState extends State<Tandementry> {
  bool showSteps = false;
  void toggleSteps() {
    setState(() {
      showSteps = !showSteps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TandemOnboardingBloc, TandemOnboardingState>(
      builder: (context, state) {
        if (state is IsTandemOnboardingState) {
          return _tandemOnboarding(context);
        } else {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser) {
                return TandemMatching();
              } else {
                return _tandemOnboarding(context);
              }
            },
          );
        }
      },
    );
  }

  Scaffold _tandemOnboarding(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: ListView(
        children: [
          TandemHeader(),
          DividerBouthCorner(color1: Colors.white, color2: Theme.of(context).colorScheme.tertiary),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              //Local
              if (state is AuthenticatedUser) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          state.userProfile?.localOrNewcomer == LocalOrNewcomer.local ? 'Als Local beim Tandem-Projekt mitmachen' : 'Als Newcomerin beim Tandem-Projekt mitmachen',
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
                          state.userProfile?.localOrNewcomer == LocalOrNewcomer.local
                              ? 'Du wohnst schon länger in Deutschland und möchtest dich für ein gutes Zusammenleben ALLER stark machen, und bist an einem kulturellen'
                              : 'Du bist entweder neu in Deutschland oder wohnst schon länger in Deutschland? Du wünschst dir eine Freundin zum Austauschen oder Kontakt zu Frauen,',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
                //Newcomer
                //Unauthenticated
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          'Als Local oder Newcomerin beim Tandem-Projekt mitmachen',
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
                          'Das Female Fellows Tandemprojekt verbindet Frauen mit und ohne Flucht- und Migrationserfahrung. ',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              'Mehr erfahren',
              style: TextStyle(fontSize: 12, color: Colors.amber[900]),
            ),
          ),
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
                      'Wie funktioniert´s',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: toggleSteps,
                        icon: Icon(
                          showSteps ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
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
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser) {
                return GestureDetector(
                  onTap: () => context.go('/tandem/tandemOnboarding'),
                  child: Container(
                    padding: EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        'Jetzt mit Tandem matchen',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () => context.go('/eventNotAuthenticated'),
                  child: Container(
                    padding: EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        'Jetzt mit Tandem matchen',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          DividerBouthCorner(color1: Theme.of(context).colorScheme.surface, color2: Colors.white),
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
                      'Was kann man als Tandem gemeinsam unternehmen? ',
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
                  TandemCarousel(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          DividerBouthCorner(color1: Theme.of(context).colorScheme.tertiary, color2: Theme.of(context).colorScheme.surface),
          TandemComments(),
          DividerBouthCorner(
            color1: Colors.white,
            color2: Theme.of(context).colorScheme.tertiary,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tandem-Stories',
                    style: TextStyle(
                      fontSize: 20,
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
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.only(topRight: Radius.circular(60), topLeft: Radius.circular(60))),
            height: 50,
          ),
          FAQs(),
        ],
      ),
    );
  }
}
