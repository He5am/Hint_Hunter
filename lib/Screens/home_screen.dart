// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hinthunter/Screens/add_note.dart';
import 'package:hinthunter/Screens/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = ['En', 'فارسی'];
  String? selectedItem = "En";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade600,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddNote(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        centerTitle: true,
        title: const Text('Hint Hunter'),
      ),
      drawer: Drawer(
          backgroundColor: Colors.teal,
          child: SafeArea(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade700,
                  ),
                  accountEmail: Text(
                    "Hesam@email.com",
                    style: TextStyle(fontSize: 16),
                  ),
                  accountName: Text(
                    "He5am",
                    style: TextStyle(fontSize: 18),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 12),
                  child: ListTile(
                    leading: Icon(
                      Icons.note_alt,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    onTap: () {},
                    title: Text(
                      'My Notes',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Icon(
                      Icons.favorite,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    onTap: () {},
                    title: Text(
                      'Liked',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Icon(
                      Icons.bookmark,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    onTap: () {},
                    title: Text(
                      'Marked',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Language',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: DropdownButton<String>(
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    dropdownColor: Colors.teal,
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    value: selectedItem,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    items: items
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (item) => setState(() {
                      setState(() {
                        selectedItem = item!;
                      });
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    },
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
