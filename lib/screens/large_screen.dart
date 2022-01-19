import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen>
    with SingleTickerProviderStateMixin {
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
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(70, 40, 0, 0),
                    child: Image.asset(
                      'assets/flutterlogo.png',
                      // height: 60,
                      width: 60,
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    child: Container(
                      color: Colors.white,
                      // height: 50,
                      // width: 10,

                      margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                      child: TabBar(
                          controller: _tabController,
                          isScrollable: false,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          indicatorColor: Colors.lightBlueAccent,
                          labelColor: Colors.black,
                          tabs: [
                            const Tab(
                              text: 'Home',
                            ),
                            const Tab(text: 'Portfolio'),
                            const Tab(text: 'Projects'),
                          ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Marquee(
                    text:
                        'Flutter is Google’s free and open-source UI framework for creating native mobile applications. Released in 2017, Flutter allows developers to build mobile applications for both iOS and Android with a single codebase and programming language. This capability makes building iOS and Android apps simpler and faster.',
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/flutter-engage.png',
                                      fit: BoxFit.cover,
                                      height: 560,
                                      // width: MediaQuery.of(context).size.width,
                                    ),
                                    Image.asset(
                                      'assets/flutter-engage.png',
                                      fit: BoxFit.cover,
                                      height: 560,
                                      // width: MediaQuery.of(context).size.width,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 40,
                                    width: 150,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.lightBlue),
                                    child: const Center(
                                        child: const Text(
                                      'Fast',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                                Container(
                                    height: 40,
                                    width: 150,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.lightBlue),
                                    child: const Center(
                                        child: Text(
                                      'Fast',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                                const SizedBox(width: 40),
                                Container(
                                    height: 40,
                                    width: 150,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.lightBlue),
                                    child: const Center(
                                        child: const Text(
                                      'Fast',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                                const Spacer(),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Lottie.network(
                                    'https://assets1.lottiefiles.com/packages/lf20_w7401juf.json',
                                    height: 500.0,
                                    repeat: true,
                                    reverse: true,
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Lottie.network(
                                'https://assets4.lottiefiles.com/packages/lf20_rfDuEU.json',
                                height: 600.0,
                                repeat: true,
                                reverse: true,
                                animate: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.directions_bike),
                      const Icon(Icons.movie),
                    ],
                  ),
                ),
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
