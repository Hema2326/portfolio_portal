import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:portfolio_portal/screens/portfolio_screen.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/utils/custom_text.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/utils/string_resource.dart';
import 'package:portfolio_portal/widgets/home_screen_widget.dart';
import 'package:portfolio_portal/widgets/products_widget.dart';
import 'package:portfolio_portal/widgets/bottomContainer_widget.dart';
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
  late AnimationController animation;


  TextEditingController emailController = TextEditingController();

  TabController? _tabController;
  late AnimationController _controller;

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);



  late final AnimationController arrow = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _arrowAnimation =
      CurvedAnimation(parent: arrow, curve: Curves.easeInCubic);




  @override
  void initState() {
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
    _controller.dispose();
    controller.dispose();
    super.dispose();
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
                HomeScreenWidget(),

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
            ProductWidget(),

          ]))
        ]));
  }
}
