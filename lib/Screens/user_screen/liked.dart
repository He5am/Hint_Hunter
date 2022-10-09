import 'package:flutter/material.dart';

class Liked extends StatefulWidget {
  const Liked({super.key});
  static String id = 'Liked';
  @override
  State<Liked> createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Liked'),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal,
    );
  }
}
