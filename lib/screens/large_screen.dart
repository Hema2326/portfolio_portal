import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
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
import '../widgets/contact_widget.dart';

import 'package:video_player/video_player.dart';

import '../models.dart/models.dart';
import '../widgets/draw_clip.dart';
import '../widgets/flip_widget.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen>
    with TickerProviderStateMixin {
  bool _showBackToTopButton = false;
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
    // _scrollController = ScrollController();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
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
      duration: const Duration(seconds: 3),
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

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 3), curve: Curves.linear);
  }

  // _scrollToTop() {
  //   _scrollController.animateTo(_scrollController.position.minScrollExtent,
  //       duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
  // }

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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                CustomText(StringResource.dart,
                                                    style: GoogleFonts.aBeeZee(
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
                                                    textStyle: const TextStyle(
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
                                                        StringResource.dartdev,
                                                        style:
                                                            GoogleFonts.aBeeZee(
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
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      30,
                                                                  vertical: 20),
                                                          textStyle:
                                                              const TextStyle(
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
                                                            Icons.arrow_forward,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              Colors.redAccent.shade100,
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
                                                Text('Get Started',
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                            textStyle:
                                                                const TextStyle(
                                                      color: ColorResource
                                                          .colorFFFFFF,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ))),
                                                const SizedBox(height: 15),
                                                Text(
                                                  'Instant access to the power of the Flutter framework',
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: const TextStyle(
                                                      color: ColorResource
                                                          .colorFFFFFF,
                                                      fontSize: 20,
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
                                                            "https://docs.flutter.dev/get-started/install";
                                                        await launch(url);
                                                      },
                                                      child: Text(
                                                        'Install',
                                                        style: GoogleFonts
                                                            .sourceSansPro(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Colors
                                                                .lightBlueAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      30,
                                                                  vertical: 20),
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                    ),
                                                    const SizedBox(width: 10),
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
                                                            Icons.arrow_forward,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                CustomText(StringResource.dart,
                                                    style: GoogleFonts.aBeeZee(
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
                                                    textStyle: const TextStyle(
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
                                                        StringResource.dartdev,
                                                        style:
                                                            GoogleFonts.aBeeZee(
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
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      30,
                                                                  vertical: 20),
                                                          textStyle:
                                                              const TextStyle(
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
                                                            Icons.arrow_forward,
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
                      margin: const EdgeInsets.only(top: 15),
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
                      margin: const EdgeInsets.only(left: 20, right: 10),
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
                        margin: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                Text('Get Started',
                                    style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                      color: ColorResource.colorFFFFFF,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ))),
                                const SizedBox(height: 15),
                                Text(
                                  'Instant access to the power of the Flutter framework',
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: ColorResource.colorFFFFFF,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
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
                                          textStyle: const TextStyle(
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
                                              side: const BorderSide(
                                                  color: Colors.white)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 20),
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () async {
                                        const url = "https://docs.flutter.dev";
                                        await launch(url);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'See the Documentation',
                                            style: GoogleFonts.aBeeZee(
                                              textStyle: const TextStyle(
                                                color:
                                                    ColorResource.colorFFFFFF,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const Icon(
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
                          margin: const EdgeInsets.only(left: 20, top: 30),
                          child: Text(
                            'Join our News Letter Keep up with the latest Flutter news, releases, and more',
                            style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                  color: ColorResource.color222222,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 100,
                      width: 300,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          labelText: 'E-mail',
                          prefixIcon: const Icon(Icons.mail_outline),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          const url =
                              "https://docs.flutter.dev/get-started/install";
                          await launch(url);
                        },
                        child: Text(
                          'Subcribe',
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side:
                                    const BorderSide(color: Colors.blueAccent)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
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
                          // onTap: () {
                          //   _scrollToTop();
                          // },
                          onTap: _scrollToTop,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
            const PortfolioScreen(),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: CustomText(
                  StringResource.flutterprojects,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.pink[400],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  StringResource.icici,
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 50,
                                    color: ColorResource.colorFFFFFF,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                                Image.asset(
                                  ImageResource.pockets,
                                  width: 300,
                                  height: 300,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  'Description',
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: ColorResource.colorFFFFFF,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 1000,
                                  height: 100,
                                  child: CustomText(
                                    'It’s a VISA-powered e-wallet that customer of any bank can use to recharge mobile, send money, shop anywhere, pay bills and much more.',
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                        fontSize: 25,
                                        // fontWeight: FontWeight.bold,
                                        color: ColorResource.colorFFFFFF,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1000,
                                  height: 100,
                                  child: CustomText(
                                    'Pockets wallet also comes with a physical shopping card which can be used to shop on any website or retail stores.',
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                        fontSize: 25,
                                        // fontWeight: FontWeight.bold,
                                        color: ColorResource.colorFFFFFF,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  'Fund Transfer',
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      color: ColorResource.colorFFFFFF,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  'Making NFC Payments',
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      color: ColorResource.colorFFFFFF,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  'Recharges',
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      color: ColorResource.colorFFFFFF,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  'Benefits of Physical Card',
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      color: ColorResource.colorFFFFFF,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  'Pay Utility Bills',
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      color: ColorResource.colorFFFFFF,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  'Shopping',
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      color: ColorResource.colorFFFFFF,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            ImageResource.icici2,
                            width: 700,
                            height: 700,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    color: ColorResource.colorFFFFFF,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  StringResource.visa,
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 50,
                                    color: ColorResource.color222222,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 1000,
                                  child: CustomText(
                                    'Visa Digital Solutions equip you with the tools you need to create, manage and accept secure digital payments in-store, online or in-app.',
                                    style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                      fontSize: 25,
                                      color: ColorResource.color222222,
                                      fontWeight: FontWeight.w100,
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  'Digital',
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: ColorResource.color222222,
                                    fontWeight: FontWeight.w100,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  'Travel',
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: ColorResource.color222222,
                                    fontWeight: FontWeight.w100,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  'Money',
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: ColorResource.color222222,
                                    fontWeight: FontWeight.w100,
                                  )),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 80),
                            child: Image.asset(
                              ImageResource.visa,
                              width: 300,
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  StringResource.generic,
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 50,
                                    color: ColorResource.colorFFFFFF,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                CustomText(
                                  'Instead of packages we can make use of it.',
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 40,
                                    color: ColorResource.colorFFFFFF,
                                    fontWeight: FontWeight.w100,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  'Currency Converter',
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: ColorResource.colorFFFFFF,
                                    fontWeight: FontWeight.w100,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  'Google Maps',
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: ColorResource.colorFFFFFF,
                                    fontWeight: FontWeight.w100,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  'Otp View and Returning User',
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: ColorResource.colorFFFFFF,
                                    fontWeight: FontWeight.w100,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  'International phone field and country code',
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: ColorResource.colorFFFFFF,
                                    fontWeight: FontWeight.w100,
                                  )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 80),
                            child: Image.asset(
                              ImageResource.genericcomponenets,
                              width: 300,
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              )),
            ]),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 95),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
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
                                  textStyle: const TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ScaleAnimatedText(
                                  'Embed',
                                  textStyle: const TextStyle(
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
                            const Text(
                              'Fintech',
                              style: TextStyle(
                                fontSize: 90,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                    padding: const EdgeInsets.only(top: 40, left: 35),
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'API Docs',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Build your Fintech Product',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Check out our API docs to jump-start your product journey.',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 60),
                            ElevatedButton(
                              onPressed: () async {
                                const url =
                                    "https://docs.yappay.in/singledocs#error_msg";
                                await launch(url);
                              },
                              child: Row(
                                children: [
                                  const Text('Explore'),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_forward_rounded),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey.withOpacity(0.6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
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
                        const Spacer(),
                        Image.asset('assets/docs.png'),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text('OUR VALUES',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                  Image.asset(
                    'assets/value.png',
                    height: 700,
                    width: 1050,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 30, top: 10),
                    color: Colors.orangeAccent,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: const Text('M2P PRODUCTS',
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
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: const Text('Card Issuance'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 50),
                            InkWell(
                              onTap: () async {
                                const url =
                                    "https://m2pfintech.com/issue-credit-cards/";
                                await launch(url);
                              },
                              child: FadeTransition(
                                opacity: _fadeInFadeOut,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: const Text('Credit Card')),
                              ),
                            ),
                            const SizedBox(width: 50),
                            InkWell(
                              onTap: () async {
                                const url =
                                    "https://m2pfintech.com/neobanking-platform/";
                                await launch(url);
                              },
                              child: FadeTransition(
                                opacity: _fadeInFadeOut,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: const Text('Neo Banking')),
                              ),
                            ),
                            const SizedBox(width: 50),
                            InkWell(
                              onTap: () async {
                                const url =
                                    "https://m2pfintech.com/fleet-drive/";
                                await launch(url);
                              },
                              child: FadeTransition(
                                opacity: _fadeInFadeOut,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: const Text('Fleet Drive')),
                              ),
                            ),
                            const SizedBox(width: 50),
                            InkWell(
                              onTap: () async {
                                const url =
                                    "https://m2pfintech.com/buy-now-pay-later/";
                                await launch(url);
                              },
                              child: FadeTransition(
                                opacity: _fadeInFadeOut,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: const Text('Buy Now Pay later')),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/fintech.png'),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'CONTACT US',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 40),
                            Text(
                              'Redefine Innovation With Us',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(height: 40),
                            Container(
                              width: 700,
                              child: Text(
                                'M2P experts with proven experience in fintech businesses and banking help you co-create products, access reputed bank networks and offer mentorship support.',
                                maxLines: 2,
                                style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ),
                            const SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () async {
                                const url =
                                    "https://m2pfintech.com/contact-us/";
                                await launch(url);
                              },
                              child: Row(
                                children: [
                                  const Text('Contact us'),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_forward_rounded),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
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
              ),
            ),
          ]))
        ]));
  }
}

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late FixedExtentScrollController controller;
  static const double _itemHeight = 450;
  // static const int _itemCount = 100;

  @override
  void initState() {
    controller = FixedExtentScrollController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<PortfolioModel> digits = [
      PortfolioModel('assets/mari.png', 'Mari'),
      PortfolioModel('assets/flutter-engage.png', 'Chinnadurai'),
      PortfolioModel('assets/alexia.png', 'Alexia'),
      PortfolioModel('assets/flutter-engage.png', 'Hema'),
      PortfolioModel('assets/seema.png', 'Seema'),
      PortfolioModel('assets/nandha.png', 'Nandhakumar'),
      PortfolioModel('assets/jones.png', 'Jones'),
    ];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade600,
                Colors.blueAccent.shade100,
                Colors.pink
              ]),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              left: 50,
              top: 70,
              child: Container(
                color: Colors.black,
                child: FlipPanel.builder(
                  itemBuilder: (context, index) => Container(
                    width: 136.0,
                    height: 148.0,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '${digits[index].image}',
                            fit: BoxFit.fill,
                            height: 60,
                            width: 60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            '${digits[index].name}',
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.yellow),
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemsCount: digits.length,
                  period: const Duration(milliseconds: 1000),
                  loop: -1,
                ),
              ),
            ),
            ClickableListWheelScrollView(
              scrollController: controller,
              onItemTapCallback: (index) {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MariScreen()),
                    );
                    break;

                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChinnaduraiScreen()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AlexiaScreen()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HemaScreen()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SeemaScreen()),
                    );
                    break;
                  case 5:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NandhaScreen()),
                    );
                    break;
                  case 6:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JonesScreen()),
                    );
                    break;

                  default:
                }
              },
              itemHeight: _itemHeight,
              itemCount: digits.length,
              child: ListWheelScrollView.useDelegate(
                  itemExtent: _itemHeight,
                  diameterRatio: 1,
                  controller: controller,
                  onSelectedItemChanged: (index) {},
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: digits.length,
                      builder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {},
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 108.0),
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.asset(
                                          '${digits[index].image}',
                                          fit: BoxFit.cover,
                                        ).image,
                                      ),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 8,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        )
                                      ]),
                                  child: ClipRRect(
                                      child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.grey.withOpacity(0.1),
                                        child: Image.asset(
                                          '${digits[index].image}',
                                          height: 180,
                                          width: 180,
                                        )),
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text(
                                  '${digits[index].name}',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
            ),
          ],
          clipBehavior: Clip.hardEdge,
        ),
      ),
    );
  }
}

class MariScreen extends StatefulWidget {
  const MariScreen({Key? key}) : super(key: key);

  @override
  State<MariScreen> createState() => _MariScreenState();
}

class _MariScreenState extends State<MariScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _sizeAnimation;
  late final int seconds = 10;

  bool reverse = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: seconds))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.repeat(reverse: !reverse);
              reverse = !reverse;
            }
          });

    _sizeAnimation =
        Tween<double>(begin: 50.0, end: 100.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/mari.png",
            "Mariganesh Thangaraj",
            "Senior Software Engineer",
            "Work for money and code for love! I’m Ganesh, Software Engineer based in India.",
            "Hello, I'm an iOS / Flutter developer with 4+ years of professional experience in dynamic and deadline- driven work environments. Eager to make mobile applications to delight customers with magical experiences. In previous roles developed 7+ mobile apps that were published in App Store and Play Store.",
            [
              ExperienceModel(
                "Senior Software Engineer (Flutter)\nM2P Fintech,Chennai\n03/2021 - present",
                "1.Created Visa digital mobile application using flutter.\n2.Support the team to build generic components for upcoming flutter projects.\n3.Help the team to learn about Bloc state management and live project architecture\n4.M2P fintech web portal is my ongoing projects.",
              ),
              ExperienceModel(
                "Native IOS / Flutter Developer\nTartLabs\n09/2018 - 03/2021",
                "1.Coimbatore Tart Labs is a top-notch software design and development company bringing in transformational outcomes to all the customers across various industries.\n2.Experienced in Cross-Platform Mobile Development using Flutter based mobile app.\n3.Good understanding and usage of States and Flutter Blocs.\n4.Up to date on Apple development standards Build app for both online and Offline storage.\n5.Use SOAP and RESTful API's. Work along with Third party integrated tools.\n6.Experience with versioning tools like Git-Lab .",
              ),
              ExperienceModel(
                  "IOS Developer\nHCL Technologies Ltd\n08/2017 - 09/2018, Chennai",
                  "1.iOS application Developing & Testing.\n2.Design and build advanced app features for the iOS platform with Swift language Involvement in Software Product Life Cycle.\n3.Familiar with defect Tracking Tools & Process.\n4.Interacting with SME’s , senior management, developers, testers and across different competencies to get the task accomplished within the given deadlines. Performed technical designs and implementation of 3+ iOS apps."),
            ],
            "mariganeshthangam@gmail.com",
            "https://github.com/mariganesh555",
            "https://www.linkedin.com/in/mariganesh-t-02831b104"),
      ),
    );
  }
}

class ChinnaduraiScreen extends StatefulWidget {
  const ChinnaduraiScreen({Key? key}) : super(key: key);

  @override
  _ChinnaduraiScreenState createState() => _ChinnaduraiScreenState();
}

class _ChinnaduraiScreenState extends State<ChinnaduraiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/flutter-engage.png",
            "Chinnadurai",
            "Senior Software Engineer",
            "Work for money and code for love! I’m Ganesh, Software Engineer based in India.",
            "Hello, I'm an iOS / Flutter developer with 4+ years of professional experience in dynamic and deadline- driven work environments. Eager to make mobile applications to delight customers with magical experiences. In previous roles developed 7+ mobile apps that were published in App Store and Play Store.",
            [
              ExperienceModel(
                "Senior Software Engineer (Flutter)\nM2P Fintech,Chennai\n03/2021 - present",
                "1.Created Visa digital mobile application using flutter.\n2.Support the team to build generic components for upcoming flutter projects.\n3.Help the team to learn about Bloc state management and live project architecture\n4.M2P fintech web portal is my ongoing projects.",
              ),
              ExperienceModel(
                "Native IOS / Flutter Developer\nTartLabs\n09/2018 - 03/2021",
                "1.Coimbatore Tart Labs is a top-notch software design and development company bringing in transformational outcomes to all the customers across various industries.\n2.Experienced in Cross-Platform Mobile Development using Flutter based mobile app.\n3.Good understanding and usage of States and Flutter Blocs.\n4.Up to date on Apple development standards Build app for both online and Offline storage.\n5.Use SOAP and RESTful API's. Work along with Third party integrated tools.\n6.Experience with versioning tools like Git-Lab .",
              ),
              ExperienceModel(
                  "IOS Developer\nHCL Technologies Ltd\n08/2017 - 09/2018, Chennai",
                  "1.iOS application Developing & Testing.\n2.Design and build advanced app features for the iOS platform with Swift language Involvement in Software Product Life Cycle.\n3.Familiar with defect Tracking Tools & Process.\n4.Interacting with SME’s , senior management, developers, testers and across different competencies to get the task accomplished within the given deadlines. Performed technical designs and implementation of 3+ iOS apps."),
            ],
            "mariganeshthangam@gmail.com",
            "https://github.com/mariganesh555",
            "https://www.linkedin.com/in/mariganesh-t-02831b104"),
      ),
    );
  }
}

class AlexiaScreen extends StatefulWidget {
  const AlexiaScreen({Key? key}) : super(key: key);

  @override
  _AlexiaScreenState createState() => _AlexiaScreenState();
}

class _AlexiaScreenState extends State<AlexiaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/alexia.png",
            "Antony Ruby Alexia",
            "Software Engineer",
            "MBA graduate with 6.5+ years of total experience developed my own app and published in play store and for clients. I enjoy learning new things and developing apps",
            "Am a software developer with 2.6+ years of experience prototyping, developing & deploying over 6 Android & iOS applications using Flutter. Robust applications designed with UX in mind and backed by firebase to enhance the user experience.\n\n Few Technologies am working with\n- Flutter \n- Dart \n- Firebase",
            [
              ExperienceModel(
                "Software Engineer (Flutter)\nM2P Fintech\nApr 2021 - Present",
                "1.Created Visa digital mobile application using flutter.\n2.Payease project.\n3.Built generic components for upcoming flutter projects.\n4.Portfolio project in flutter web.\n5.ICICI Pockets is inprocess project.",
              ),
              ExperienceModel(
                  "NARINDER ALLIANCE TECHNOLOGIES LLC\nFlutter Developer\nFeb 2021 - March 2021",
                  "1.Rapid development of front-end screens for existing iOS applications developed in the past\n2.Collaborate with back-end team for data feed & authentication 3 Version control using GIT\n3.Publish & maintain existing flutter applications\n4.Responsible to port existing iOS applications over to android for single uniform code-base in accordance with Material Design standards."),
              ExperienceModel(
                  "FREELANCE ANDROID DEVELOPER\nFull-Stack Flutter Developer\nSep 2018 – Jan 2021",
                  "1.Client communication & understanding the requirements\n2.User Experience (UX) design & prototyping using Adobe XD & Figma\n3.Client review & feedback documentation\n4.Front-end development using flutter\n4.Intuitive animations & hero animations to enhance user experience\n5.Publish application to the Google play-store & Apple app-store"),
              ExperienceModel(
                  "CITICORP SERVICE INDIA PVT. LTD. (CITI BANK)\nOfficer\nDec 2015 – May 2017",
                  "1.User Acceptance Testing (UAT) of financial applications for credit-card processing & chargeback\n2.Coordinate with the development team to illustrate and explain the end-user requirements\n3.Communicateandtraintheend-usersonthenewenhancements and functionalities\n4.Update standard work documents for the end-users based on new updates"),
              ExperienceModel(
                  "QUATRRO PROCESSING SERVICES PVT. LTD.(JP MORGAN ChASE)\nSenior Fraud Analyst\nSep 2012 – Apr 2015",
                  "1.Review customer’s debit & credit card transactions for suspicion of fraud\n2.Monitor systemic flagged accounts and transactions for possible suspicious activities and resolve transaction holds\n3.Expert in financial applications such as PEGA & VROL\n4.Train 4 teams of 6 members each on the credit verification process and the PEGA & VROL applications   ")
            ],
            "alexiadeveloper91@gmail.com",
            "https://github.com/AntonyRuby",
            "https://www.linkedin.com/in/antony-ruby-alexia-a-86b0a1172"),
      ),
    );
  }
}

class HemaScreen extends StatefulWidget {
  const HemaScreen({Key? key}) : super(key: key);

  @override
  _HemaScreenState createState() => _HemaScreenState();
}

class _HemaScreenState extends State<HemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/flutter-engage.png",
            "Hemavathi",
            "Software Engineer",
            "Work for money and code for love! I’m Ganesh, Software Engineer based in India.",
            "Hello, I'm an iOS / Flutter developer with 4+ years of professional experience in dynamic and deadline- driven work environments. Eager to make mobile applications to delight customers with magical experiences. In previous roles developed 7+ mobile apps that were published in App Store and Play Store.",
            [
              ExperienceModel(
                "Senior Software Engineer (Flutter)\nM2P Fintech,Chennai\n03/2021 - present",
                "1.Created Visa digital mobile application using flutter.\n2.Support the team to build generic components for upcoming flutter projects.\n3.Help the team to learn about Bloc state management and live project architecture\n4.M2P fintech web portal is my ongoing projects.",
              ),
              ExperienceModel(
                "Native IOS / Flutter Developer\nTartLabs\n09/2018 - 03/2021",
                "1.Coimbatore Tart Labs is a top-notch software design and development company bringing in transformational outcomes to all the customers across various industries.\n2.Experienced in Cross-Platform Mobile Development using Flutter based mobile app.\n3.Good understanding and usage of States and Flutter Blocs.\n4.Up to date on Apple development standards Build app for both online and Offline storage.\n5.Use SOAP and RESTful API's. Work along with Third party integrated tools.\n6.Experience with versioning tools like Git-Lab .",
              ),
              ExperienceModel(
                  "IOS Developer\nHCL Technologies Ltd\n08/2017 - 09/2018, Chennai",
                  "1.iOS application Developing & Testing.\n2.Design and build advanced app features for the iOS platform with Swift language Involvement in Software Product Life Cycle.\n3.Familiar with defect Tracking Tools & Process.\n4.Interacting with SME’s , senior management, developers, testers and across different competencies to get the task accomplished within the given deadlines. Performed technical designs and implementation of 3+ iOS apps."),
            ],
            "mariganeshthangam@gmail.com",
            "https://github.com/mariganesh555",
            "https://www.linkedin.com/in/mariganesh-t-02831b104"),
      ),
    );
  }
}

class SeemaScreen extends StatefulWidget {
  const SeemaScreen({Key? key}) : super(key: key);

  @override
  _SeemaScreenState createState() => _SeemaScreenState();
}

class _SeemaScreenState extends State<SeemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/seema.png",
            "Seema SenthilKumar",
            "Software Engineer",
            "I’m Seema. Software Engineer based in India.",
            "Hi!..I have completed my Bachelor of Engineering (ECE) from Dhanalakshmi College of Engineering. I’m a fresher. I have joined M2P Fintech as a intern in the month of April 2021 and officially as a employee in the month of August 2021.",
            [
              ExperienceModel(
                  "Software Engineer\nMobile Development (Flutter)\nM2P Fintech,\nChennai.\n02/08/2021 - present",
                  "1.Created generic components for upcoming flutter projects.\n2.learnt about flutter web.\n3.ICICI Pockets is my current project."),
            ],
            "seemasenthil399@gmail.com",
            "https://github.com/Seema0399",
            "https://www.linkedin.com/in/seema-s-123b111b6"),
      ),
    );
  }
}

class NandhaScreen extends StatefulWidget {
  const NandhaScreen({Key? key}) : super(key: key);

  @override
  _NandhaScreenState createState() => _NandhaScreenState();
}

class _NandhaScreenState extends State<NandhaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/nandha.png",
            "Nandhakumar Krishnan",
            "Software Engineer",
            "Hi! I'm Nandha, I work as a professional  Software Engineer.\"Write code! get money\"",
            "Professional Software Engineer with over 2+ years of experience in Mobile app development using(Flutter, Dart). Involved in in-app Architecture, Design, Development and Testing.  I have developed 5+applications that were published in Play Store and App Store. currently, 1000+ customers using theseapplications.",
            [
              ExperienceModel(
                  "Software Engineer\nMobile Development (Flutter)\nM2P Fintech,\nChennai.\nAugust - present",
                  "1.Created Instalmint (Origa) mobile application using Flutter.\n2.I have learned how to handle the project and move on with day by day activities.\n3.Good understanding & Implementation of Flutter Blocs and Offline implementations."),
              ExperienceModel(
                  "Flutter Developer#REF Technologies Ltd - Dharmapuri, Tamil Nadu \nAugust 2019 to August 2021",
                  "1.Mobile Application Developing & Testing for both Android & iOS using Flutter and Dart.\n2.Good understanding & Implementation of API integration with REST & RESTful API. Work alongwith Third-party integrated tools.\n3.Design and build advanced app features for the Android & iOS platform with Flutter.\n4.Product Life Cycle.Experience with versioning tools like Git-Lab, GitHub and Jira.")
            ],
            "nandhu4011@gmail.com",
            "https://gitlab.com/NandhakumarKrishnanNK/",
            "https://www.linkedin.com/in/nandhakumar-k-14828813a"),
      ),
    );
  }
}

class JonesScreen extends StatefulWidget {
  @override
  _JonesScreenState createState() => _JonesScreenState();
}

class _JonesScreenState extends State<JonesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/jones.png",
            "Jones Joseph",
            "Software Engineer",
            "I’m Jones. Software Engineer based in India.",
            "Hi!.. I have completed my Bachelor of Computer Science from Sri Paramakalyani College. I’m a fresher. I have joined M2P Fintech as an intern in July 2021 and officially as an employee in September 2021.\n\n Techniques :\n-> React Native\n-> Basic Hacking\n-> Python\n-> Flutter & Dart",
            [
              ExperienceModel(
                  "Software Engineer (Flutter)\nM2P Fintech,Chennai\n06/09/2021 - present",
                  "1.Working in the Origa Project."),
            ],
            "jonessunil9601@gmail.com",
            "https://github.com/Jones9601",
            "https://www.linkedin.com/in/jones-j-ab5276211"),
      ),
    );
  }
}
