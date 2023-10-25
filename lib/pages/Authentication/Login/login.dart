import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/LoginBloc/login_bloc.dart';
import 'package:vs_femalefellows/blocs/LoginBloc/login_event.dart';
import 'package:vs_femalefellows/blocs/LoginBloc/login_state.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/pages/Homepage/navigation_page.dart';
import 'package:vs_femalefellows/services/controller.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is FormSubmitting) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                    width: 1000,
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60, top: 25),
                          child: Image.asset('lib/images/FF-Logo_blau-1.png',
                              height: 80, alignment: Alignment(0, -0.8)),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(
                                AppLocalizations.of(context)!.loginPageTitle,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(
                                AppLocalizations.of(context)!.loginPageBody,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(height: 25),

                            //username Textfield
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 42),
                              child: Row(
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return TextBar(
                                  controller: Controller.emailController,
                                  hintText: 'frau@example.com',

                                  validator: (value) {
                                    print(value);
                                    if (state is LoginValidation) {
                                      state.isValidEmail
                                          ? null
                                          : 'Email is to short';
                                      print(state.isValidEmail);
                                    }
                                  },

                                  obscureText: false,
                                  /////////BlocState/////
                                  onChange: (value) => context
                                      .read<LoginBloc>()
                                      .add(LoginEmailChanged(email: value)),
                                  /////////BlocState/////
                                );
                              },
                            ),
                            SizedBox(height: 25),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 42),
                              child: Row(
                                children: [
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ), /* 
                                            SizedBox(
                                              width: 120,
                                            ),
                                            Text(
                                              'Forgot Password?',
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                              ),
                                            ), */
                                ],
                              ),
                            ),
                            SizedBox(height: 10),

                            //User passwordfield
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return TextFormField(
                                    /////////BlocState/////
                                    validator: (value) {
                                      if (state is LoginValidation) {
                                        state.isValidPassword
                                            ? null
                                            : 'Password is to short';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) => context
                                        .read<LoginBloc>()
                                        .add(LoginPasswordChanged(
                                            password: value)),
                                    /////////BlocState/////
                                    controller: Controller.passwordController,
                                    obscureText: !isPasswordVisible,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black87),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        filled: true,
                                        hintText: 'Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            isPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isPasswordVisible =
                                                  !isPasswordVisible;
                                            });
                                          },
                                        )),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return LoginButton(
                                  text: 'Sign In',
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginBloc>().add(
                                          LoginSubmitted(
                                              email: Controller
                                                  .emailController.text,
                                              password: Controller
                                                  .passwordController.text));
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            listener: (BuildContext context, LoginState state) {
              if (state is SubmissionSuccess) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Navigation()));
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
