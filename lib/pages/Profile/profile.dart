import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/pages/Authentication/Login/login_page.dart';
import 'package:femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:femalefellows/pages/Profile/profil_header.dart';
import 'package:femalefellows/pages/Profile/profil_overview.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late TabController _profilTabController;

  @override
  void initState() {
    super.initState();
    _profilTabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        /* if (state is AuthenticatedUser) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Dein Profil wurde aktualisiert'),
            ),
          );
        } */
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
                  IconButton(
                    onPressed: () {
                      context.go('/profile/editProfile',
                          extra: state.userProfile);
                    },
                    icon: Icon(Icons.edit),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () =>
                        context.read<AuthenticationBloc>().add(SignOutEvent()),
                    icon: Icon(Icons.logout),
                    color: Colors.white,
                  ),
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
                          child: DividerBouthCorner(
                              color1: Colors.white,
                              color2: Theme.of(context).colorScheme.primary),
                        ),
                        Center(
                          child: (state.userProfile!.profilPicture != null &&
                                  state.userProfile!.profilPicture!.isNotEmpty)
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      state.userProfile!.profilPicture!),
                                  radius: 75,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      AssetImage('lib/images/ImageIcon.png'),
                                  radius: 75,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
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
                  if (!state.user!.emailVerified) ...[
                    FFButton(
                      color: Colors.redAccent,
                      onTap: () => (BlocProvider.of<AuthenticationBloc>(context)
                              .state as AuthenticatedUser)
                          .user!
                          .sendEmailVerification(
                              HelperFunctions.getActionCodeSettings(
                                  (BlocProvider.of<AuthenticationBloc>(context)
                                          .state as AuthenticatedUser)
                                      .user!
                                      .email!)),
                      text: 'E-Mail-Adresse verifizieren',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                          'Bitte E-Mail verifizieren um an Events oder dem Tandem-Projekt teilzunehmen. Falls du keine Mail von uns bekommen hast, schaue im Spamordner nach. Wenn du den Link in der Mail bereits geklickt hast und diesen Text immer noch siehst, logge dich bitte erneut ein.'),
                    )
                  ],

                  ///User Inhalt
                  ///
                  ///
                  ///
                  SizedBox(
                    child: TabBar(controller: _profilTabController, tabs: [
                      Tab(
                        text: S.of(context).profilOverview,
                      ),
                      /* Tab(
                        text: S.of(context)!.profilProgress,
                      ) */
                    ]),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 600,
                    child:
                        TabBarView(controller: _profilTabController, children: [
                      ProfilOverview(
                        userstate: state.userProfile!,
                      ),
                      //TODO activate on implementation in later version
                      //ProfilProgress(),
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
          } else if (state is AuthenticationLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
