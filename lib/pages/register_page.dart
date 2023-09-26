import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/components/text_bar.dart';
import 'package:vs_femalefellows/components/square_tile.dart';
import 'package:vs_femalefellows/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  //sign User Up loading circle
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // try creating User
    try {
      if (passwordController.text == confirmController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        Navigator.pop(context);
        // password dont match
        showErroMessage("Passwords don't match!");
      }

      // pop Loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop Loading circle
      Navigator.pop(context);

      //show error message
      showErroMessage(e.code);
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 208, 220, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),

                // Icon Avatar
                Icon(
                  Icons.favorite,
                  size: 100,
                ),

                SizedBox(
                  height: 25,
                ),
                Text(
                  'Be a Member',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 25),
                //username Textfield
                TextBar(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 25),
                TextBar(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                //confirm Password
                SizedBox(
                  height: 25,
                ),
                TextBar(
                  controller: confirmController,
                  hintText: ' Confirm Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 25,
                ),
                LoginButton(
                  text: 'Create Account',
                  onTap: signUserUp,
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google
                    SquareTile(
                        onTap: () => Authservice().signInWithGoogle(),
                        imagePath: 'lib/images/google.png'),
                    SizedBox(width: 10),
                    //apple
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a Member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),

                    // regeister button
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
