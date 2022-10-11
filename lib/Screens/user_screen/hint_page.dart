import 'package:flutter/material.dart';

class Hintpage extends StatelessWidget {
  const Hintpage({super.key});
  static String id = 'hint_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Title"),
      ),
    );
  }
}
