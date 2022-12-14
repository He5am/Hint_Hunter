// ignore_for_file: sort_child_properties_last, must_be_immutable, depend_on_referenced_packages, unnecessary_null_comparison, use_build_context_synchronously, avoid_print, constant_identifier_names

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:hinthunter/Components/main_wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

//This method is used to create the user in firestore
  Future<void> createUser(
    String uid,
    String name,
    String email,
    String username,
  ) async {
    //Creates the user doc named whatever the user uid is in te collection "users"
    //and adds the user data
    await db.collection("users").doc(uid).set({
      'Name': name,
      'Email': email,
      "Username": username,
    });
  }

  //This function registers a new user with auth and then calls the function createUser
  Future<void> registerUser(
      String email, String password, String username, String name) async {
    //Create the user with auth
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    //Create the user in firestore with the user data
    createUser(result.user!.uid, name, username, email);
  }

  String? email;
  String? username;
  String? name;
  String? confirmPassword;
  String? password;
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed : $e');
    }
  }

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome To  \n Hunter's Camp",
                      style: TextStyle(
                          color: Color(0xff344B47),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 30.0,
                          ),
                          imageProfile(),

                          const SizedBox(
                            height: 30,
                          ),
                          FormField(
                            hintText: "Name",
                            changed: (value) {
                              name = value;
                            },
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          FormField(
                            hintText: "Email",
                            changed: (value) {
                              email = value;
                            },
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          FormField(
                            hintText: "Username",
                            changed: (value) {
                              username = value;
                            },
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          FormField(
                            hintText: "Enter Password",
                            changed: (value) {
                              password = value;
                            },
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          FormField(
                            hintText: "Confirm Your Password",
                            changed: (value) {
                              confirmPassword = value;
                            },
                          ),

                          // TextFormField(

                          //   textAlign: TextAlign.center,
                          //   obscureText: true,
                          //   onChanged: (value) {
                          //     password = value;
                          //   },
                          //   decoration: KTextFiekdDecuration.copyWith(
                          //       hintText: "Confirm Your Password"),
                          // ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade800),
                            onPressed: () async {
                              try {
                                final progress = ProgressHUD.of(context);
                                setState(() {
                                  progress?.show();
                                });
                                final user =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email!, password: password!);
                                if (user != null) {
                                  Navigator.pushNamed(context, MainWrapper.id);
                                }
                                setState(() {
                                  progress?.dismiss();
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile as PickedFile?;
    });
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            // backgroundImage: AssetImage('assets/profile.jpg'),
            backgroundImage: _imageFile == null
                ? const AssetImage('assets/profile.jpg') as ImageProvider
                : FileImage(
                    File(_imageFile!.path),
                  ),
          ),
          Positioned(
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return bottomsheet();
                  },
                );
              },
              child: const Icon(
                size: 28,
                color: Colors.teal,
                Icons.camera_alt,
              ),
            ),
            bottom: 10,
            right: 15,
          )
        ],
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      color: Colors.transparent,
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          // ignore: prefer_const_constructors
          Text(
            "Choose profile photo",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FormField extends StatelessWidget {
  String? hintText;

  final Function(String) changed;

  FormField({super.key, required this.hintText, required this.changed});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: changed,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        hintStyle: const TextStyle(color: Colors.white60),
        fillColor: Colors.teal.shade800,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
