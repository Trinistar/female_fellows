import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_start.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color:Color.fromRGBO(27, 25, 86, 1),
          ),
        ),
        useMaterial3: true,
        fontFamily: 'Circular',
       scaffoldBackgroundColor:Color.fromRGBO(252, 208, 220, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
