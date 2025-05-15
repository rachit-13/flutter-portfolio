import 'package:flutter/material.dart';
import '../components_mobile.dart';
import '../components_web.dart'; // Assuming this contains your custom widgets for mobile

class WorkMobile extends StatefulWidget {
  const WorkMobile({super.key});

  @override
  State<WorkMobile> createState() => _WorkMobileState();
}

class _WorkMobileState extends State<WorkMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer:
          const DrawerContentMobile(), // Assuming you have a mobile version of the drawer
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/works.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            )
          ];
        },
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            const SizedBox(height: 20.0),
            const Center(child: SansBold('Works', 30.0)),
            const SizedBox(height: 40.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircularIcon(
                      asset: 'assets/proteanLogo.png',
                      radius: 80,
                    ),
                    SizedBox(
                      width: widthDevice / 2,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SansBold('Protean eGov', 24.0),
                          SizedBox(height: 15.0),
                          Sans(
                            'As a Flutter developer with 1.5 years of experience at Protean eGov Technologies Ltd., I have developed and maintained robust web and mobile applications using Flutter. My role involves delivering high-quality solutions, enhancing user experiences, and optimizing application performance. I have effectively collaborated within a team environment to meet project goals and ensure the successful deployment of various applications.',
                            14.0,
                            // textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: widthDevice / 2,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SansBold('Doubtnut', 24.0),
                          SizedBox(height: 15.0),
                          Sans(
                            'Instructed diverse student cohorts in various computer languages for approximately 1 year, creating a dynamic and inclusive learning environment. Developed and implemented an effective curriculum, ensuring students acquired practical programming skills. Provided personalized support, leading to improved student comprehension and overall academic achievement.',
                            14.0,
                            // textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const CircularIcon(
                      asset: 'assets/doubtnutLogo.png',
                      radius: 80,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
