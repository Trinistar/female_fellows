import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EventNotAuthenticatedState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedUser) {
          //context.go('/events');
          context.pop();
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
                AppLocalizations.of(context)!.eventNotMemberEventTitle,
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
                  AppLocalizations.of(context)!.eventNotMemberEventBody,
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
                  text: AppLocalizations.of(context)!.eventNotMemberEventButton,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
