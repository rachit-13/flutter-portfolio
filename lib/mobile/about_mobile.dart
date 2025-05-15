import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components_mobile.dart';
import '../components_web.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.tealAccent, width: 2.0, style: BorderStyle.solid),
      ),
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      endDrawer: const DrawerContentMobile(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: ListView(
          children: const [
            CircleAvatar(
              radius: 116.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 113.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/profileMain.png'),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SansBold("About Me", 35.0), //About
                  Sans(
                    "An Enthusiastic Flutter developer skilled in creating cross-platform mobile applications. "
                    "Passionate about leveraging Flutter's capabilities for user-friendly, visually appealing apps. "
                    "Committed to continuous learning and quality solutions.",
                    15.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    spacing: 7.0, // Horizontal spacing between skills
                    runSpacing: 7.0, // Vertical spacing between lines of skills
                    children: [
                      MySkills("Flutter", 15.0),
                      MySkills("Dart", 15.0),
                      MySkills("UI/UX", 15.0),
                      MySkills("Application Development", 15.0),
                      MySkills("Spring Boot", 15.0),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyCards(
                  asset: 'assets/webL.png',
                  // title: 'Web Development',
                  text:
                      '<> Flutter for cross-platform web and mobile apps.\n<> Angular for robust and scalable web applications.',
                  size: 15.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SansBold('Web Development', 18.0),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Sans(
                  "I'm here to build your presence online with state of the art web apps.",
                  15.0),
            ),
            //second card
            SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyCards(
                  asset: "assets/app.png",
                  // title: 'App Development',
                  text:
                      '<> Flutter for cross-platform mobile applications.\n<> Dart for efficient and maintainable code.',
                  size: 15.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SansBold('App Development', 18.0),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Sans(
                  "Do you need a high-performance,responsive and beautiful app? Don't worry, I've got you covered  ",
                  15.0),
            ),
            //third card
            SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyCards(
                  asset: "assets/backend.png",
                  // title: 'Back-end Development',
                  text:
                      '<> Spring Boot for building RESTful APIs.\n<> Java for backend logic and data processing.',
                  size: 15.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SansBold('Back-end Development', 18.0),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Sans(
                  "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that. ",
                  15.0),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    ));
  }
}
