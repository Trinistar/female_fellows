import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/components/female_fellows_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/provider/controller.dart';

class AuthVerfication extends StatefulWidget {
  const AuthVerfication({super.key, required this.userchoice, required this.mediachoice, required this.wantsNewsletter});

  final LocalOrNewcomer userchoice;
  final Socialmedia mediachoice;
  final bool wantsNewsletter;

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
            Navigator.of(context).pop();
            /* Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Navigation())); */
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
                            onChanged: (value) => context.read<AuthenticationBloc>().add(InputChanged(password: value)),
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
                              context.read<AuthenticationBloc>().add(
                                    Signup(
                                      //User//
                                      password: Controller.passwordController.text,
                                      email: Controller.emailController.text,
                                      //FFUser//
                                      lastname: Controller.lastnameController.text,
                                      profilPicture: Controller.profilpictureController.text,
                                      birthday: Controller.birthdayController.text,
                                      newsletter: widget.wantsNewsletter,
                                      firstname: Controller.firstnameController.text,
                                      //Adress//
                                      streetname: Controller.streetnameController.text,
                                      zipCode: Controller.zipCodeController.text,
                                      place: Controller.placeController.text,
                                      //Notifications//
                                      contactemail: false,
                                      whatsapp: false,
                                      call: false,
                                      phonenumber: Controller.phonenumberController.text,
                                      //Enum LocalOrNot
                                      localOrNewcomer: widget.userchoice,
                                      //Enum Socialmedia
                                      socialmedia: widget.mediachoice,
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
