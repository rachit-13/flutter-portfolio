import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components_web.dart';

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SansBold("Contact me", 35.0),
          const SizedBox(
            height: 20.0,
          ),
          TextForm(
              heading: "First Name",
              hintText: "Please enter First Name",
              controlller: _firstNameController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Please enter first name";
                }
              },
              width: widthDevice / 1.4),
          const SizedBox(
            height: 20.0,
          ),
          TextForm(
            heading: "Last Name",
            hintText: "Please enter Last Name",
            controlller: _lastNameController,
            width: widthDevice / 1.4,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Please enter last name";
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextForm(
              heading: "Email",
              hintText: "Please enter your Email",
              controlller: _emailController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Please enter email";
                }
              },
              width: widthDevice / 1.4),
          const SizedBox(
            height: 20.0,
          ),
          TextForm(
              heading: "Phone Number",
              hintText: "Please enter your Phone Number",
              controlller: _phoneNumberController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Please enter Phone Number";
                }
              },
              width: widthDevice / 1.4),
          const SizedBox(
            height: 20.0,
          ),
          TextForm(
              heading: "Message",
              maxlines: 10,
              hintText: "Please type your message",
              controlller: _messageController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Please enter message";
                }
              },
              width: widthDevice / 1.4),
          const SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            onPressed: () async {
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                    _firstNameController.text,
                    _lastNameController.text,
                    _emailController.text,
                    _phoneNumberController.text,
                    _messageController.text)) {
                  formKey.currentState!.reset();
                  dialogError(context, "Message sent successfully");
                } else {
                  formKey.currentState!.reset();
                  dialogError(context, "Message failed to send");
                }
              }
            },
            color: Colors.tealAccent,
            elevation: 20.0,
            height: 60.0,
            minWidth: 200.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const SansBold("Submit", 20.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, @required this.text, @required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}

class DrawerContentMobile extends StatefulWidget {
  const DrawerContentMobile({super.key});

  @override
  State<DrawerContentMobile> createState() => _DrawerContentMobileState();
}

class _DrawerContentMobileState extends State<DrawerContentMobile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2.0)),
              child: Image.asset('assets/profile-pic.png'),
            ),
          ),
          const TabsMobile(text: "Home", route: '/'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Works", route: '/works'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Blog", route: '/blog'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "About", route: '/about'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Contact", route: '/contact'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Projects", route: '/projects'),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async => {
                  await launchUrl(
                      Uri.parse('https://www.instagram.com/rachit_dandriyal'))
                },
                icon: SvgPicture.asset(
                  'assets/instagram2.svg',
                  color: Colors.black,
                  width: 35.0,
                ),
              ),
              IconButton(
                onPressed: () async => {
                  await launchUrl(Uri.parse(
                      'https://www.linkedin.com/in/rachitdandriyal13?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app'))
                },
                icon: Image.asset(
                  'assets/img.png',
                  color: Colors.black,
                  width: 35.0,
                ),
              ),
              IconButton(
                onPressed: () async =>
                    {await launchUrl(Uri.parse('https://github.com/login'))},
                icon: SvgPicture.asset(
                  'assets/github.svg',
                  color: Colors.black,
                  width: 35.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// tealContainer(String text) {
//   return Container(
//     decoration: BoxDecoration(
//       border: Border.all(
//           color: Colors.tealAccent, width: 2.0, style: BorderStyle.solid),
//     ),
//     child: Text(
//       text,
//       style: GoogleFonts.openSans(fontSize: 15.0),
//     ),
//   );
// }
