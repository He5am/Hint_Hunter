import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});
  static String id = "Add_Note";
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 25),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade600),
                          onPressed: () {
                            Navigator.pushNamed(context, "home_screen");
                          },
                          child: const Text('Publish'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ),
                      Text(
                        'He5am',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 25),
                    child: TextField(
                      cursorColor: Colors.black38,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 54, 68, 66),
                            fontSize: 20),
                      ),
                      style: TextStyle(
                          height: 1.1,
                          color: Color.fromARGB(255, 54, 68, 66),
                          fontWeight: FontWeight.bold,
                          fontFamily: "SourceSansPro-Regular.ttf",
                          fontSize: 20),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: TextField(
                          cursorColor: Colors.black38,
                          decoration: InputDecoration(
                            hintText: "write your hints",
                            hintStyle: TextStyle(fontSize: 20),
                            border: InputBorder.none,
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                              color: Color.fromARGB(255, 24, 54, 49),
                              fontFamily: "SourceSansPro-Regular.ttf",
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              height: 1.2),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
