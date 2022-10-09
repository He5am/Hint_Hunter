import 'package:flutter/material.dart';


class Marked extends StatefulWidget {
  const Marked({super.key});
  static String id = 'Marked';
  @override
  State<Marked> createState() => _MarkedState();
}

class _MarkedState extends State<Marked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Marked'),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal,
    );
  }
}
