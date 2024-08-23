import 'package:flutter/material.dart';

class ExperienceView extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final Color color;

  const ExperienceView({required this.width, required this.height, required this.title, required this.color});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
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
            child: Text(
              title,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        );
  }
}