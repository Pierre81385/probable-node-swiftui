import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  final double width;
  final double height;
     final String title;
  final Color color;

  const AboutView({required this.width, required this.height, required this.title, required this.color});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  late double screenWidth;
  late double screenHeight;
  late String title;
  late Color color;

   @override
  void initState() {
    screenWidth = widget.width;
    screenHeight = widget.height;
        title = widget.title;
    color = widget.color;
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {

    return Container(
          height: screenHeight,
          width: screenWidth,
          color: color,
          child: Center(
            child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                       Image.asset(
                       "lib/assets/IMG_1256.png",
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.8,
                        fit: BoxFit.fitHeight,
                      ),
                                            const SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                  Text(
                              title,
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                              ),
                            ),
                            Wrap(
                              spacing: 8.0, // Optional: Adds space between the wrapped items
                              runSpacing: 4.0, // Optional: Adds space between the lines of wrapped items
                              children: [
                                Text(
                                  "A full stack developer with experience building web and mobile applications with React, Flutter, and SwiftUI.",
                                ),
                                Text(
                                  "Utilizing MongoDB, OAuth, Rekognition, S3, DynamoDB, Gemini, Firebase, GraphQL, Node, Express, Socket.io, GTFS-RT data, Google Maps API, and native Apple kits to name a few.",
                                ),
                                Text(
                                  "I enjoy the challenge of learning to combine and structure new APIs, resources, and tools to create well organized, functional and creative applications.",
                                ),
                              ],
                            ),
                          ],

                        )
                      ),
                     
                    ],
                  ),
                ),
          ),
        );
  }
}