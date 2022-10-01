// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hinthunter/Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/registration_screen.dart';
import 'Screens/welcome_screen.dart';

void main() {
  runApp(const HintHunter());
}

class HintHunter extends StatelessWidget {
  const HintHunter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen()
      },
    );
  }
}
