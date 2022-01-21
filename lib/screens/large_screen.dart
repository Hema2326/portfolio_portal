import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen>
    with TickerProviderStateMixin {
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
  bool isSelected4 = false;

  TabController? _tabController;

  late AnimationController _controller;

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.bounceIn,
  );

  late final AnimationController arrow = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _arrowAnimation =
      CurvedAnimation(parent: arrow, curve: Curves.easeInCubic);

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 3);
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -3,
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    controller.dispose();
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
              Container(
                margin: const EdgeInsets.fromLTRB(70, 40, 0, 0),
                child: Image.asset(
                  'assets/flutterlogo.png',
                  // height: 60,
                  width: 60,
                ),
              ),
            ],
          ),
        ),
        body: Column(children: [
          Row(
            children: [
              Text(''),
              Spacer(),
              Flexible(
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
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
            child: TabBarView(controller: _tabController, children: [
              SingleChildScrollView(
                  child: Stack(children: [
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
              ])),
              const Icon(Icons.directions_bike),
              const Icon(Icons.movie),
            ]),
          ),

          // //     Row(
          // //       children: [
          // //         Container(
          // //             height: 40,
          // //             width: 150,
          // //             padding: const EdgeInsets.all(10),
          // //             decoration: BoxDecoration(
          // //                 borderRadius: BorderRadius.circular(15),
          // //                 color: Colors.lightBlue),
          // //             child: const Center(
          // //                 child: const Text(
          // //                   'Fast',
          // //                   style: TextStyle(color: Colors.white),
          // //                 ))),
          // //         Container(
          // //             height: 40,
          // //             width: 150,
          // //             padding: const EdgeInsets.all(10),
          // //             decoration: BoxDecoration(
          // //                 borderRadius: BorderRadius.circular(15),
          // //                 color: Colors.lightBlue),
          // //             child: const Center(
          // //                 child: Text(
          // //                   'Fast',
          // //                   style: TextStyle(color: Colors.white),
          // //                 ))),
          // //         const SizedBox(width: 40),
          // //         Container(
          // //             height: 40,
          // //             width: 150,
          // //             padding: const EdgeInsets.all(10),
          // //             decoration: BoxDecoration(
          // //                 borderRadius: BorderRadius.circular(15),
          // //                 color: Colors.lightBlue),
          // //             child: const Center(
          // //                 child: const Text(
          // //                   'Fast',
          // //                   style: TextStyle(color: Colors.white),
          // //                 ))),
          // //         const Spacer(),
          // //         Container(
          // //           color: Colors.white,
          // //           padding: const EdgeInsets.only(bottom: 20),
          // //           child: Lottie.network(
          // //             'https://assets1.lottiefiles.com/packages/lf20_w7401juf.json',
          // //             height: 500.0,
          // //             repeat: true,
          // //             reverse: true,
          // //             animate: true,
          // //           ),
          // //         ),
          // //
          // //     Container(
          // //       width: MediaQuery.of(context).size.width,
          // //       color: Colors.white,
          // //       padding: const EdgeInsets.only(bottom: 20),
          // //       child: Lottie.network(
          // //         'https://assets4.lottiefiles.com/packages/lf20_rfDuEU.json',
          // //         height: 600.0,
          // //         repeat: true,
          // //         reverse: true,
          // //         animate: true,
          // //       ),
          // //     ),]),
          // //     const Icon(Icons.directions_bike),
          // //     // const Icon(Icons.movie),
          // //         ],
          // //       ),
          // //     ),
          // //   ],
          // // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(height: 100),
          //   ],
          // ),
          // Stack(
          //   children: [
          //     AnimatedBuilder(
          //         animation: _controller,
          //         builder: (BuildContext context, Widget? child) {
          //           return ClipPath(
          //               clipper: DrawClip(_controller.value),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Container(
          //                     height: 270,
          //                     width: double.maxFinite,
          //                     decoration: BoxDecoration(
          //                       gradient: LinearGradient(
          //                           begin: Alignment.bottomLeft,
          //                           end: Alignment.topRight,
          //                           colors: [
          //                             Colors.blue.shade600,
          //                             Colors.blueAccent.shade100
          //                           ]),
          //                     )),
          //               ));
          //         }),
          //     Padding(
          //       padding: const EdgeInsets.only(top: 20.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: <Widget>[
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               GestureDetector(
          //                 onTap: () async {
          //                   const url =
          //                       "https://careers.google.com/jobs/results/?distance=50&hl=en_US&jlo=en_US&q=flutter";
          //                   await launch(url);
          //                 },
          //                 child: const Text(
          //                   'Careers',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //               GestureDetector(
          //                 onTap: () async {
          //                   const url = "https://medium.com/flutter";
          //                   await launch(url);
          //                 },
          //                 child: const Text(
          //                   'News',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //               GestureDetector(
          //                 onTap: () async {
          //                   const url = "https://flutter.dev/brand";
          //                   await launch(url);
          //                 },
          //                 child: const Text(
          //                   'Brand',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //               GestureDetector(
          //                 onTap: () async {
          //                   const url = "https://flutter.dev/culture";
          //                   await launch(url);
          //                 },
          //                 child: const Text(
          //                   'Culture',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //             ],
          //           ),
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               GestureDetector(
          //                 onTap: () async {
          //                   const url =
          //                       "https://flutter.dev/multi-platform/mobile";
          //                   await launch(url);
          //                 },
          //                 child: const Text(
          //                   'Mobile',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //               GestureDetector(
          //                 onTap: () async {
          //                   const url =
          //                       "https://flutter.dev/multi-platform/web";
          //                   await launch(url);
          //                 },
          //                 child: const Text(
          //                   'Web',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //               GestureDetector(
          //                 onTap: () async {
          //                   const url =
          //                       "https://flutter.dev/multi-platform/desktop";
          //                   await launch(url);
          //                 },
          //                 child: const Text(
          //                   'Desktop',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //               GestureDetector(
          //                 onTap: () async {
          //                   const url =
          //                       "https://flutter.dev/multi-platform/embedded";
          //                   await launch(url);
          //                 },
          //                 child: const Text(
          //                   'Embedded',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               RotationTransition(
          //                 turns: _animation,
          //                 child: InkWell(
          //                   child: FaIcon(FontAwesomeIcons.medium,
          //                       color:
          //                           isSelected ? Colors.black : Colors.white,
          //                       size: 25.0),
          //                   onTap: () async {
          //                     const url = "https://medium.com/flutter";
          //                     await launch(url);
          //                   },
          //                   onHover: (value) {
          //                     setState(() {
          //                       isSelected = value;
          //                     });
          //                   },
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               RotationTransition(
          //                 turns: _animation,
          //                 child: InkWell(
          //                   child: FaIcon(FontAwesomeIcons.meetup,
          //                       color: isSelected2
          //                           ? Colors.red[700]
          //                           : Colors.white,
          //                       size: 25.0),
          //                   onTap: () async {
          //                     const url =
          //                         "https://www.meetup.com/pro/flutter/";
          //                     await launch(url);
          //                   },
          //                   onHover: (value) {
          //                     setState(() {
          //                       isSelected2 = value;
          //                     });
          //                   },
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               RotationTransition(
          //                 turns: _animation,
          //                 child: InkWell(
          //                   child: FaIcon(FontAwesomeIcons.github,
          //                       color:
          //                           isSelected1 ? Colors.black : Colors.white,
          //                       size: 25.0),
          //                   onTap: () async {
          //                     const url = "https://github.com/flutter";
          //                     await launch(url);
          //                   },
          //                   onHover: (value) {
          //                     setState(() {
          //                       isSelected1 = value;
          //                     });
          //                   },
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               RotationTransition(
          //                 turns: _animation,
          //                 child: InkWell(
          //                   child: FaIcon(FontAwesomeIcons.twitter,
          //                       color: isSelected3
          //                           ? Colors.blue[400]
          //                           : Colors.white,
          //                       size: 25.0),
          //                   onTap: () async {
          //                     const url = "https://twitter.com/flutterdev";
          //                     await launch(url);
          //                   },
          //                   onHover: (value) {
          //                     setState(() {
          //                       isSelected3 = value;
          //                     });
          //                   },
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               RotationTransition(
          //                 turns: _animation,
          //                 child: InkWell(
          //                   child: FaIcon(FontAwesomeIcons.youtube,
          //                       color:
          //                           isSelected4 ? Colors.red : Colors.white,
          //                       size: 25.0),
          //                   onTap: () async {
          //                     const url =
          //                         "https://www.youtube.com/flutterdev";
          //                     await launch(url);
          //                   },
          //                   onHover: (value) {
          //                     setState(() {
          //                       isSelected4 = value;
          //                     });
          //                   },
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //     Positioned(
          //       right: 30,
          //       bottom: 70,
          //       child: RotationTransition(
          //         turns: _arrowAnimation,
          //         child: InkWell(
          //           child: const Icon(
          //             Icons.arrow_circle_up,
          //             color: Colors.white,
          //           ),
          //           onTap: () {
          //             _scrollToTop();
          //           },
          //         ),
          //       ),
          //     ),
          //   ],
          // )
        ]));
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
