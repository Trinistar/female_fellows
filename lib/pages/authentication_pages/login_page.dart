import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vs_femalefellows/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  //sign User IN
  void signUserIn() async {
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
        .push(MaterialPageRoute(builder: (context) => Homepage()));
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
  }

  // bool for Passwordicon
  bool isPasswordVisible = false;

  //bool for Remember me Checkbox
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body: Column(
        children: [
          Container(
            height: 150,
            width: 1000,
            color: Color.fromRGBO(242, 242, 242, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      AppLocalizations.of(context)!.loginPageTitle,
                      style: TextStyle(
                        color: Color.fromRGBO(27, 25, 86, 1),
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
                        color: Color.fromRGBO(27, 25, 86, 1),
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
                  TextBar(
                    controller: emailController,
                    hintText: 'frau@example.com',
                    obscureText: false,
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
                        ),
                        SizedBox(
                          width: 120,
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          // borderRadius: BorderRadius.only(topLeft:Radius.circular(20),),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(27, 25, 86, 1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () => (),
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  LoginButton(
                    text: 'Sign In',
                    onTap: signUserIn,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
