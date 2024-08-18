import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/SplashScreen.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/Screens/welcome.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(),
      routes: {
        '/Splashscreen': (context) => const Splashscreen(),
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
