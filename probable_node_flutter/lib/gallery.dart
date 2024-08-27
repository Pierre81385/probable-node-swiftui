import 'package:flutter/material.dart';

class GalleryView extends StatefulWidget {
  final double height;
  final double width;

  const GalleryView({
    required this.height,
    required this.width,
  });

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  late double screenHeight;
  late double screenWidth;

  final List<String> projectNames = [
    "TOTP Authentication",
    "Weather Notifications",
    "RTD / GTFS-RT",
    "API Response",
    "Nightclub Demo",
    "OpenWeather Revisited",
  ];
  final List<String> imagePaths = [
    "lib/assets/fulldemo.gif",
    "lib/assets/basic_demo4.gif",
    "lib/assets/rtd_ss.png",
    "lib/assets/api_response.gif",
    "lib/assets/nightclub.gif",
    "lib/assets/weather.gif"
  ];
  final List<String> descriptions = [
    "Curious how TOTP Authentication works I created an Authenticator app after a cowoker asked me why an app might fail to populate the name of our service.  This uses a QR Code scanner to read and extract the secret, and other hidden meta data, along with current timestamp to create a HMAC-SHA1 hash and converting the extracted binary to a 6 digit code. Scanned secrets can be saved in SwiftData and regenerated independently.",
    "An app to create local push notifications for upcoming temperatues in your area. Weather kit for hourly forecast data. MapKit to get the users current location. Notifications are saved to SwiftData. I heavily modified a tutorial I found online for a circular tile to create the temperature dial. Conversion to C• works as well.",
    "I found Denver's light rail app really difficult to natigate and when I needed to know where a train was, the process was too complicated. So I downloaded the map and GTFS data and connected to the realtime data feed. In this project I learned out how create a Google Mpa view and draw polylines to indicate a route and provide a marker for each train.",
    "Wanting an easy way to navigate an extremely large JSON response, I created this to parse each level of a response. The value and type is evaluated to determine how to present the values in an easy to read and navigate",
    "When I first understood the power of state management in React it was a game changer for UI design and this is still one of the best looking websites I've ever built in my opinion. I wanted to experiment with a horizontal layout that was compact but contained a ton to consume.",
    "After several years of practice I decided to revist to Weather App we had to build in Bootcamp. This mobile version is much more appealing while using the same OpenWeather API. THe original is still in my repo and I recall having a lot of issues with it on my first try.",
  ];

  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    screenWidth = widget.width;
    screenHeight = widget.height;
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
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            imagePaths[index],
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.4,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            projectNames[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = null;
                });
              },
              child: Center(
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child:
                          Image.asset(
                            imagePaths[_selectedIndex!],
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.7,
                            fit: BoxFit.contain,
                          ),
                      ),
                      Text(descriptions[_selectedIndex!])
                    ],
                  )
                ),
              ),
    );
  }
}
