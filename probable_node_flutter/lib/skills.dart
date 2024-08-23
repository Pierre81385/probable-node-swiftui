import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillsView extends StatefulWidget {
  final double width;
  final double height;
   final String title;
  final Color color;

  const SkillsView({required this.width, required this.height, required this.title, required this.color});

  @override
  State<SkillsView> createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> {
  late double screenWidth;
  late double screenHeight;
  late String title;
  late Color color;

  List<SvgPicture> svg = [
    SvgPicture.asset(
      'lib/assets/amazonwebservices-original-wordmark.svg',
      semanticsLabel: 'aws icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/socketio-original-wordmark.svg',
      semanticsLabel: 'socket.io icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/bitbucket-original-wordmark.svg',
      semanticsLabel: 'bitbucket icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/bootstrap-plain-wordmark.svg',
      semanticsLabel: 'bootstrap icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/css3-original-wordmark.svg',
      semanticsLabel: 'css3 icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/dart-original-wordmark.svg',
      semanticsLabel: 'dart icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/express-original-wordmark.svg',
      semanticsLabel: 'express icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/firebase-plain-wordmark.svg',
      semanticsLabel: 'firebase icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/flutter-original.svg',
      semanticsLabel: 'flutter icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/git-original-wordmark.svg',
      semanticsLabel: 'git icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/graphql-plain-wordmark.svg',
      semanticsLabel: 'graphql icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/handlebars-original-wordmark.svg',
      semanticsLabel: 'handlebars icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/heroku-original-wordmark.svg',
      semanticsLabel: 'heroku icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/html5-original-wordmark.svg',
      semanticsLabel: 'html5 icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/javascript-original.svg',
      semanticsLabel: 'javascript icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/jquery-original-wordmark.svg',
      semanticsLabel: 'jquery icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/materialui-original.svg',
      semanticsLabel: 'materialui icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/mongodb-original-wordmark.svg',
      semanticsLabel: 'mongodb icon',
     height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/mysql-original-wordmark.svg',
      semanticsLabel: 'mysql icon',
     height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/nodejs-plain-wordmark.svg',
      semanticsLabel: 'nodejs icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/npm-original-wordmark.svg',
      semanticsLabel: 'npm icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/photoshop-line.svg',
      semanticsLabel: 'photoshop icon',
     height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/postgresql-original-wordmark.svg',
      semanticsLabel: 'postgresql icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/react-original-wordmark.svg',
      semanticsLabel: 'react icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/sequelize-original-wordmark.svg',
      semanticsLabel: 'sequelize icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/sqlite-original-wordmark.svg',
      semanticsLabel: 'sqlite icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/swift-original-wordmark.svg',
      semanticsLabel: 'swaift icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/typescript-original.svg',
      semanticsLabel: 'typescript icon',
      height: 100,
      width: 100,
    ),
    SvgPicture.asset(
      'lib/assets/xcode-original.svg',
      semanticsLabel: 'xcode icon',
      height: 100,
      width: 100,
    ),
  ];

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
      child: Stack(children: [
        Center(
          child:  Image.asset(
                       "lib/assets/me.png",
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.fitHeight,
                      )
        ),
       
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
Center(
        child: Wrap(
          spacing: 8.0, // Horizontal space between the icons
          runSpacing: 8.0, // Vertical space between the icons
          alignment: WrapAlignment.center, // Center the icons horizontally
          runAlignment: WrapAlignment.center, // Center the icons vertically
          children: List.generate(svg.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: svg[index],
            );
          }),
        ),
      ),
      SizedBox(height: 100,)  
        ],
      )
      ],)
    );
  }
}