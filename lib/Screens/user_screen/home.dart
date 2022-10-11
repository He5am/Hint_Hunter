// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hinthunter/Components/hint_box.dart';
import 'package:hinthunter/Screens/user_screen/hint_page.dart';
// import 'package:hinthunter/Screens/add_note.dart';
// import 'package:hinthunter/Screens/user_screen/notes.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> items = ['En', 'فارسی'];
  // String? selectedItem = "En";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal.shade700,
          title: const Text(
            'Hint Hunter',
            style: TextStyle(fontFamily: "pacifico"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HintBox(
                onpressed: () async {
                  Navigator.pushNamed(context, Hintpage.id);
                },
              ),
              HintBox(
                onpressed: () async {
                  Navigator.pushNamed(context, Hintpage.id);
                },
              ),
              HintBox(
                onpressed: () async {
                  Navigator.pushNamed(context, Hintpage.id);
                },
              ),
              HintBox(
                onpressed: () async {
                  Navigator.pushNamed(context, Hintpage.id);
                },
              ),
              HintBox(
                onpressed: () async {
                  Navigator.pushNamed(context, Hintpage.id);
                },
              ),
              HintBox(
                onpressed: () async {
                  Navigator.pushNamed(context, Hintpage.id);
                },
              ),
              HintBox(
                onpressed: () async {
                  Navigator.pushNamed(context, Hintpage.id);
                },
              ),
              HintBox(
                onpressed: () async {
                  Navigator.pushNamed(context, Hintpage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
