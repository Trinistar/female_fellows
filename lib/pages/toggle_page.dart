import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/authentication_pages/login_page.dart';
import 'package:vs_femalefellows/pages/register_page.dart';

class TogglePage extends StatefulWidget {
  const TogglePage({super.key});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  //show LoginPage
  bool shoLoginPage = true;
  //toggle between Pages
  void togglePages() {
    setState(() {
      shoLoginPage = !shoLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shoLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
