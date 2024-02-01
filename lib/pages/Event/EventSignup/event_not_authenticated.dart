import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';

class EventNotAuthenticatedState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedUser) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('lib/images/FF-Logo_blau-1.png', height: 60),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Image.asset(
                'lib/images/Empowerment 1.png',
              ),
              SizedBox(
                child: Text(
                  'Du hast es gleich geschafft!',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Unsere Events sind nur für Mitglieder des Vereins zugänglich. Du bist im Moment noch kein Mitglied.',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FFButton(
                  onTap: () => context.push('/loginPage'),
                  text: 'Kostenlos Mitglied werden',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
