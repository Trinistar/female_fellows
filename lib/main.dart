import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_start.dart';
import 'package:vs_femalefellows/services/authrepository.dart';
import 'package:vs_femalefellows/pages/Authentication/Login/login.dart';
import 'services/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (context)=>AuthRepository(),
        child: LoginPage(),)
      
      ],
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('de'), // Deutsch
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor:Color.fromRGBO(27, 25, 86, 27),
            primary: Color.fromRGBO(27, 25, 86, 27),
            secondary: Color.fromRGBO(252, 208, 220, 1),
            surface: Color.fromRGBO(242, 242, 242, 1),
            surfaceVariant:Color.fromRGBO(236, 240, 243, 1),
            tertiary: Color.fromRGBO(106, 104, 206, 1),
           
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(
              color: Color.fromRGBO(59, 57, 102, 1),
            ),
          ),
          useMaterial3: true,
          fontFamily: 'Circular',
        ),
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
      ),
    );
  }
}
