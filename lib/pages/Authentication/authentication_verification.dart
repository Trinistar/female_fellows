import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/OnboardingBloc/onboarding_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/notifications.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/pages/ToolBarNavigation/navigation_page.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class AuthVerfication extends StatefulWidget {
  const AuthVerfication({
    super.key,
    required this.userchoice,
    required this.mediachoice,
    required this.wantsNewsletter,
    required this.birthday,
    this.isFromOnboarding = false,
  });

  final LocalOrNewcomer userchoice;
  final Socialmedia mediachoice;
  final bool wantsNewsletter;
  final Timestamp birthday;
  final bool isFromOnboarding;

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TabBarNavigation();
                  },
                ),
              );
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
          return ListView(
            children: [
              Form(
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
                        'Gib deine E-Mail-Adresse und ein Passwort an',
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
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        return TextBar(
                          controller: Controller.emailController,
                          hintText: 'frau@example.com',
                          validator: null,
                          obscureText: false,
                          /////////BlocState/////
                          onChange: (e) {},
                          //onChange: (value) => context.read<AuthenticationBloc>().add(InputChanged(email: value)),
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
                            onChanged: (_) => '',
                            //onChanged: (value) => context.read<AuthenticationBloc>().add(InputChanged(password: value)),
                            /////////BlocState/////
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
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        return FFButton(
                          text: AppLocalizations.of(context)!.authenticationTitle,
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
                      AppLocalizations.of(context)!.loginTextup,
                      style: TextStyle(color: Theme.of(context).colorScheme.primary),
                    )),
                    Center(
                        child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage())),
                      child: Text(
                        AppLocalizations.of(context)!.loginTextdown,
                        style: TextStyle(color: Theme.of(context).colorScheme.primary, decoration: TextDecoration.underline),
                      ),
                    )), */
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
