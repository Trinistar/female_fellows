import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vs_femalefellows/components/login_button.dart';
import 'package:vs_femalefellows/components/login_textfield.dart';
import 'package:vs_femalefellows/components/square_tile.dart';
import 'package:vs_femalefellows/services/auth_service.dart';

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
      appBar: AppBar( 
        backgroundColor: Color.fromRGBO(252, 208, 220, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Hier wird die Zurück-Navigation durchgeführt
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color.fromRGBO(252, 208, 220, 1),
      body: SafeArea(
        
        
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),

                // Icon Avatar
                Icon(
                  Icons.favorite,
                  size: 70,
                ),

                SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome back ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
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
                LoginField(
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
                LoginField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Row(
                    children: [
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
                  height: 50,
                ),
                LoginButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),
                SizedBox(height: 30),
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

                const SizedBox(height: 30),

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
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),

                    // register button
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
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
