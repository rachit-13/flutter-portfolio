import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components_mobile.dart';
import '../components_web.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: const DrawerContentMobile(),
        body: ListView(
          children: [
            const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                ]),
            const SizedBox(height: 25.0),
            //Intro First Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: const SansBold("Hello I'm", 15.0)),
                      const SansBold("Rachit Dandriyal", 40.0),
                      const SansBold('Flutter Developer', 20.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 5.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans('rd13499@gmail.com', 15.0),
                          Sans('8527674266', 15.0),
                          Sans('Delhi', 15.0),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 90.0,
            ),
            //About me, Second Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthDevice * 0.05),
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SansBold("About Me", 35.0),
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
                      runSpacing:
                          7.0, // Vertical spacing between lines of skills
                      children: [
                        MySkills("Flutter", 15.0),
                        MySkills("Dart", 15.0),
                        MySkills("UI/UX", 15.0),
                        MySkills("Application Development", 15.0),
                        MySkills("Spring Boot", 15.0),
                      ],
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ]),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold("What I do?", 35.0),
                MyCards(
                  asset: "assets/webL.png",
                  title: 'Web Development',
                  text:
                      '<> Flutter for cross-platform web and mobile apps.\n<> Angular for robust and scalable web applications.',
                  size: 15.0,
                ),
                SizedBox(
                  height: 35.0,
                ),
                MyCards(
                  asset: "assets/app.png",
                  title: 'App Development',
                  text:
                      '<> Flutter for cross-platform mobile applications.\n<> Dart for efficient and maintainable code.',
                  size: 15.0,
                ),
                SizedBox(
                  height: 35.0,
                ),
                MyCards(
                  asset: "assets/backend.png",
                  title: 'Back-end Development',
                  text:
                      '<> Spring Boot for building RESTful APIs.\n<> Java for backend logic and data processing.',
                  size: 15.0,
                ),
                SizedBox(
                  height: 60.0,
                ),
              ],
            ),

            //Contact
            const ContactFormMobile(),
          ],
        ));
  }
}
