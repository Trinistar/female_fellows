import 'package:flutter/material.dart';


class TextBar extends StatelessWidget {
  const TextBar({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.onChange,
    required this.validator,
  });

  final controller;
  final String hintText;
  final bool obscureText;
  final onChange;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator:validator,
      onChanged: onChange,
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
    );
  }
}
