import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login.dart';
import 'package:vs_femalefellows/pages/Homepage/navigation_page.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class AuthVerfication extends StatefulWidget {
  const AuthVerfication({super.key});

  @override
  State<AuthVerfication> createState() => _AuthVerficationState();
}

class _AuthVerficationState extends State<AuthVerfication> {
  //text editing controller

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
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navigation()));
          }
          if (state is SignUpFailure) {
            SnackBar(
              content: Text('Failure'),
            );
          }
        },
        builder: (context, state) {
          if (state is FormSignup) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                          AppLocalizations.of(context)!.verificationTitle,
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
                         AppLocalizations.of(context)!.email ,
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
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          return TextBar(
                            controller: Controller.emailController,
                            hintText: 'frau@example.com',
                            validator: null,
                            obscureText: false,
                            /////////BlocState/////
                            onChange: (value) => context.read<AuthenticationBloc>().add(InputChanged(email: value)),
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
                           AppLocalizations.of(context)!.password ,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      //User passwordfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          builder: (context, state) {
                            return TextFormField(
                              /////////BlocState/////
                              validator: null,
                              onChanged: (value) => context.read<AuthenticationBloc>().add(InputChanged(password: value)),
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
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          return LoginButton(
                   text:  AppLocalizations.of(context)!.authenticationTitle,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthenticationBloc>().add(Signup(
                                      password: Controller.passwordController.text,
                                      lastname: Controller.lastnameController.text,
                                      profilPicture: Controller.profilpictureController.text,
                                      birthday: Controller.birthdayController.text,
                                      streetname: Controller.streetnameController.text,
                                      postcode: Controller.postcodeController.text,
                                      place: Controller.placeController.text,
                                      notification: false,
                                      phonenumber: Controller.phonenumberController.text,
                                      callOrText: false,
                                      meeting: false,
                                      safety: false,
                                      email: Controller.emailController.text,
                                      firstname: Controller.firstnameController.text,
                                    ));
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
                                  AppLocalizations.of(context)!.loginTextup,
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary),
                                )),
                            Center(
                                child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage())),
                              child: Text(
                                AppLocalizations.of(context)!.loginTextdown,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    decoration: TextDecoration.underline),
                              ),
                            )),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
