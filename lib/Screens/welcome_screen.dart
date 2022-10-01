// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hinthunter/Components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hinthunter/Screens/login_screen.dart';
import 'package:hinthunter/Screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);

    controller!.forward();

    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Hint Hunter',
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff344B47),
                        ),
                        speed: Duration(milliseconds: 45))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 150.0,
            ),
            Button(
                colour: Color(0xff96B1AC),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                title: "Log In"),
            Button(
                colour: Color(0xff96B1AC),
                title: "Register",
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
