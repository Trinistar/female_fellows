import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/pages/Profil/profil_header.dart';
import 'package:vs_femalefellows/pages/Profil/profil_overview.dart';
import 'package:vs_femalefellows/pages/Profil/profil_progress.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> with TickerProviderStateMixin {
  late TabController _profilTabController;
  @override
  void initState() {
    super.initState();
    _profilTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticatedUser) {
            return Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                actions: [
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      if (state is AuthenticatedUser) {
                        return IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Profil(),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      if (state is AuthenticatedUser) {
                        return IconButton(
                          onPressed: () => context.read<AuthenticationBloc>().add(SignOutEvent()),
                          icon: Icon(Icons.logout),
                          color: Colors.white,
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  )
                ],
              ),
              body: ListView(
                children: [
                  ProfilHeader(),
                  SizedBox(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 25,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: DividerBouthCorner(color1: Colors.white, color2: Theme.of(context).colorScheme.primary),
                        ),
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('lib/images/Avatar.png'),
                            radius: 75,
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        state.userProfile!.firstname!,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),

                  ///User Inhalt
                  ///
                  ///
                  SizedBox(
                    child: TabBar(controller: _profilTabController, tabs: [
                      Tab(
                        text: 'Übersicht',
                      ),
                      Tab(
                        text: 'Fortschritt',
                      )
                    ]),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 400,
                    child: TabBarView(controller: _profilTabController, children: [
                      ProfilOverview(
                        userstate: state.userProfile!,
                      ),
                      ProfilProgress(),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          } else if (state is UnauthenticatedUser) {
            return LoginPage();
          }
          return Container();
        },
      ),
    );
  }
}
