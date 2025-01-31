import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:femalefellows/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:femalefellows/blocs/OnboardingBloc/onboarding_bloc.dart';
import 'package:femalefellows/components/female_fellows_button.dart';
import 'package:femalefellows/components/text_bar.dart';
import 'package:femalefellows/models/address.dart';
import 'package:femalefellows/models/enums.dart';
import 'package:femalefellows/models/notifications.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/provider/controller.dart';

class AuthVerfication extends StatefulWidget {
  const AuthVerfication({
    super.key,
    required this.userchoice,
    required this.mediachoice,
    required this.wantsNewsletter,
    required this.birthday,
    this.isFromOnboarding = false, required this.picture,
  });

  final LocalOrNewcomer userchoice;
  final Socialmedia mediachoice;
  final bool wantsNewsletter;
  final Timestamp birthday;
  final bool isFromOnboarding;
  final XFile picture;

  @override
  State<AuthVerfication> createState() => _AuthVerficationState();
}

class _AuthVerficationState extends State<AuthVerfication> {
  //text editing controller

  // bool for Passwordicon
  bool _isPasswordVisible = false;

  //bool for Remember me Checkbox
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticatedUser) {
            if (widget.isFromOnboarding) {
              BlocProvider.of<OnboardingBloc>(context).add(OnboardingDoneEvent());
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TabBarNavigation();
                  },
                ),
              ); */
            } else {
              Navigator.of(context).maybePop();
            }
          }
          if (state is UnauthenticatedUser) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('Da ist etwas schief gelaufen'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FormSignup) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Text(
                    S.of(context)!.verificationTitle,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Gib ein Passwort ein und klicke bitte anschließend auf den Link, den wir dir per E-Mail an diese Adresse senden. Durch Klicken des Links verifizierst du deine E-Mail-Adresse und kannst dich anschließend einloggen.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    S.of(context)!.email,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return TextBar(
                        controller: Controller.emailController,
                        hintText: 'frau@example.com',
                        validator: null,
                        obscureText: false,
                        onChange: (e) {},
                      );
                    },
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        S.of(context)!.password,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return TextFormField(
                        validator: null,
                        onChanged: (_) => '',
                        controller: Controller.passwordController,
                        obscureText: !_isPasswordVisible,
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
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            )),
                      );
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return FFButton(
                        text: S.of(context)!.authenticationTitle,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final FFUser profile = FFUser(
                              email: Controller.emailController.text,
                              lastname: Controller.lastnameController.text,
                              profilPicture: Controller.profilpictureController.text,
                              birthday: widget.birthday,
                              newsletter: widget.wantsNewsletter,
                              firstname: Controller.firstnameController.text,
                              address: Address(
                                street: Controller.streetnameController.text,
                                zipCode: Controller.zipCodeController.text,
                                city: Controller.placeController.text,
                              ),
                              notification: Notifications(
                                contactViaEmail: false,
                                contactViaWhatsApp: false,
                                contactViaPhone: false,
                                phonenumber: Controller.phonenumberController.text,
                              ),
                              localOrNewcomer: widget.userchoice,
                              socialMedia: widget.mediachoice,
                            );
                            context.read<AuthenticationBloc>().add(
                                  RegisterWithMailEvent(
                                    widget.picture,
                                    email: Controller.emailController.text,
                                    password: Controller.passwordController.text,
                                    profile: profile,
                                  ),
                                );
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  /* Center(
                            child: Text(
                          S.of(context)!.loginTextup,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        )),
                        Center(
                            child: GestureDetector(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage())),
                          child: Text(
                            S.of(context)!.loginTextdown,
                            style: TextStyle(color: Theme.of(context).colorScheme.primary, decoration: TextDecoration.underline),
                          ),
                        )), */
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
