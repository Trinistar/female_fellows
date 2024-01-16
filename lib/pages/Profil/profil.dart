import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is AuthenticatedUser &&
                    HelperFunctions.isAdmin(state.tokenResult!.claims)) {
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
                    onPressed: () =>
                        context.read<AuthenticationBloc>().add(SignOutEvent()),
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
        body: Container(
            height: 500,
            color: Theme.of(context).colorScheme.primary,
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticatedUser) {
                  return ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hallo ${state.user!.email!},',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'Schön, dass du dabei bist!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (state is UnauthenticatedUser) {
                  return Center(
                    child: MaterialButton(
                      color: Colors.black,
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                      child: Text(
                        'Bitte einloggen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
                return Container();
              },
            )),
      ),
    );
  }
}
