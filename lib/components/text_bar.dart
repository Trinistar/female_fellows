import 'package:flutter/material.dart';

class TextBar extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const TextBar({
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
          hintText: hintText,
        ),
      ),
    );
  }
}
