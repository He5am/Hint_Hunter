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
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal.shade700,
          title: const Text(
            'Marked',
            style: TextStyle(fontFamily: "pacifico"),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text("Your marked page is  empty"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
