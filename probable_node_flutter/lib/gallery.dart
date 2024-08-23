import 'package:flutter/material.dart';
import 'dart:math';

class GalleryView extends StatefulWidget {
  final double height;
  final double width;

  const GalleryView({
    required this.height,
    required this.width
  });

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  late double screenHeight;
  late double screenWidth;

  final List<Color> tileColor = [
    Colors.red.withOpacity(0.8),
    Colors.purple.withOpacity(0.8),
    Colors.green.withOpacity(0.8),
    Colors.blue.withOpacity(0.8),
    Colors.yellow.withOpacity(0.8),
    Colors.orange.withOpacity(0.8),
  ];

  final List<String> projectNames = [
    "TOTP Authentication", 
    "Weather Notifications",
    "RTD / GTFS-RT",
    "API Response",
    "0AUTH 2.0 Flow",
    "OpenWeather Revisited",
  ];
  final List<String> imagePaths = [
    "lib/assets/fulldemo.gif",
    "lib/assets/basic_demo4.gif",
    "lib/assets/rtd_ss.png",
    "lib/assets/api_response.gif",
    "lib/assets/IMG_1256.png",
    "lib/assets/weather.gif"
  ];
  final List<String> descriptions = [
    "project 0 descriotion",
    "project 0 descriotion",
    "project 0 descriotion",
    "project 0 descriotion",
    "project 0 descriotion",
    "project 0 descriotion"
  ];

  int? _selectedIndex;

   void initState() {
    screenWidth = widget.width;
    screenHeight = widget.height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 1.2,
      width: screenWidth,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: _selectedIndex == null
          ? GridView.builder(
              itemCount: projectNames.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        projectNames[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = null;
                  });
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                       imagePaths[_selectedIndex!],
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.6,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          descriptions[_selectedIndex!],
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
            ),
    );
  }
}
