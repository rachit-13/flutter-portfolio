import 'package:flutter/material.dart';
import '../components_mobile.dart';
import '../components_web.dart';

class ProjectsMobile extends StatelessWidget {
  const ProjectsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
        endDrawer: const DrawerContentMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                expandedHeight: 450.0,
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
            padding: const EdgeInsets.all(20.0),
            children: [
              const Center(child: SansBold('Projects', 40.0)),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  projectCard(
                    widthDevice: widthDevice,
                    image: 'assets/nps.jpg',
                    title: 'National Pension System(NPS)',
                    description:
                        'Contributed to the collaborative development effort from inception to deployment of the National Pension System (NPS) app with my team, using Flutter. Played a key role in designing and implementing core functionalities, ensuring robust performance and intuitive user interactions across platforms.',
                  ),
                  projectCard(
                    widthDevice: widthDevice,
                    image: 'assets/apy.png',
                    title: 'Atal Pension Yojana(APY)',
                    description:
                        'Contributed significantly to the development and testing phases of the Atal Pension Yojana (APY) mobile application using Flutter. Collaborated closely with the team to implement core functionalities, ensuring seamless performance and user engagement.',
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  projectCard(
                    widthDevice: widthDevice,
                    image: 'assets/PAN.jpeg',
                    title: 'PAN-POC',
                    description:
                        'Implemented camera functionality in Flutter for user photo capture and verification within the PAN-POC application. Utilized robust state management techniques to ensure efficient performance and enhance user experience.',
                  ),
                  projectCard(
                    widthDevice: widthDevice,
                    image: 'assets/proteanSurakshAA.jpeg',
                    title: 'Protean SurakshAA',
                    description:
                        'Contributed significantly to the enhancement of the Protean SurakshAA Flutter application by efficiently diagnosing and resolving critical bugs. Applied targeted fixes to improve application stability and functionality, collaborating closely with the development team to deliver reliable solutions and ensure a seamless user experience.',
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  projectCard(
                    widthDevice: widthDevice,
                    image: 'assets/eSignPro.png',
                    title: 'eSignPro',
                    description:
                        'Conducted complete testing for the eSignPro project, identifying and reporting bugs, and generating detailed reports. Ensured the delivery of a robust and reliable application, demonstrating attention to detail and commitment to quality.',
                  ),
                  SizedBox(width: widthDevice / 3), // Adjust spacing as needed
                ],
              ),
            ],
          ),
        ));
  }

  Widget projectCard({
    required double widthDevice,
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      width: widthDevice / 2.5, // Adjust width of each card
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              width: 120.0, // Adjust the width of the image
              fit: BoxFit.cover, // Ensure the image covers its container
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: const TextStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
