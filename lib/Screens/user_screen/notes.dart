import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});
  static String id = 'Notes';

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('My Hints'),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal,
    );
  }
}
