
import 'package:flutter/material.dart';

class FavoritIcon extends StatefulWidget {
  const FavoritIcon({super.key});

  @override
  State<FavoritIcon> createState() => _FavoritIconState();
  
}

class _FavoritIconState extends State<FavoritIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:null,
      icon: Icon(Icons.favorite_border),
      iconSize: 35,
    );
  }
}
