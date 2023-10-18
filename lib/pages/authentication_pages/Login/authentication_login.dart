import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/pages/auth_page.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/form_submission_status.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/login_bloc.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/login_event.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/login_state.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:vs_femalefellows/pages/navigation_page.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  /////////////////////////////////
  ////////////////////////
  ///////////////
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop Loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop Loading circle
      Navigator.pop(context);

      //show error message
      showErroMessage(e.code);
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Navigation()));
  }

  // Error Messages
  void showErroMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.pink.shade100,
          title: Center(
              child: Text(
            message,
            style: const TextStyle(
              color: Colors.black87,
            ),
          )),
        );
      },
    );
  } ///////////////////////
  ///////////////////////////////
  /////////////////////////////////////////////////////

  // bool for Passwordicon
  bool isPasswordVisible = false;

  //bool for Remember me Checkbox
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocProvider(
        create: (context) => LoginBloc(
          authpage: context.read<Authpage>(),
        ),
        child: Column(
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
                        padding: const EdgeInsets.symmetric(horizontal: 42),
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
                            controller: emailController,
                            hintText: 'frau@example.com',
                            validator: (value) =>
                                state.isValidEmail ? null : 'email is to short',
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
                        padding: const EdgeInsets.symmetric(horizontal: 42),
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
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return TextFormField(
                              /////////BlocState/////
                              validator: (value) => state.isValidPassword
                                  ? null
                                  : 'Password is to short',
                              onChanged: (value) => context
                                  .read<LoginBloc>()
                                  .add(LoginPasswordChanged(password: value)),
                              /////////BlocState/////
                              controller: passwordController,
                              obscureText: !isPasswordVisible,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black87),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fillColor:
                                      Theme.of(context).colorScheme.surface,
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
                          return state.formStatus is FormSubmitting
                              ? CircularProgressIndicator()
                              : LoginButton(
                                  text: 'Sign In',
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<LoginBloc>()
                                          .add(LoginSubmitted());
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
        ),
      ),
    );
  }
}
