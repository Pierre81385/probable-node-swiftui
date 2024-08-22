import 'dart:async';

import 'package:flutter/material.dart';

class GalleryView extends StatefulWidget {
  final double width;
  final double height;

  const GalleryView({required this.width, required this.height});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  late double screenWidth;
  late double screenHeight;
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _imagePaths = [
    "lib/assets/fulldemo.gif",
    "lib/assets/basic_demo4.gif",
    "lib/assets/api_response.gif", // Add more images here
    "lib/assets/train1.gif",
    "lib/assets/nightclub.gif",
  ];

  @override
  void initState() {
    screenWidth = widget.width;
    screenHeight = widget.height;

    _pageController = PageController(
      viewportFraction: 1 / 3, // Display 3 images at a time
      initialPage: _currentPage,
    );

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.8, // Adjust height as needed
      width: screenWidth,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _imagePaths.length, // Use the length of the imagePaths array
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(_imagePaths[index]), // Use image from the array
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}