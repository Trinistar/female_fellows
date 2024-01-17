import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';


class ProfilHeader extends StatelessWidget {
  const ProfilHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        color: Theme.of(context).colorScheme.primary,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticatedUser) {
              return ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hallo ${state.userProfile!.firstname!},',
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
            } 
            return Container();
          },
        ));
  }
}
