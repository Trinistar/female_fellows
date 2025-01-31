import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/blocs/LoginBloc/login_bloc.dart';
import 'package:femalefellows/blocs/LoginBloc/login_event.dart';
import 'package:femalefellows/blocs/LoginBloc/login_state.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/components/text_bar.dart';
import 'package:femalefellows/pages/Authentication/authentication_entry.dart';
import 'package:femalefellows/provider/controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<LoginPage> {
  //text editing controller

  // bool for Passwordicon
  bool isPasswordVisible = false;

  //bool for Remember me Checkbox
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          //if (state is AuthenticatedUser) context.go('/detailEvent/:id');
        },
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Image.asset('lib/images/FF-Logo_blau-1.png', height: 80, alignment: Alignment(0, -0.8)),
                    ),
                    SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).loginPageTitle,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              S.of(context).loginPageBody,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Text(
                                  S.of(context).email,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return TextBar(
                                  controller: Controller.emailController,
                                  hintText: 'frau@example.com',
                                  validator: (value) {
                                    if (state is LoginValidation) {
                                      state.isValidEmail ? null : 'Email is too short';
                                    }
                                  },
                                  obscureText: false,
                                  onChange: (value) => context.read<LoginBloc>().add(LoginEmailChanged(email: value)),
                                );
                              },
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Text(
                                  S.of(context).password,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return TextFormField(
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
                                );
                              },
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return FFButton(
                                  text: S.of(context).signin,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginBloc>().add(LoginSubmitted(email: Controller.emailController.text, password: Controller.passwordController.text));
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: Text(
                              S.of(context).signinTextup,
                              style: TextStyle(color: Theme.of(context).colorScheme.primary),
                            )),
                            Center(
                              child: GestureDetector(
                                onTap: () => context.push('/registrationPage'),
                                child: Text(
                                  S.of(context).signinTextdown,
                                  style: TextStyle(color: Theme.of(context).colorScheme.primary, decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            /* Center(
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarNavigation())),
                                child: Text(
                                  'Weiter ohne Anmeldung',
                                  style: TextStyle(color: Theme.of(context).colorScheme.primary, decoration: TextDecoration.underline),
                                ),
                              ),
                            ), */
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            listener: (BuildContext context, LoginState state) {
              if (state is SubmissionSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Du hast dich erfolgreich angemeldet'),
                  ),
                );
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarNavigation()));
              }
              if (state is SubmissionFailure) {
                SnackBar(
                  content: Text('Failure'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
