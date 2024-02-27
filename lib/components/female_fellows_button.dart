import 'package:flutter/material.dart';

class FFButton extends StatelessWidget {
  const FFButton({
    super.key,
    required this.onTap,
    required this.text,
   this.color,
   this.style,
   this. border,
  });

  final Function()? onTap;
  final String text;
  final Color? color;
  final TextStyle ? style;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color ?? Theme.of(context).colorScheme.primary,
        border:border, 
        ),
        child: Center(
            child: Text(
          text,
          style:style ?? TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}
