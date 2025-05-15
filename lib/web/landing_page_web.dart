import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components_web.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const DrawerContent(),
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        title: const TabsWebList(),
      ),
      body: ListView(
        children: [
          //First part
          SizedBox(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            )),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: const SansBold("Hello I'm", 15.0)),
                    const SizedBox(height: 15.0),
                    const SansBold("Rachit Dandriyal", 55.0),
                    const Sans("Flutter Developer", 30.0),
                    const SizedBox(height: 15.0),
                    const Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20.0),
                        Sans("rd13499@gmail.com", 15.0)
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20.0),
                        Sans("+91 8527674266", 15.0)
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20.0),
                        Sans("New Delhi", 15.0)
                      ],
                    ),
                    const SizedBox(height: 60.0),
                    const DownloadResume(),
                  ],
                ),
                const CircleAvatar(
                  radius: 146.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        radius: 140.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/profileMain.png")),
                  ),
                ),
              ],
            ),
          ),

          //Second Part
          SizedBox(
            height: heightDevice / 1.5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widthDevice *
                      0.05), // Add relative padding around the Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align children to the start vertically
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              widthDevice * 0.02), // Add relative padding
                      child: Image.asset(
                        "assets/web.jpg",
                        height: widthDevice / 1.9,
                        fit: BoxFit
                            .contain, // Ensure the image fits its container
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              widthDevice * 0.05), // Add relative padding
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Third Part
          SizedBox(
            height: heightDevice / 1.3,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyCards(
                      asset: "assets/app.png",
                      title: 'App Development',
                      text:
                          '<> Flutter for cross-platform mobile applications.\n<> Dart for efficient and maintainable code.',
                      size: 15.0,
                    ),
                    MyCards(
                      asset: "assets/webL.png",
                      title: 'Web Development',
                      text:
                          '<> Flutter for cross-platform web and mobile apps.\n<> Angular for robust and scalable web applications.',
                      size: 15.0,
                    ),
                    MyCards(
                      asset: "assets/backend.png",
                      title: 'Back-end Development',
                      text:
                          '<> Spring Boot for building RESTful APIs.\n<> Java for backend logic and data processing.',
                      size: 15.0,
                    ),
                  ],
                )
              ],
            ),
          ),

          //Fourth Part
          const ContactFormWeb()
        ],
      ),
    );
  }
}
