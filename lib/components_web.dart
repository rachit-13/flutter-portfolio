import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb({super.key, this.title, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          style: isSelected
              ? GoogleFonts.oswald(
                  shadows: [
                      const Shadow(
                        color: Colors.black,
                        offset: Offset(0, -8),
                      )
                    ],
                  fontSize: 30.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.0,
                  decorationColor: Colors.tealAccent)
              : GoogleFonts.oswald(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }
}

class MySkills extends StatelessWidget {
  final skill;
  final size;
  const MySkills(this.skill, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.tealAccent, width: 2.0)),
      padding: const EdgeInsets.all(7.0),
      child: Sans(skill, size),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
      ),
      textAlign: TextAlign.justify,
    );
  }
}

class TextForm extends StatefulWidget {
  final String heading;
  final int maxlines;
  final String hintText;
  final double width;
  final TextEditingController? controlller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const TextForm({
    super.key,
    required this.heading,
    this.maxlines = 1,
    required this.hintText,
    required this.width,
    this.controlller,
    this.validator,
    this.inputFormatters,
  });

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(widget.heading, 16.0),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: widget.width,
          child: TextFormField(
            validator: (text) {
              String? validationResult = widget.validator!(text);
              setState(() {
                _isValid = validationResult == null;
              });
              return validationResult;
            },
            controller: widget.controlller,
            maxLines: widget.maxlines,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(15.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: _isValid ? Colors.green : Colors.teal),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: _isValid ? Colors.green : Colors.teal, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14.0),
            ),
          ),
        ),
      ],
    );
  }
}

class MyCards extends StatefulWidget {
  final String asset;
  final title;
  final size;
  final text;
  final height;
  final width;

  const MyCards({
    Key? key,
    required this.asset,
    this.title,
    this.size,
    this.height,
    this.width,
    this.text,
  }) : super(key: key);

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _toggleCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * math.pi;
          final transform = Matrix4.rotationY(angle);
          if (angle >= math.pi / 2) {
            transform.rotateY(math.pi);
          }
          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child:
                angle >= math.pi / 2 ? _buildBack(widget.text) : _buildFront(),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return Card(
      elevation: 30.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(color: Colors.tealAccent),
      ),
      shadowColor: Colors.tealAccent,
      child: Container(
        width: widget.width ?? 220.0, // Fixed width to maintain shape
        height: widget.height ?? 250.0, // Fixed height to maintain shape
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.asset,
              height: 200.0,
              width: 200.0,
              filterQuality: FilterQuality.high,
            ),
            widget.title == null
                ? const SizedBox()
                : SansBold(widget.title, widget.size),
          ],
        ),
      ),
    );
  }

  Widget _buildBack(text) {
    List<String> textLines = text.split('\n');
    return Card(
      // color: Colors.tealAccent,
      elevation: 30.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(color: Colors.tealAccent),
      ),
      shadowColor: Colors.tealAccent,
      child: Container(
        width: 220.0, // Fixed width to maintain shape
        height: 250.0, // Fixed height to maintain shape
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textLines[0], // First line as statement
              style: TextStyle(
                fontSize: widget.size,
                fontWeight: FontWeight.bold,
                // color: Colors.tealAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              textLines[1], // Second line as single word
              style: TextStyle(
                  fontSize: widget.size,
                  // color: Colors.tealAccent,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Text(
            //   textLines[2], // Third line as single word
            //   style: TextStyle(
            //       fontSize: widget.size,
            //       color: Colors.red,
            //       fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }
}

class AbelCustom extends StatefulWidget {
  final text;
  final size;
  final fontWeight;
  final color;
  const AbelCustom(
      {super.key,
      @required this.text,
      @required this.size,
      this.fontWeight,
      this.color});

  @override
  State<AbelCustom> createState() => _AbelCustomState();
}

class _AbelCustomState extends State<AbelCustom> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.abel(
        fontSize: widget.size,
        color: widget.color ?? Colors.black,
        fontWeight: widget.fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class AddDataFirestore {
  CollectionReference response =
      FirebaseFirestore.instance.collection('messages');

  Future addResponse(final firstName, final lastName, final email,
      final phoneNumber, final message) async {
    return response.add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'phone number': phoneNumber,
      'message': message,
    }).then((value) {
      print("Success");
      return true;
    }).catchError((error) {
      print(error);
      return false;
    });
  }
}

Future dialogError(BuildContext context, String title) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: SansBold(title, 20.0),
    ),
  );
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(flex: 3),
        TabsWeb(title: 'Home', route: '/'),
        Spacer(),
        TabsWeb(title: 'Works', route: '/works'),
        Spacer(),
        TabsWeb(title: 'Blog', route: '/blog'),
        Spacer(),
        TabsWeb(title: 'About', route: '/about'),
        Spacer(),
        TabsWeb(title: 'Contact', route: '/contact'),
        Spacer(),
        TabsWeb(title: 'Projects', route: '/projects'),
        Spacer(),
      ],
    );
  }
}

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.tealAccent,
            radius: 72.0,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/profile-pic.png"),
            ),
          ),
          const SizedBox(height: 15.0),
          const SansBold("Rachit Dandriyal", 30.0),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("https://www.instagram.com/rachit_dandriyal/",
                  "assets/instagram2.svg"),
              IconButton(
                icon: Image.asset(
                  'assets/img.png',
                  // color: Colors.black,
                  width: 35.0,
                ),
                onPressed: () async {
                  await launchUrl(Uri.parse(
                      "https://www.linkedin.com/in/rachitdandriyal13?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app"));
                },
              ),
              // urlLauncher("https://www.instagram.com/rachit_dandriyal/",
              //     "assets/linkedin.svg"),
              urlLauncher("https://github.com/login", "assets/github.svg"),
            ],
          )
        ],
      ),
    );
  }

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
}

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            const SansBold("Contact me", 40.0),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextForm(
                  heading: "First Name",
                  maxlines: 1,
                  hintText: "Please enter First Name",
                  controlller: _firstNameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter First Name";
                    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(text)) {
                      return "First Name must be alphabets only";
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return newValue.copyWith(
                        text: newValue.text.capitalize(),
                      );
                    }),
                  ],
                  width: 350.0,
                ),
                TextForm(
                  heading: "Last Name",
                  maxlines: 1,
                  hintText: "Please enter Last Name",
                  controlller: _lastNameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter Last Name";
                    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(text)) {
                      return "Last Name must be alphabets only";
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return newValue.copyWith(
                        text: newValue.text.capitalize(),
                      );
                    }),
                  ],
                  width: 350.0,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextForm(
                  heading: "Email",
                  maxlines: 1,
                  hintText: "Please enter your Email",
                  controlller: _emailController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter your Email";
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(text)) {
                      return "Please enter a valid Email";
                    }
                    return null;
                  },
                  width: 350.0,
                ),
                TextForm(
                  heading: "Phone Number",
                  maxlines: 1,
                  hintText: "Please enter your Phone Number",
                  controlller: _phoneNumberController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter Phone Number";
                    } else if (!RegExp(r'^\d{10}$').hasMatch(text)) {
                      return "Phone Number must be 10 digits";
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  width: 350.0,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            TextForm(
              heading: "Message",
              maxlines: 10,
              hintText: "Please type your message",
              controlller: _messageController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Please enter message";
                }
                return null;
              },
              width: widthDevice / 1.5,
            ),
            const SizedBox(height: 30.0),
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
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

class DownloadResume extends StatefulWidget {
  const DownloadResume({super.key});

  @override
  State<DownloadResume> createState() => _DownloadResumeState();
}

class _DownloadResumeState extends State<DownloadResume> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Colors.tealAccent,
        height: 50.0,
        minWidth: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: _downloadResume,
        child: const SansBold("Download Resume", 15.0));
  }
}

void _downloadResume() async {
  const String resumeUrl =
      'https://firebasestorage.googleapis.com/v0/b/rachit-dandriyal.appspot.com/o/Rachit%20CV.pdf?alt=media&token=8cd92335-606a-43e9-b832-a2c1f2f307c9';

  if (await canLaunch(resumeUrl)) {
    await launch(resumeUrl);
  } else {
    throw 'Could not launch $resumeUrl';
  }
}

class CircularIcon extends StatelessWidget {
  final String asset;
  final radius;
  const CircularIcon({super.key, required this.asset, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: Image.asset(
        asset,
        fit: BoxFit.contain,
      ),
    );
  }
}
