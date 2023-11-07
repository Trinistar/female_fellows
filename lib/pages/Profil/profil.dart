import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticatedUser) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/Avatar.png'),
                          radius: 25,
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      color: Colors.black,
                      onPressed: () => context.read<AuthenticationBloc>().add(SignOutEvent()),
                      child: Text(
                        'logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
        ));
  }
}
