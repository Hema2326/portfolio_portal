import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/utils/custom_text.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/utils/string_resource.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

import 'package:video_player/video_player.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

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

  @override
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
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _fadeInFadeOut = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);
    // _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(70, 40, 0, 0),
                child: Image.asset(
                  ImageResource.flutterlogo,
                  // 'assets/flutterlogo.png',
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
              const Spacer(),
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
                        const Tab(text: 'M2P Products'),
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
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              SingleChildScrollView(
                  child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 3.0,
                    child: Image.asset(
                      ImageResource.flutterengage,
                      fit: BoxFit.fill,
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 700,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: CarouselSlider(
                          items: [
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 30, right: 10),
                                        height: 180,
                                        width: 800,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Colors.blueAccent.shade100,
                                                Colors.blueAccent,
                                              ],
                                            )),
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 40, bottom: 20),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 15),
                                                  CustomText(
                                                      StringResource.dart,
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              textStyle:
                                                                  const TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))),
                                                  const SizedBox(height: 15),
                                                  CustomText(
                                                    StringResource.dart1,
                                                    style: GoogleFonts.aBeeZee(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          const url =
                                                              "https://dart.dev";
                                                          await launch(url);
                                                        },
                                                        child: CustomText(
                                                          StringResource
                                                              .dartdev,
                                                          style: GoogleFonts
                                                              .aBeeZee(
                                                            textStyle:
                                                                const TextStyle(
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton.styleFrom(
                                                            primary: ColorResource
                                                                .colorFFFFFF,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                                side: const BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            padding: const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 30,
                                                                vertical: 20),
                                                            textStyle: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      InkWell(
                                                        onTap: () async {
                                                          const url =
                                                              "https://pub.dev";
                                                          await launch(url);
                                                        },
                                                        child: Row(
                                                          children: [
                                                            CustomText(
                                                              StringResource
                                                                  .getpackages,
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                textStyle:
                                                                    const TextStyle(
                                                                  color: ColorResource
                                                                      .colorFFFFFF,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              color: ColorResource
                                                                  .colorFFFFFF,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    color: Colors.white,
                                    // padding: const EdgeInsets.only(bottom: 20),
                                    child: Lottie.network(
                                      'https://assets1.lottiefiles.com/packages/lf20_w7401juf.json',
                                      height: 500.0,
                                      width: 600,
                                      repeat: true,
                                      reverse: true,
                                      animate: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 30, right: 10),
                                        height: 180,
                                        width: 800,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Colors.redAccent.shade100,
                                                Colors.blueAccent,
                                              ],
                                            )),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 40, bottom: 20),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 15),
                                                  Text('Get Started',
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                              textStyle:
                                                                  TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    'Instant access to the power of the Flutter framework',
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                      textStyle: TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 16),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          const url =
                                                              "https://docs.flutter.dev/get-started/install";
                                                          await launch(url);
                                                        },
                                                        child: Text(
                                                          'Install',
                                                          style: GoogleFonts
                                                              .sourceSansPro(
                                                            textStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton.styleFrom(
                                                            primary:
                                                                ColorResource
                                                                    .colorFFFFFF,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        20),
                                                            textStyle: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      SizedBox(width: 10),
                                                      InkWell(
                                                        onTap: () async {
                                                          const url =
                                                              "https://docs.flutter.dev";
                                                          await launch(url);
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'See the Documentation',
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: ColorResource
                                                                      .colorFFFFFF,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              color: ColorResource
                                                                  .colorFFFFFF,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    color: Colors.white,
                                    // padding: const EdgeInsets.only(bottom: 20),
                                    child: Lottie.network(
                                      'https://assets3.lottiefiles.com/packages/lf20_awhygdgw.json',
                                      height: 500.0,
                                      width: 600,
                                      repeat: true,
                                      reverse: true,
                                      animate: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 40, right: 10),
                                        height: 180,
                                        width: 800,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Colors.blueAccent.shade100,
                                                Colors.blueAccent,
                                              ],
                                            )),
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 40, bottom: 20),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 15),
                                                  CustomText(
                                                      StringResource.dart,
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              textStyle:
                                                                  const TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))),
                                                  const SizedBox(height: 15),
                                                  CustomText(
                                                    StringResource.dart1,
                                                    style: GoogleFonts.aBeeZee(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          const url =
                                                              "https://dart.dev";
                                                          await launch(url);
                                                        },
                                                        child: CustomText(
                                                          StringResource
                                                              .dartdev,
                                                          style: GoogleFonts
                                                              .aBeeZee(
                                                            textStyle:
                                                                const TextStyle(
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton.styleFrom(
                                                            primary: ColorResource
                                                                .colorFFFFFF,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                                side: const BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            padding: const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 30,
                                                                vertical: 20),
                                                            textStyle: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      InkWell(
                                                        onTap: () async {
                                                          const url =
                                                              "https://pub.dev";
                                                          await launch(url);
                                                        },
                                                        child: Row(
                                                          children: [
                                                            CustomText(
                                                              StringResource
                                                                  .getpackages,
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                textStyle:
                                                                    const TextStyle(
                                                                  color: ColorResource
                                                                      .colorFFFFFF,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              color: ColorResource
                                                                  .colorFFFFFF,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    color: ColorResource.colorFFFFFF,
                                    // padding: const EdgeInsets.only(bottom: 20),
                                    child: Lottie.network(
                                      'https://assets2.lottiefiles.com/packages/lf20_lvgmrl5j.json',
                                      height: 500.0,
                                      width: 600,
                                      repeat: true,
                                      reverse: true,
                                      animate: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          //Slider Container properties
                          options: CarouselOptions(
                            autoPlayCurve: Curves.fastOutSlowIn,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.5,
                            autoPlay: true,
                            viewportFraction: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        color: Colors.white,
                        // padding: const EdgeInsets.only(bottom: 20),
                        child: Lottie.network(
                          'https://assets4.lottiefiles.com/packages/lf20_WjWoQM.json',
                          height: 400.0,
                          width: 500,
                          repeat: true,
                          reverse: true,
                          animate: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 10),
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.redAccent.shade100,
                                Colors.blueAccent,
                              ],
                            )),
                        child: Container(
                          margin: EdgeInsets.only(left: 20, bottom: 20),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  Text('Get Started',
                                      style: GoogleFonts.sourceSansPro(
                                          textStyle: TextStyle(
                                        color: ColorResource.colorFFFFFF,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ))),
                                  SizedBox(height: 15),
                                  Text(
                                    'Instant access to the power of the Flutter framework',
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: TextStyle(
                                        color: ColorResource.colorFFFFFF,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          const url =
                                              "https://docs.flutter.dev/get-started/install";
                                          await launch(url);
                                        },
                                        child: Text(
                                          'Install',
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: ColorResource.colorFFFFFF,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                side: BorderSide(
                                                    color: Colors.white)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 20),
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(width: 10),
                                      InkWell(
                                        onTap: () async {
                                          const url =
                                              "https://docs.flutter.dev";
                                          await launch(url);
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'See the Documentation',
                                              style: GoogleFonts.aBeeZee(
                                                textStyle: TextStyle(
                                                  color:
                                                      ColorResource.colorFFFFFF,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: ColorResource.colorFFFFFF,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 30),
                            child: Text(
                              'Join our News Letter Keep up with the latest Flutter news, releases, and more',
                              style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    color: ColorResource.color222222,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Container(
                        height: 100,
                        width: 300,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            labelText: 'E-mail',
                            prefixIcon: Icon(Icons.mail_outline),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          onPressed: () async {
                            const url =
                                "https://docs.flutter.dev/get-started/install";
                            await launch(url);
                          },
                          child: Text(
                            'Subcribe',
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: Colors.blueAccent)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(left: 10, right: 10),
                  //   height: 180,
                  //   width: 1000,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       gradient: LinearGradient(
                  //         begin: Alignment.topRight,
                  //         end: Alignment.bottomLeft,
                  //         colors: [
                  //           Colors.blueAccent.shade100,
                  //           Colors.blueAccent,
                  //         ],
                  //       )),
                  //   child: Container(
                  //     margin: const EdgeInsets.only(left: 40, bottom: 20),
                  //     child: Row(
                  //       children: [
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             const SizedBox(height: 15),
                  //             CustomText(StringResource.dart,
                  //                 style: GoogleFonts.aBeeZee(
                  //                     textStyle: const TextStyle(
                  //                   color: ColorResource.colorFFFFFF,
                  //                   fontSize: 28,
                  //                   fontWeight: FontWeight.bold,
                  //                 ))),
                  //             const SizedBox(height: 15),
                  //             CustomText(
                  //               StringResource.dart1,
                  //               style: GoogleFonts.aBeeZee(
                  //                 textStyle: const TextStyle(
                  //                   color: ColorResource.colorFFFFFF,
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.normal,
                  //                 ),
                  //               ),
                  //             ),
                  //             const SizedBox(height: 16),
                  //             Row(
                  //               children: [
                  //                 ElevatedButton(
                  //                   onPressed: () async {
                  //                     const url = "https://dart.dev";
                  //                     await launch(url);
                  //                   },
                  //                   child: CustomText(
                  //                     StringResource.dartdev,
                  //                     style: GoogleFonts.aBeeZee(
                  //                       textStyle: const TextStyle(
                  //                         color: Colors.lightBlueAccent,
                  //                         fontWeight: FontWeight.normal,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   style: ElevatedButton.styleFrom(
                  //                       primary: ColorResource.colorFFFFFF,
                  //                       shape: RoundedRectangleBorder(
                  //                           borderRadius:
                  //                               BorderRadius.circular(30.0),
                  //                           side: const BorderSide(
                  //                               color: Colors.white)),
                  //                       padding: const EdgeInsets.symmetric(
                  //                           horizontal: 30, vertical: 20),
                  //                       textStyle: const TextStyle(
                  //                           fontSize: 20,
                  //                           fontWeight: FontWeight.bold)),
                  //                 ),
                  //                 const SizedBox(width: 10),
                  //                 InkWell(
                  //                   onTap: () async {
                  //                     const url = "https://pub.dev";
                  //                     await launch(url);
                  //                   },
                  //                   child: Row(
                  //                     children: [
                  //                       CustomText(
                  //                         StringResource.getpackages,
                  //                         style: GoogleFonts.aBeeZee(
                  //                           textStyle: const TextStyle(
                  //                             color: ColorResource.colorFFFFFF,
                  //                             fontWeight: FontWeight.bold,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       const Icon(
                  //                         Icons.arrow_forward,
                  //                         color: ColorResource.colorFFFFFF,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
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
                                      const url = "https://medium.com/flutter";
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
                                      const url = "https://github.com/flutter";
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
              )),
              const Icon(Icons.directions_bike),
              const Icon(Icons.movie),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 95),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'We',
                                style: TextStyle(
                                  fontSize: 55,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AnimatedTextKit(
                                isRepeatingAnimation: true,
                                animatedTexts: [
                                  ScaleAnimatedText(
                                    'Enable',
                                    textStyle: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ScaleAnimatedText('Embed',
                                    textStyle: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                              // Text(
                              //   'Enable',
                              //   style: TextStyle(
                              //     fontSize: 70,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              Text(
                                'Fintech',
                                style: TextStyle(
                                  fontSize: 90,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            child: Image.asset(
                              'assets/camera.png',
                              height: 800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 35),
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
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Build your Fintech Product',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Check out our API docs to jump-start your product journey.',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(height: 60),
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
                          Spacer(),
                          Image.asset('assets/docs.png'),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text('OUR VALUES',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                    Image.asset(
                      'assets/value.png',
                      height: 700,
                      width: 1050,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 30, top: 10),
                      color: Colors.orangeAccent,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text('M2P PRODUCTS',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          Wrap(
                            children: [
                              InkWell(
                                onTap: () async {
                                  const url =
                                      "https://m2pfintech.com/card-issuing-platform/";
                                  await launch(url);
                                },
                                child: FadeTransition(
                                  opacity: _fadeInFadeOut,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Text('Card Issuance'),
                                  ),
                                ),
                              ),
                              SizedBox(width: 50),
                              InkWell(
                                onTap: () async {
                                  const url =
                                      "https://m2pfintech.com/issue-credit-cards/";
                                  await launch(url);
                                },
                                child: FadeTransition(
                                  opacity: _fadeInFadeOut,
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Text('Credit Card')),
                                ),
                              ),
                              SizedBox(width: 50),
                              InkWell(
                                onTap: () async {
                                  const url =
                                      "https://m2pfintech.com/neobanking-platform/";
                                  await launch(url);
                                },
                                child: FadeTransition(
                                  opacity: _fadeInFadeOut,
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Text('Neo Banking')),
                                ),
                              ),
                              SizedBox(width: 50),
                              InkWell(
                                onTap: () async {
                                  const url =
                                      "https://m2pfintech.com/fleet-drive/";
                                  await launch(url);
                                },
                                child: FadeTransition(
                                  opacity: _fadeInFadeOut,
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Text('Fleet Drive')),
                                ),
                              ),
                              SizedBox(width: 50),
                              InkWell(
                                onTap: () async {
                                  const url =
                                      "https://m2pfintech.com/buy-now-pay-later/";
                                  await launch(url);
                                },
                                child: FadeTransition(
                                  opacity: _fadeInFadeOut,
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Text('Buy Now Pay later')),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/fintech.png'),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'CONTACT US',
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 40),
                              Text(
                                'Redefine Innovation With Us',
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal)),
                              ),
                              SizedBox(height: 40),
                              Container(
                                width: 700,
                                child: Text(
                                  'M2P experts with proven experience in fintech businesses and banking help you co-create products, access reputed bank networks and offer mentorship support.',
                                  maxLines: 2,
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              SizedBox(height: 50),
                              ElevatedButton(
                                onPressed: () async {
                                  const url =
                                      "https://m2pfintech.com/contact-us/";
                                  await launch(url);
                                },
                                child: Row(
                                  children: [
                                    Text('Contact us'),
                                    SizedBox(width: 10),
                                    Icon(Icons.arrow_forward_rounded),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent,
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
                        ),
                      ],
                    )),
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
            ]),
          ),
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
