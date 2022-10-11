// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hinthunter/Screens/add_note.dart';
import 'package:hinthunter/Screens/user_screen/hint_page.dart';
import 'package:hinthunter/Screens/user_screen/home.dart';
import 'package:hinthunter/Components/main_wrapper.dart';
import 'package:hinthunter/Screens/user_screen/liked.dart';
import 'package:hinthunter/Screens/user_screen/profile.dart';
import 'package:hinthunter/Screens/user_screen/user_setting.dart';
import 'Screens/login_screen.dart';
import 'Screens/registration_screen.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/user_screen/marked.dart';

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
        primarySwatch: Colors.teal,
        // canvasColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        shadowColor: Colors.transparent,
        primaryColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MainWrapper.id,
      routes: {
        MainWrapper.id: (context) => MainWrapper(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        Liked.id: (context) => Liked(),
        Marked.id: (context) => Marked(),
        AddNote.id: (context) => AddNote(),
        Hintpage.id: (context) => Hintpage(),
        UserSetting.id: (context) => UserSetting(),
        Profile.id: (context) => Profile(),
      },
    );
  }
}
