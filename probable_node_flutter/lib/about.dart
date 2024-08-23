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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                       "lib/assets/me.png",
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.95,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        );
  }
}