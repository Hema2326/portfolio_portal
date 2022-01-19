import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  late ScrollController _scrollController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;
  bool isHovering3 = false;
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
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
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
            child: Row(
              children: [
                Image.asset(
                  'assets/logo1.png',
                  height: 150,
                  width: 150,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHovering = value;
                    });
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color: isHovering ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 20,
                ),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHovering1 = value;
                    });
                  },
                  child: Text(
                    'Portfolio',
                    style: TextStyle(
                        color: isHovering1 ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 20,
                ),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHovering2 = value;
                    });
                  },
                  child: Text(
                    'Projects',
                    style: TextStyle(
                        color: isHovering2 ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 20,
                ),
              ],
            ),
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
                AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOutQuad,
                    height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.blue.shade600,
                              Colors.blueAccent.shade100
                            ]),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 25),
                              const Text(
                                'Portfolio',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 25),
                              const Text(
                                'Projects',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20)
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
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: FaIcon(FontAwesomeIcons.linkedin,
                                    color: isHovering
                                        ? Colors.blue[700]
                                        : Colors.white,
                                    size: 30.0),
                                onTap: () async {
                                  const url =
                                      "https://www.linkedin.com/authwall?trk=gf&trkInfo=AQH40bJuvpRNdAAAAX5O0iFIuWCj7F96IZOHbTDfHM_AN4cwx0-wzPOj1PFgLBfxB9L85nUiD4I2sqXjVcN4qT66e_ZUEm2Wczqs-049m4ctLkq193R5q9hmdTHz1DsOahwt8-M=&originalReferer=https://www.m2pfintech.com/&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Fm2pfintech";
                                  await launch(url);
                                },
                                onHover: (value) {
                                  setState(() {
                                    isHovering = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                child: FaIcon(FontAwesomeIcons.twitter,
                                    color: isSelected1
                                        ? Colors.blue[400]
                                        : Colors.white,
                                    size: 30.0),
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
                                    size: 30.0),
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
                                    size: 30.0),
                                onTap: () async {
                                  const url =
                                      "https://www.facebook.com/m2pfintech";
                                  await launch(url);
                                },
                                onHover: (value) {
                                  setState(() {
                                    isSelected3 = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  right: 30,
                  bottom: 20,
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
