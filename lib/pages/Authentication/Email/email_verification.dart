import 'package:femalefellows/blocs/LoginBloc/login_bloc.dart';
import 'package:femalefellows/blocs/LoginBloc/login_event.dart';
import 'package:femalefellows/blocs/LoginBloc/login_state.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/provider/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/AuthenticationBloc/authentication_bloc.dart';

class EmailCheck extends StatefulWidget {
  const EmailCheck({super.key, this.isDeleteAccount = false});

  final bool isDeleteAccount;

  @override
  State<EmailCheck> createState() => _EmailCheckState();
}

class _EmailCheckState extends State<EmailCheck> {
  final user = FirebaseAuth.instance.currentUser!;
  bool emailVerified = false;
  bool isPasswordVisible = false;

  //bool for Remember me Checkbox
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedUser) {
          context.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset('lib/images/FF-Logo_blau-1.png', height: 80, alignment: Alignment(0, -0.8)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.isDeleteAccount ? 'Bitte gib erneut dein Passwort ein, um den Löschprozess abzuschließen' : 'Bitte gib erneut dein Passwort ein, um den Verifizierungsprozess abzuschließen'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocProvider(
                create: (context) => LoginBloc(),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Center(
                      child: TextFormField(
                        validator: (value) {
                          if (state is LoginValidation) {
                            state.isValidPassword ? null : 'Password is too short';
                          }
                          return null;
                        },
                        onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(password: value)),
                        controller: Controller.passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Theme.of(context).colorScheme.surface,
                          filled: true,
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  isPasswordVisible = !isPasswordVisible;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: FFButton(
                  color: widget.isDeleteAccount ? Colors.redAccent : null,
                  onTap: () {
                    if (widget.isDeleteAccount) {
                      context.read<AuthenticationBloc>().add(DeleteAccountEvent(user: (context.read<AuthenticationBloc>().state as AuthenticatedUser).user!));
                      context.pop();
                      context.pop();
                    } else {
                      context.read<AuthenticationBloc>().add(
                            ReloadUserEvent(
                                email: (context.read<AuthenticationBloc>().state as AuthenticatedUser).user!.email!,
                                password: Controller.passwordController.text,
                                profile: (context.read<AuthenticationBloc>().state as AuthenticatedUser).userProfile!),
                          );
                    }
                  },
                  text: widget.isDeleteAccount ? 'Authentifizieren und löschen' : 'Einloggen'),
            ),
          ],
        ),
      ),
    );
  }
}
