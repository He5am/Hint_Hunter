// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hinthunter/Screens/home_screen.dart';
import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  // PickedFile? _imageFile;
  // final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                const SizedBox(height: 25),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imageProfile(),
                      const SizedBox(height: 35),
                      FormField(
                        hintText: "Email",
                        controller: email,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      FormField(
                        hintText: "Username",
                        controller: username,
                      ),
                      const SizedBox(height: 14),
                      FormField(
                        hintText: "Password",
                        controller: password,
                      ),
                      const SizedBox(height: 14),
                      FormField(
                        hintText: "Confirm password",
                        controller: password,
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade800),
                        onPressed: () =>
                            Navigator.pushNamed(context, HomeScreen.id),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
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
    );
  }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile as PickedFile?;
  //   });
  // }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: const [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/profile.jpg'),
            // backgroundImage: _imageFile == null
            //     ? AssetImage('assets/profile.jpg')
            //     : FileImage(
            //         File(_imageFile?.path),
            //       ),
          ),
          // Positioned(
          //   child: InkWell(
          //     onTap: () {
          //       showModalBottomSheet(
          //         context: context,
          //         builder: (context) {
          //           return bottomsheet();
          //         },
          //       );
          //     },
          //     // child: const Icon(size: 28, color: Colors.teal, Icons.camera_alt),
          //   ),
          //   bottom: 20,
          //   right: 20,
          // )
        ],
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
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
                  // takePhoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // takePhoto(ImageSource.gallery);
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
  TextEditingController controller;
  FormField({super.key, required this.hintText, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
