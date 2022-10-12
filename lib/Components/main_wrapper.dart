import 'package:flutter/material.dart';
import 'package:hinthunter/Screens/add_note.dart';
import 'package:hinthunter/Screens/user_screen/home.dart';
import 'package:hinthunter/Screens/user_screen/liked.dart';
import 'package:hinthunter/Screens/user_screen/marked.dart';
import 'package:hinthunter/Screens/user_screen/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});
  static String id = 'main_wrapper';
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController mypage = PageController(initialPage: 0);
  PageController? controller;
  int currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const Marked(),
    const Liked(),
    const Profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade600,
        onPressed: () => Navigator.pushNamed(context, AddNote.id),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 18, 62, 103),
        child: BottomAppBar(
          color: Colors.teal.shade600,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: SizedBox(
            height: 63,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(1),
                        splashColor: Colors.teal,
                        onPressed: () {
                          setState(
                            () {
                              currentScreen = const HomeScreen();
                              currentTab = 0;
                            },
                          );
                        },
                        child: Icon(
                          Icons.home_rounded,
                          size: 30,
                          color: currentTab == 0
                              ? const Color.fromARGB(255, 18, 62, 103)
                              : Colors.white,
                        ),
                      ),
                      MaterialButton(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(1),
                        onPressed: () {
                          setState(
                            () {
                              currentScreen = const Marked();
                              currentTab = 1;
                            },
                          );
                        },
                        child: Icon(
                          Icons.bookmark_added_rounded,
                          color: currentTab == 1
                              ? const Color.fromARGB(255, 18, 62, 103)
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(1),

                        onPressed: () {
                          setState(
                            () {
                              currentScreen = const Liked();
                              currentTab = 2;
                            },
                          );
                        },
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.favorite_rounded,
                          color: currentTab == 2
                              ? const Color.fromARGB(255, 18, 62, 103)
                              : Colors.white,
                        ),
                      ),
                      MaterialButton(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(1),
                        onPressed: () {
                          setState(
                            () {
                              currentScreen = const Profile();
                              currentTab = 3;
                            },
                          );
                        },
                        child: Icon(
                          Icons.person,
                          color: currentTab == 3
                              ? const Color.fromARGB(255, 18, 62, 103)
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
