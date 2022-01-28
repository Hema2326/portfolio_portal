import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class M2PproductScreen extends StatefulWidget {
  const M2PproductScreen({Key? key}) : super(key: key);

  @override
  _M2PproductScreenState createState() => _M2PproductScreenState();
}

class _M2PproductScreenState extends State<M2PproductScreen> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  TextEditingController emailController = TextEditingController();

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
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 4);
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
  List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 40.0,
    fontFamily: 'SF',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'We',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Enable',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Fintech',
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: Image.asset(
                      'assets/camera.png',
                      height: 300,
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(left: 60),
            //   // width: MediaQuery.of(context).size.width,
            //   color: Colors.pink,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       CarouselSlider(
            //         items: [
            //           Container(
            //             margin: EdgeInsets.only(top: 20),
            //             padding: EdgeInsets.all(20),
            //             height: 50,
            //             width: 150,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(16),
            //                 color: Colors.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     blurRadius: 6,
            //                     offset: Offset(1, 2),
            //                   )
            //                 ]),
            //             child: Text(
            //               'Prepaid Card',
            //               style: TextStyle(
            //                 fontSize: 60,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.only(top: 20, bottom: 30),
            //             padding: EdgeInsets.all(20),
            //             height: 150,
            //             width: 150,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(16),
            //                 color: Colors.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     blurRadius: 6,
            //                     offset: Offset(1, 2),
            //                   )
            //                 ]),
            //             child: Text(
            //               'Neo Banking',
            //               style: TextStyle(
            //                 fontSize: 60,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.only(top: 20, bottom: 30),
            //             padding: EdgeInsets.all(20),
            //             height: 150,
            //             width: 150,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(16),
            //                 color: Colors.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     blurRadius: 6,
            //                     offset: Offset(1, 2),
            //                   )
            //                 ]),
            //             child: Text(
            //               'Neo Banking',
            //               style: TextStyle(
            //                 fontSize: 60,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.only(top: 20, bottom: 30),
            //             padding: EdgeInsets.all(20),
            //             height: 150,
            //             width: 150,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(16),
            //                 color: Colors.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     blurRadius: 6,
            //                     offset: Offset(1, 2),
            //                   )
            //                 ]),
            //             child: Text(
            //               'Neo Banking',
            //               style: TextStyle(
            //                 fontSize: 60,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.only(top: 20, left: 20),
            //             padding: EdgeInsets.all(20),
            //             height: 100,
            //             width: 150,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(16),
            //                 color: Colors.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     blurRadius: 6,
            //                     offset: Offset(1, 2),
            //                   )
            //                 ]),
            //             child: Text(
            //               'Credit Card',
            //               style: TextStyle(
            //                 fontSize: 60,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //         ],
            //         options: CarouselOptions(
            //           autoPlayCurve: Curves.fastOutSlowIn,
            //           disableCenter: true,
            //           enlargeCenterPage: true,
            //           aspectRatio: 1,
            //           autoPlay: true,
            //           viewportFraction: 1,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(top:40,left:35),
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'API Docs',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Build your Fintech Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 30),
                      Text(
                        'Check out our API docs to jump-start your product journey.',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          const url =
                              "https://docs.yappay.in/singledocs#error_msg";
                          await launch(url);
                        },
                        child: Row(
                          children: [
                            Text('Explore'),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward_rounded),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30.0),
                                side: const BorderSide(
                                    color: Colors.white)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                  Image.asset('assets/docs.png',
                    height: 240,
                  ),
                ],
              ),
            ),
            Container(
                child:Text('')
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
                        children: [
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://careers.google.com/jobs/results/?distance=50&hl=en_US&jlo=en_US&q=flutter";
                              await launch(url);
                            },
                            child: const Text(
                              'Careers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url = "https://medium.com/flutter";
                              await launch(url);
                            },
                            child: const Text(
                              'News',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url = "https://flutter.dev/brand";
                              await launch(url);
                            },
                            child: const Text(
                              'Brand',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url = "https://flutter.dev/culture";
                              await launch(url);
                            },
                            child: const Text(
                              'Culture',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://flutter.dev/multi-platform/mobile";
                              await launch(url);
                            },
                            child: const Text(
                              'Mobile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://flutter.dev/multi-platform/web";
                              await launch(url);
                            },
                            child: const Text(
                              'Web',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://flutter.dev/multi-platform/desktop";
                              await launch(url);
                            },
                            child: const Text(
                              'Desktop',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://flutter.dev/multi-platform/embedded";
                              await launch(url);
                            },
                            child: const Text(
                              'Embedded',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Column(
                        children: [
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.medium,
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url =
                                    "https://medium.com/flutter";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.meetup,
                                  color: isSelected2
                                      ? Colors.red[700]
                                      : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url =
                                    "https://www.meetup.com/pro/flutter/";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected2 = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.github,
                                  color: isSelected1
                                      ? Colors.black
                                      : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url =
                                    "https://github.com/flutter";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected1 = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.twitter,
                                  color: isSelected3
                                      ? Colors.blue[400]
                                      : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url =
                                    "https://twitter.com/flutterdev";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected3 = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.youtube,
                                  color: isSelected4
                                      ? Colors.red
                                      : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url =
                                    "https://www.youtube.com/flutterdev";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected4 = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 70,
                  child: RotationTransition(
                    turns: _arrowAnimation,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
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

