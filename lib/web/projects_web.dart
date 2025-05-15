import 'package:flutter/material.dart';

import '../components_mobile.dart';
import '../components_web.dart';

class ProjectsWeb extends StatefulWidget {
  const ProjectsWeb({super.key});

  @override
  State<ProjectsWeb> createState() => _ProjectsWebState();
}

class _ProjectsWebState extends State<ProjectsWeb> {
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      endDrawer: const DrawerContentMobile(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              expandedHeight: 550.0,
              iconTheme: const IconThemeData(color: Colors.white, size: 35.0),
              flexibleSpace: FlexibleSpaceBar(
                // centerTitle: true,
                background: Image.asset(
                  'assets/projects.png',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                const SansBold('Projects', 40.0),
                const SizedBox(
                  height: 80.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircularIcon(
                      asset: 'assets/nps.jpg',
                      radius: 100,
                    ),
                    SizedBox(
                      width: widthDevice / 3,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SansBold('National Pension System(NPS)', 30.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          Sans(
                            'Contributed to the collaborative development effort from inception to deployment of the National Pension System (NPS) app with my team, using Flutter. Played a key role in designing and implementing core functionalities, ensuring robust performance and intuitive user interactions across platforms.',
                            15.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 150.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: widthDevice / 3,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SansBold('Atal Pension Yojana(APY)', 30.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          Sans(
                              'Contributed significantly to the development and testing phases of the Atal Pension Yojana (APY) mobile application using Flutter. Collaborated closely with the team to implement core functionalities, ensuring seamless performance and user engagement.',
                              15.0)
                        ],
                      ),
                    ),
                    const CircularIcon(
                      asset: 'assets/apy.png',
                      radius: 100,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircularIcon(
                      asset: 'assets/PAN.jpeg',
                      radius: 100,
                    ),
                    SizedBox(
                      width: widthDevice / 3,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SansBold('PAN-POC', 30.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          Sans(
                            'Implemented camera functionality in Flutter for user photo capture and verification within the PAN-POC application. Utilized robust state management techniques to ensure efficient performance and enhance user experience.',
                            15.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 150.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: widthDevice / 3,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SansBold('Protean SurakshAA', 30.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          Sans(
                              'Contributed significantly to the enhancement of the Protean SurakshAA Flutter application by efficiently diagnosing and resolving critical bugs. Applied targeted fixes to improve application stability and functionality, collaborating closely with the development team to deliver reliable solutions and ensure a seamless user experience.',
                              15.0)
                        ],
                      ),
                    ),
                    const CircularIcon(
                      asset: 'assets/proteanSurakshAA.jpeg',
                      radius: 100,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircularIcon(
                      asset: 'assets/eSignPro.png',
                      radius: 100,
                    ),
                    SizedBox(
                      width: widthDevice / 3,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SansBold('eSignPro', 30.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          Sans(
                            'Conducted complete testing for the eSignPro project, identifying and reporting bugs, and generating detailed reports. Ensured the delivery of a robust and reliable application, demonstrating attention to detail and commitment to quality.',
                            15.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 150.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
