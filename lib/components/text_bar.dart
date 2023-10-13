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
              color:  Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor:  Theme.of(context).colorScheme.surface,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
