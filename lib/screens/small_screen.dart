import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_portal/screens/app_bar.dart';
import 'dart:math' as math;

class SmallScreen extends StatefulWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  _SmallScreenState createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -3,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: topNavigationBar(context, scaffoldKey),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Image.asset(
                'assets/logo1.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isHovering = value;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.redAccent),
                  ),
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color: isHovering ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width / 20,
                height: 30,
              ),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isHovering1 = value;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.redAccent),
                  ),
                  child: Text(
                    'Portfolio',
                    style: TextStyle(
                        color: isHovering1 ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width / 20,
                height: 30,
              ),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isHovering2 = value;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.redAccent),
                  ),
                  child: Text(
                    'Projects',
                    style: TextStyle(
                        color: isHovering2 ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width / 20,
                height: 30,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(height: 900),
                Lottie.network(
                  'https://assets4.lottiefiles.com/packages/lf20_rfDuEU.json',
                  height: 600.0,
                  repeat: true,
                  reverse: true,
                  animate: true,
                ),
              ],
            ),
            Stack(
              children: [
                AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return ClipPath(
                          clipper: DrawClip(_controller.value),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 270,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.blue.shade600,
                                        Colors.blueAccent.shade100
                                      ]),
                                )),
                          ));
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Home',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Portfolio',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Projects',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              const url = "https://m2pfintech.com/legal/";
                              await launch(url);
                            },
                            child: const Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://m2pfintech.com/privacy-policy/";
                              await launch(url);
                            },
                            child: const Text(
                              'Privacy policy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: FaIcon(FontAwesomeIcons.github,
                                color:
                                    isSelected4 ? Colors.black : Colors.white,
                                size: 25.0),
                            onTap: () async {
                              const url = "https://github.com/flutter";
                              await launch(url);
                            },
                            onHover: (value) {
                              setState(() {
                                isSelected4 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            child: FaIcon(FontAwesomeIcons.linkedin,
                                color: isSelected
                                    ? Colors.blue[700]
                                    : Colors.white,
                                size: 25.0),
                            onTap: () async {
                              const url =
                                  "https://www.linkedin.com/authwall?trk=gf&trkInfo=AQH40bJuvpRNdAAAAX5O0iFIuWCj7F96IZOHbTDfHM_AN4cwx0-wzPOj1PFgLBfxB9L85nUiD4I2sqXjVcN4qT66e_ZUEm2Wczqs-049m4ctLkq193R5q9hmdTHz1DsOahwt8-M=&originalReferer=https://www.m2pfintech.com/&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Fm2pfintech";
                              await launch(url);
                            },
                            onHover: (value) {
                              setState(() {
                                isSelected = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            child: FaIcon(FontAwesomeIcons.twitter,
                                color: isSelected1
                                    ? Colors.blue[400]
                                    : Colors.white,
                                size: 25.0),
                            onTap: () async {
                              const url = "https://twitter.com/m2pfintech";
                              await launch(url);
                            },
                            onHover: (value) {
                              setState(() {
                                isSelected1 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            child: FaIcon(FontAwesomeIcons.instagram,
                                color: isSelected2
                                    ? Colors.pink[400]
                                    : Colors.white,
                                size: 25.0),
                            onTap: () async {
                              const url =
                                  "https://www.instagram.com/m2pfintech/";
                              await launch(url);
                            },
                            onHover: (value) {
                              setState(() {
                                isSelected2 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            child: FaIcon(FontAwesomeIcons.facebook,
                                color: isSelected3
                                    ? Colors.blue[600]
                                    : Colors.white,
                                size: 25.0),
                            onTap: () async {
                              const url = "https://www.facebook.com/m2pfintech";
                              await launch(url);
                            },
                            onHover: (value) {
                              setState(() {
                                isSelected3 = value;
                              });
                            },
                          ),
                          // const SizedBox(height: 50),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 70,
                  child: InkWell(
                    child: const Icon(
                      Icons.arrow_circle_up,
                      color: Colors.white,
                    ),
                    onTap: () {
                      _scrollToTop();
                    },
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.6);

    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(
      xCenter,
      yCenter,
      size.width,
      size.height * 0.8,
    );

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
