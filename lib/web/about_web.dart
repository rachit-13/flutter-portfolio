import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rachit_dandriyal/components_mobile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components_web.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  urlLauncher(String url, String imgPath) {
    return IconButton(
      icon: SvgPicture.asset(
        imgPath,
        color: Colors.black,
        width: 35.0,
      ),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const DrawerContent(),
      appBar: AppBar(
        elevation: 0.0,
        // iconTheme: const IconThemeData(
        //   size: 25.0,
        //   color: Colors.black,
        // ),
        title: const TabsWebList(),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widthDevice / 3,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SansBold('About me', 35.0),
                      SizedBox(
                        height: 20.0,
                      ),
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
                        height: 40.0,
                      ),
                      DownloadResume(),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 131.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 128.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 125.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/profileMain.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MyCards(
                asset: "assets/app.png",
                title: 'App Development',
                text:
                    '<> Flutter for cross-platform mobile applications.\n<> Dart for efficient and maintainable code.',
                size: 15.0,
              ),
              SizedBox(
                  width: widthDevice / 3,
                  child: const Column(
                    children: [
                      SansBold('App Development', 25.0),
                      SizedBox(
                        height: 20.0,
                      ),
                      Sans(
                          "Do you need a high-performance,responsive and beautiful app? Don't worry, I've got you covered",
                          15.0),
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 80.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: const Column(
                  children: [
                    SansBold('Web Development', 25.0),
                    SizedBox(
                      height: 20.0,
                    ),
                    Sans(
                        'I am here to build your presence online with state of the art web apps.',
                        15.0),
                  ],
                ),
              ),
              const MyCards(
                asset: "assets/webL.png",
                title: 'Web Development',
                text:
                    '<> Flutter for cross-platform web and mobile apps.\n<> Angular for robust and scalable web apps.',
                size: 15.0,
              ),
            ],
          ),
          const SizedBox(
            height: 80.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MyCards(
                asset: "assets/backend.png",
                title: 'Back-end Development',
                text:
                    '<> Spring Boot for building RESTful APIs.\n<> Java for backend logic and data processing.',
                size: 15.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: const Column(
                  children: [
                    SansBold('Back-end Development', 25.0),
                    SizedBox(
                      height: 20.0,
                    ),
                    Sans(
                        "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that. ",
                        15.0),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}
