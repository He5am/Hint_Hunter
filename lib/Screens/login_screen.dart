// ignore_for_file: must_be_immutable

// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hinthunter/Components/main_wrapper.dart';

import 'user_screen/home.dart';
// import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Color(0xff344B47),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Column(
                    children: [
                      Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FormField(
                              obscure: false,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Email",
                              changed: (value) {
                                email = value;
                              },
                            ),
                            const SizedBox(height: 14),
                            FormField(
                              keyboardType: TextInputType.text,
                              obscure: true,
                              hintText: "Password",
                              changed: (value) {
                                password = value;
                              },
                            ),
                            const SizedBox(height: 25),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal.shade800),
                              // onPressed: () {
                              //   Navigator.pushNamed(context, MainWrapper.id);
                              // },
                              onPressed: () async {
                                try {
                                  final progress = ProgressHUD.of(context);
                                  setState(() {
                                    progress?.show();
                                  });
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email!, password: password!);
                                  if (user != null) {
                                    Navigator.pushNamed(
                                        context, MainWrapper.id);
                                  }
                                  setState(() {
                                    progress?.dismiss();
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  String? hintText;
  bool? obscure;
  TextInputType? keyboardType;
  final Function(String) changed;

  FormField(
      {super.key,
      required this.hintText,
      required this.changed,
      required this.obscure,
      required this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscure!,
      onChanged: changed,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        hintStyle: const TextStyle(color: Colors.white60),
        fillColor: Colors.teal.shade800,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
