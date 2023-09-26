import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const LoginField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.grey.shade50,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[700])),
      ),
    );
  }
}
