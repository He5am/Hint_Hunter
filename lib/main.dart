// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hinthunter/Screens/add_note.dart';
import 'package:hinthunter/Screens/home_screen.dart';
import 'package:hinthunter/Screens/user_screen/liked.dart';
import 'Screens/login_screen.dart';
import 'Screens/registration_screen.dart';
import 'Screens/welcome_screen.dart';

import 'Screens/user_screen/marked.dart';
import 'Screens/user_screen/notes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HintHunter());
}

class HintHunter extends StatelessWidget {
  const HintHunter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primarySwatch: Colors.teal,
          // canvasColor: Colors.transparent,
          ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        Liked.id: (context) => Liked(),
        Notes.id: (context) => Notes(),
        Marked.id: (context) => Marked(),
        AddNote.id: (context) => AddNote()
      },
    );
  }
}
