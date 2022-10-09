import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hinthunter/Screens/user_screen/home.dart';
import 'package:hinthunter/Screens/welcome_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.teal.shade600,
        backgroundColor: Colors.teal.shade700,
        automaticallyImplyLeading: false,
        title: const Text(
          'He5am',
          style: TextStyle(fontFamily: "pacifico"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.teal,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.jpg'),
                          radius: 40,
                          backgroundColor: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.0, left: 5),
                          child: Text(
                            "This is a bio",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Source SansPro Regular"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 60,
                                height: 45,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      '15',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      'Hint',
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 60,
                                height: 45,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      '200',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      'Liked',
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 60,
                                height: 45,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      '35',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      'Marked',
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 8),
                          child: SizedBox(
                            height: 30,
                            width: 215,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white70,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 135.0,
                    ),
                    child: IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade700,
                  ),
                  accountEmail: const Text(
                    "Hesam@email.com",
                    style: TextStyle(fontSize: 16),
                  ),
                  accountName: const Text(
                    "He5am",
                    style: TextStyle(fontSize: 18),
                  ),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
*/

// Padding(
//   padding: const EdgeInsets.only(bottom: 12, left: 4),
//   child: ListTile(
//     leading: const Icon(
//       Icons.logout,
//       color: Color(0xffffffff),
//       size: 30,
//     ),
//     onTap: () {
//       Navigator.pushNamed(context, WelcomeScreen.id);
//     },
//     title: const Text(
//       'Logout',
//       style: TextStyle(color: Colors.white, fontSize: 16),
//     ),
//   ),
// ),
