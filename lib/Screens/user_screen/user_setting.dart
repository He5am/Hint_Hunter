import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hinthunter/Screens/user_screen/profile.dart';
import 'package:hinthunter/Screens/welcome_screen.dart';
import 'package:image_picker/image_picker.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});
  static String id = 'user_setting';

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
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

  File? image;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  String? email;
  String? username;
  String? name;
  String? confirmPassword;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal.shade600,
        centerTitle: true,
        title: const Text("Manage Account"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade700,
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            'welcome_screen', (Route<dynamic> route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Logout'),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.logout_outlined)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            imageProfile(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 48.0,
                        ),
                        FormField(
                          hintText: "\$Name",
                          changed: (value) {
                            name = value;
                          },
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        FormField(
                          hintText: "\$Email",
                          changed: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        FormField(
                          hintText: "\$Username",
                          changed: (value) {
                            username = value;
                          },
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        FormField(
                          hintText: "current Password",
                          changed: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        FormField(
                          hintText: "new Password",
                          changed: (value) {
                            password = value;
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
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //       backgroundColor: Colors.teal.shade800),
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, Profile.id);
                        //   },
                        //   child: Row(
                        //     children: [
                        //       const Text(
                        //         "Logout",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       IconButton(
                        //         onPressed: () {
                        //           FirebaseAuth.instance.signOut();
                        //           Navigator.of(context).pushNamedAndRemoveUntil(
                        //               'welcome_screen',
                        //               (Route<dynamic> route) => false);
                        //         },
                        //         icon: const Icon(
                        //           Icons.logout_rounded,
                        //           size: 25,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade700,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('save'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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

// ignore: must_be_immutable
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
