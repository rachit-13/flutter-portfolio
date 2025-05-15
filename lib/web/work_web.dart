import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../components_web.dart'; // Assuming this contains your custom widgets

class WorkWeb extends StatefulWidget {
  const WorkWeb({super.key});

  @override
  State<WorkWeb> createState() => _WorkWebState();
}

class _WorkWebState extends State<WorkWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const DrawerContent(),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
                expandedHeight: 550.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/works.jpg',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                title: const TabsWebList(),
              )
            ];
          },
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  const SansBold('Works', 40.0),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircularIcon(
                        asset: 'assets/proteanLogo.png',
                        radius: 100,
                      ),
                      SizedBox(
                        width: widthDevice / 3,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SansBold('Protean eGov', 30.0),
                            SizedBox(
                              height: 15.0,
                            ),
                            Sans(
                              'As a Flutter developer with 1.5 years of experience at Protean eGov Technologies Ltd., I have developed and maintained robust web and mobile applications using Flutter. My role involves delivering high-quality solutions, enhancing user experiences, and optimizing application performance. I have effectively collaborated within a team environment to meet project goals and ensure the successful deployment of various applications.',
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
                            SansBold('Doubtnut', 30.0),
                            SizedBox(
                              height: 15.0,
                            ),
                            Sans(
                                'Instructed diverse student cohorts in various computer languages for approximately 1 year, creating a dynamic and inclusive learning environment. Developed and implemented an effective curriculum, ensuring students acquired practical programming skills. Provided personalized support, leading to improved student comprehension and overall academic achievement.',
                                15.0)
                          ],
                        ),
                      ),
                      const CircularIcon(
                        asset: 'assets/doubtnutLogo.png',
                        radius: 100,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
