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
          bodyLarge: TextStyle(
            color:Color.fromRGBO(59, 57, 102, 1),
          ),
        ),
        useMaterial3: true,
        fontFamily: 'Circular',
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
