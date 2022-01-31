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
                                      fontSize: 40,
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
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              ImageResource.icici2,
                              width: 500,
                              height: 500,
                            ),
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
      PortfolioModel('assets/flutter-engage.png', 'Mari'),
      PortfolioModel('assets/flutter-engage.png', 'Chinnadurai'),
      PortfolioModel('assets/alexia.png', 'Alexia'),
      PortfolioModel('assets/flutter-engage.png', 'Hema'),
      PortfolioModel('assets/flutter-engage.png', 'Seema'),
      PortfolioModel('assets/flutter-engage.png', 'Nandhakumar'),
      PortfolioModel('assets/flutter-engage.png', 'Jones'),
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
                      MaterialPageRoute(builder: (context) => NadhaScreen()),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedBuilder(
                animation: _sizeAnimation,
                builder: (context, child) => const CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage('assets/flutter-engage.png'),
                ),
              ),
            ),
            const Text(
              "Mari",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              "Senior Software Engineer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 60),
            const Text("Introduction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Text("About Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text("Experience",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text("email.com", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 40),
                  InkWell(
                    child: const FaIcon(FontAwesomeIcons.github,
                        color: Colors.black, size: 25.0),
                    onTap: () async {
                      const url = "https://github.com/flutter";
                      await launch(url);
                    },
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    child: FaIcon(FontAwesomeIcons.linkedin,
                        color: Colors.blue[400], size: 25.0),
                    onTap: () async {
                      const url = "https://twitter.com/flutterdev";
                      await launch(url);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage('assets/flutter-engage.png'),
              ),
            ),
            const Text(
              "Chinnadurai",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              "Senior Software Engineer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 60),
            const Text("Introduction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Text("About Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text("Experience",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text("email.com", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 40),
                  InkWell(
                    child: const FaIcon(FontAwesomeIcons.github,
                        color: Colors.black, size: 25.0),
                    onTap: () async {
                      const url = "https://github.com/flutter";
                      await launch(url);
                    },
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    child: FaIcon(FontAwesomeIcons.linkedin,
                        color: Colors.blue[400], size: 25.0),
                    onTap: () async {
                      const url = "https://twitter.com/flutterdev";
                      await launch(url);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AlexiaScreen extends StatefulWidget {
  @override
  _AlexiaScreenState createState() => _AlexiaScreenState();
}

class _AlexiaScreenState extends State<AlexiaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage('assets/flutter-engage.png'),
              ),
            ),
            const Text(
              "Alexia",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              "Software Engineer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 60),
            const Text("Introduction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Text("About Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text("Experience",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text("email.com", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 40),
                  InkWell(
                    child: const FaIcon(FontAwesomeIcons.github,
                        color: Colors.black, size: 25.0),
                    onTap: () async {
                      const url = "https://github.com/flutter";
                      await launch(url);
                    },
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    child: FaIcon(FontAwesomeIcons.linkedin,
                        color: Colors.blue[400], size: 25.0),
                    onTap: () async {
                      const url = "https://twitter.com/flutterdev";
                      await launch(url);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class HemaScreen extends StatefulWidget {
  @override
  _HemaScreenState createState() => _HemaScreenState();
}

class _HemaScreenState extends State<HemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage('assets/flutter-engage.png'),
              ),
            ),
            const Text(
              "Hema",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              "Software Engineer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 60),
            const Text("Introduction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Text("About Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text("Experience",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text("email.com", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 40),
                  InkWell(
                    child: const FaIcon(FontAwesomeIcons.github,
                        color: Colors.black, size: 25.0),
                    onTap: () async {
                      const url = "https://github.com/flutter";
                      await launch(url);
                    },
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    child: FaIcon(FontAwesomeIcons.linkedin,
                        color: Colors.blue[400], size: 25.0),
                    onTap: () async {
                      const url = "https://twitter.com/flutterdev";
                      await launch(url);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SeemaScreen extends StatefulWidget {
  @override
  _SeemaScreenState createState() => _SeemaScreenState();
}

class _SeemaScreenState extends State<SeemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage('assets/flutter-engage.png'),
              ),
            ),
            const Text(
              "Seema",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              "Software Engineer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 60),
            const Text("Introduction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Text("About Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text("Experience",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text("email.com", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 40),
                  InkWell(
                    child: const FaIcon(FontAwesomeIcons.github,
                        color: Colors.black, size: 25.0),
                    onTap: () async {
                      const url = "https://github.com/flutter";
                      await launch(url);
                    },
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    child: FaIcon(FontAwesomeIcons.linkedin,
                        color: Colors.blue[400], size: 25.0),
                    onTap: () async {
                      const url = "https://twitter.com/flutterdev";
                      await launch(url);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class NadhaScreen extends StatefulWidget {
  @override
  _NadhaScreenState createState() => _NadhaScreenState();
}

class _NadhaScreenState extends State<NadhaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage('assets/flutter-engage.png'),
              ),
            ),
            const Text(
              "NadhaKumar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              "Software Engineer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 60),
            const Text("Introduction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Text("About Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text("Experience",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text("email.com", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 40),
                  InkWell(
                    child: const FaIcon(FontAwesomeIcons.github,
                        color: Colors.black, size: 25.0),
                    onTap: () async {
                      const url = "https://github.com/flutter";
                      await launch(url);
                    },
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    child: FaIcon(FontAwesomeIcons.linkedin,
                        color: Colors.blue[400], size: 25.0),
                    onTap: () async {
                      const url = "https://twitter.com/flutterdev";
                      await launch(url);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage('assets/flutter-engage.png'),
              ),
            ),
            const Text(
              "Jones",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              "Software Engineer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 60),
            const Text("Introduction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Text("About Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text("Experience",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                        const SizedBox(
                            height: 80,
                            width: 20,
                            child: VerticalDivider(color: Colors.blue)),
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                    )
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text("email.com", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 40),
                  InkWell(
                    child: const FaIcon(FontAwesomeIcons.github,
                        color: Colors.black, size: 25.0),
                    onTap: () async {
                      const url = "https://github.com/flutter";
                      await launch(url);
                    },
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    child: FaIcon(FontAwesomeIcons.linkedin,
                        color: Colors.blue[400], size: 25.0),
                    onTap: () async {
                      const url = "https://twitter.com/flutterdev";
                      await launch(url);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
