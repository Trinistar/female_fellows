import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/Registration/registration_bloc.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthVerfication extends StatefulWidget {
  const AuthVerfication({super.key});

  @override
  State<AuthVerfication> createState() => _AuthVerficationState();
}

class _AuthVerficationState extends State<AuthVerfication> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
        create: (context) => RegistrationBloc(),
        child: BlocConsumer<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state is SignUpFailure) {
              SnackBar;
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
                              AppLocalizations.of(context)!.verficationTitle,
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
                          BlocBuilder<RegistrationBloc, RegistrationState>(
                            builder: (context, state) {
                              return TextBar(
                                controller: emailController,
                                hintText: 'frau@example.com',
                                validator: null,
                                obscureText: false,
                                /////////BlocState/////
                                onChange: (value) => context
                                    .read<RegistrationBloc>()
                                    .add(InputChanged(email: value)),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: BlocBuilder<RegistrationBloc, RegistrationState>(
                              builder: (context, state) {
                                return TextFormField(
                                  /////////BlocState/////
                                  validator: null ,
                                  onChanged: (value) => context
                                      .read<RegistrationBloc>()
                                      .add(InputChanged(
                                          password: value)),
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
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
                          BlocBuilder<RegistrationBloc, RegistrationState>(
                            builder: (context, state) {
                              return LoginButton(
                                text: 'Mitglied werden',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<RegistrationBloc>().add(Signup(
                                      password: passwordController.text,
                                      lastname:'' ,
                                          profilpicture: '',
                                          birthday: '',
                                          streetname: '',
                                          postcode: '',
                                          place: '',
                                          notification: false,
                                          phonenumber: '',
                                          callortext: false,
                                          meeting: false,
                                          safty: false,
                                          email: emailController.text,
                                          firstname: '',
                                        ));
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
        ),
      ),
    );
  }
}
