import 'dart:ui' as UI;
import 'package:flutter/material.dart';
import 'package:probable_node_flutter/about.dart';
import 'package:probable_node_flutter/contact.dart';
import 'package:probable_node_flutter/experience.dart';
import 'package:probable_node_flutter/gallery.dart';
import 'package:probable_node_flutter/skills.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'PETER JOHN BISHOP',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView()
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _selectedSection = '';

  void _scrollToSection(GlobalKey key, String section) {
    final context = key.currentContext!;
    setState(() {
      _selectedSection = section;
    });
    Scrollable.ensureVisible(
      context,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final UI.Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: screenWidth < 500
            ? Text("PJB", style: TextStyle(
                color: Colors.white,
              ))
            : Text('PETER JOHN BISHOP / full stack developer', style: TextStyle(
                color: Colors.white,
              )),
        actions: [
          TextButton(
            onPressed: () => _scrollToSection(_aboutKey, 'About'),
            child: Text(
              'About',
              style: TextStyle(
                color: _selectedSection == 'About' ? Colors.white : Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_galleryKey, 'Gallery'),
            child: Text(
              'Gallery',
              style: TextStyle(
                color: _selectedSection == 'Gallery' ? Colors.white : Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_skillsKey, 'Skills'),
            child: Text(
              'Skills',
              style: TextStyle(
                color: _selectedSection == 'Skills' ? Colors.white : Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_experienceKey, 'Experience'),
            child: Text(
              'Experience',
              style: TextStyle(
                color: _selectedSection == 'Experience' ? Colors.white : Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_contactKey, 'Contact'),
            child: Text(
              'Contact',
              style: TextStyle(
                color: _selectedSection == 'Contact' ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionWidget(
              key: _aboutKey,
              title: 'About',
              color: Colors.black,
              height: screenHeight,
              width: screenWidth,
            ),
            SectionWidget(
              key: _galleryKey,
              title: 'Gallery',
              color: Colors.white,
              height: screenHeight,
              width: screenWidth,
            ),
            SectionWidget(
              key: _skillsKey,
              title: 'Skills',
              color: Colors.blue.withOpacity(0.3),
              height: screenHeight,
              width: screenWidth,
            ),
            SectionWidget(
              key: _experienceKey,
              title: 'Experience',
              color: Colors.teal.withOpacity(0.3),
              height: screenHeight,
              width: screenWidth,
            ),
            SectionWidget(
              key: _contactKey,
              title: 'Contact',
              color: Colors.grey.withOpacity(0.3),
              height: screenHeight,
              width: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}


class SectionWidget extends StatefulWidget {
  const SectionWidget({Key? key, required this.title, required this.color, required this.height, required this.width}) : super(key: key);

  final String title;
  final Color color;
  final double height;
  final double width;

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {

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
    if (widget.key == context.findAncestorStateOfType<HomeViewState>()?._aboutKey) {
      return AboutView(width: screenWidth, height: screenHeight, title: title, color: color,);
    } else if (widget.key == context.findAncestorStateOfType<HomeViewState>()?._galleryKey) {
      return GalleryView(width: screenWidth, height: screenHeight);
    } else if (widget.key == context.findAncestorStateOfType<HomeViewState>()?._skillsKey) {
      return SkillsView(width: screenWidth, height: screenHeight, title: title, color: color,);
    } else if (widget.key == context.findAncestorStateOfType<HomeViewState>()?._experienceKey) {
      return ExperienceView(width: screenWidth, height: screenHeight, title: title, color: color,);
    } else if (widget.key == context.findAncestorStateOfType<HomeViewState>()?._contactKey) {
      return ContactView(width: screenWidth, height: screenHeight, title: title, color: color,);
    } else {
      return Container(
        height: screenHeight,
        width: screenWidth,
        color: widget.color,
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      );
    }
  }
}



