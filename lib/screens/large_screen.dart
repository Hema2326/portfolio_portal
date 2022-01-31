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

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen>
    with TickerProviderStateMixin {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(70, 40, 0, 0),
              child: Image.asset(
                ImageResource.flutterlogo,
                width: 60,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                child: CustomText(
                  StringResource.welcomeflutter,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: ColorResource.color222222,
                          fontSize: 50,
                          fontWeight: FontWeight.w400)),
                )),
          ],
        ),
      ),
      body: Column(children: [
        Row(
          children: [
            const Spacer(),
            Flexible(
              child: Container(
                color: ColorResource.colorFFFFFF,
                margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: TabBar(
                    controller: _tabController,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    indicatorColor: Colors.lightBlueAccent,
                    labelColor: ColorResource.color222222,
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
                child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Image.asset(
                    ImageResource.flutterengage,
                    fit: BoxFit.fill,
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                  ),
                ]),
                const SizedBox(
                  height: 80,
                ),
                CustomText(
                  StringResource.flutter,
                  style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  StringResource.buildapps,
                  style: GoogleFonts.aBeeZee(fontSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: CustomText(
                    StringResource.opensource,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 500,
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
                                    CustomText(
                                      StringResource.flutterways,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(
                                      StringResource.fast,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(
                                      StringResource.productive,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(
                                      StringResource.flexible,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        const url = 'https://dartpad.dev/?';
                                        await launch(url);
                                      },
                                      child: Container(
                                          height: 40,
                                          width: 150,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.lightBlue),
                                          child: Center(
                                              child: CustomText(
                                                  StringResource.tryindartpad,
                                                  style: GoogleFonts.aBeeZee(
                                                      textStyle:
                                                          const TextStyle(
                                                    color: ColorResource
                                                        .colorFFFFFF,
                                                  ))))),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  color: Colors.white,
                                  // padding: const EdgeInsets.only(bottom: 20),
                                  child: Lottie.network(
                                    'https://assets1.lottiefiles.com/packages/lf20_w7401juf.json',
                                    height: 400.0,
                                    width: 500,
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
                                    CustomText(StringResource.multiplatform,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 35,
                                        ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(StringResource.mobile,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                        ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(StringResource.web,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                        ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(StringResource.desktop,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                        ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(StringResource.embedded,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                        ))),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  color: Colors.white,
                                  // padding: const EdgeInsets.only(bottom: 20),
                                  child: Lottie.network(
                                    'https://assets3.lottiefiles.com/packages/lf20_awhygdgw.json',
                                    height: 400.0,
                                    width: 500,
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
                                    CustomText(StringResource.dartlanguage,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 35,
                                        ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(StringResource.dartlanguage1,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                        ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(StringResource.dartlanguage2,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                        ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(StringResource.dartlanguage3,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                        ))),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  color: ColorResource.colorFFFFFF,
                                  // padding: const EdgeInsets.only(bottom: 20),
                                  child: Lottie.network(
                                    'https://assets2.lottiefiles.com/packages/lf20_lvgmrl5j.json',
                                    height: 400.0,
                                    width: 500,
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
                          aspectRatio: 2.0,
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
                      margin: const EdgeInsets.only(left: 10, right: 10),
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
                        margin: const EdgeInsets.only(left: 40, bottom: 20),
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
                    Container(
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
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 180,
                  width: 1000,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blueAccent.shade100,
                          Colors.blueAccent,
                        ],
                      )),
                  child: Container(
                    margin: const EdgeInsets.only(left: 40, bottom: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            CustomText(StringResource.dart,
                                style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                  color: ColorResource.colorFFFFFF,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ))),
                            const SizedBox(height: 15),
                            CustomText(
                              StringResource.dart1,
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  color: ColorResource.colorFFFFFF,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    const url = "https://dart.dev";
                                    await launch(url);
                                  },
                                  child: CustomText(
                                    StringResource.dartdev,
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.normal,
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
                                    const url = "https://pub.dev";
                                    await launch(url);
                                  },
                                  child: Row(
                                    children: [
                                      CustomText(
                                        StringResource.getpackages,
                                        style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                            color: ColorResource.colorFFFFFF,
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
                const SizedBox(
                  height: 20,
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
            )),
            const Icon(Icons.directions_bike),
            Column(
              children: [
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
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Image.asset(
                                  ImageResource.visa,
                                  width: 400,
                                  height: 400,
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
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Image.asset(
                                  ImageResource.genericcomponenets,
                                  width: 400,
                                  height: 400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ]),
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
