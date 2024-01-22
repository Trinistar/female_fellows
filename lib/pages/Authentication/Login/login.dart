import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/LoginBloc/login_bloc.dart';
import 'package:vs_femalefellows/blocs/LoginBloc/login_event.dart';
import 'package:vs_femalefellows/blocs/LoginBloc/login_state.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/pages/Authentication/authentication_entry.dart';
import 'package:vs_femalefellows/pages/Homepage/navigation_page.dart';
import 'package:vs_femalefellows/provider/controller.dart';

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
          if (state is AuthenticatedUser) {
            Navigator.of(context).pop();
          }
        },
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is FormSubmitting) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView(
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
                          child: Image.asset('lib/images/FF-Logo_blau-1.png', height: 80, alignment: Alignment(0, -0.8)),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
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
                            padding: const EdgeInsets.symmetric(horizontal: 42),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.email,
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
                                    state.isValidEmail ? null : 'Email is to short';
                                    print(state.isValidEmail);
                                  }
                                },
    
                                obscureText: false,
                                /////////BlocState/////
                                onChange: (value) => context.read<LoginBloc>().add(LoginEmailChanged(email: value)),
                                /////////BlocState/////
                              );
                            },
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 42),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.password,
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
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return TextFormField(
                                  /////////BlocState/////
                                  validator: (value) {
                                    if (state is LoginValidation) {
                                      state.isValidPassword ? null : 'Password is to short';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(password: value)),
                                  /////////BlocState/////
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
                                          setState(() {
                                            isPasswordVisible = !isPasswordVisible;
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
                              return FFButton(
                                text: AppLocalizations.of(context)!.signin,
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
                            AppLocalizations.of(context)!.signinTextup,
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          )),
                          Center(
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationEntry())),
                              child: Text(
                                AppLocalizations.of(context)!.signinTextdown,
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
              );
            },
            listener: (BuildContext context, LoginState state) {
              /* if (state is SubmissionSuccess) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarNavigation()));
              } */
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
