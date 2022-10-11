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
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal.shade700,
          title: const Text(
            'Liked',
            style: TextStyle(fontFamily: "pacifico"),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Center(
                  child: Text("Your Liked page is  empty"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
