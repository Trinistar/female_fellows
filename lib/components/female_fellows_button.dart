import 'package:flutter/material.dart';

class FFButton extends StatelessWidget {
  const FFButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
  });

  final Function()? onTap;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}
