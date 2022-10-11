import 'package:flutter/material.dart';

class HintBox extends StatelessWidget {
  HintBox({super.key, required this.onpressed});
  Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: onpressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 175,
          color: Colors.teal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 25, left: 15, right: 15, bottom: 23),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.jpg'),
                      radius: 30,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 5.0),
                          child: Text(
                            "Data@data",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "title",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          style: TextStyle(fontSize: 18),
                          'this is a sample article from me for test my app',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_add_outlined,
                            color: Colors.white, size: 18),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.repeat,
                                color: Colors.white, size: 18),
                            label: const Text(
                              "26",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_rounded,
                                color: Colors.white, size: 18),
                            label: const Text(
                              "19",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 3.0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       InkWell(
                    //         onTap: () {},
                    //         child: const Text(
                    //           'read more',
                    //           style: TextStyle(fontSize: 13, color: Colors.white),
                    //         ),
                    //       ),
                    //       IconButton(
                    //         highlightColor: Colors.transparent,
                    //         splashColor: Colors.transparent,
                    //         onPressed: () {},
                    //         icon: const Icon(
                    //             Icons.keyboard_double_arrow_right_outlined,
                    //             color: Colors.white,
                    //             size: 20),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Divider(
                color: Colors.black,
                height: 5,
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
