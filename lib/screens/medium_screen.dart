import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';

import 'package:portfolio_portal/screens/portfolio_screen.dart';
import 'package:portfolio_portal/utils/string_resource.dart';
import 'package:portfolio_portal/widgets/bottomContainer_widget.dart';

import 'package:url_launcher/url_launcher.dart';

import '../utils/color_resource.dart';
import '../utils/custom_text.dart';
import '../utils/image_resource.dart';

class MediumScreen extends StatefulWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  _MediumScreenState createState() => _MediumScreenState();
}

class _MediumScreenState extends State<MediumScreen>
    with TickerProviderStateMixin {
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
  void clearText() {
    emailController.clear();
  }

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.bounceIn,
  );

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = InkWell(
      child: const Text(
        "Cancel",
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
    const SizedBox(width: 20);
    Widget continueButton = InkWell(
      child: const Text(
        "Continue",
        style: TextStyle(color: Colors.blue),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text("Would you like to subsribe our news letter?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
          preferredSize: Size(screenSize.width, 768),
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
              padding: const EdgeInsets.only(left: 20,right: 20),
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
              // HomeScreenWidget(),
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
                              child: Column(
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
                              child: Column(
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
                                                Colors.redAccent.shade100,
                                                Colors.blueAccent,
                                              ],
                                            )),
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 40, bottom: 20),
                                          child: Column(
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
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                      textStyle:
                                                          const TextStyle(
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
                                                                  FontWeight
                                                                      .bold,
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
                              child: Column(
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
                                          child: Column(
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
                                          const url =
                                              "https://docs.flutter.dev";
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
                                    fontSize: 20),
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
                          onEditingComplete: () {
                            if (emailController.text.isEmpty) {
                              isSelected = false;
                            } else {
                              isSelected = true;
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              if (emailController.text.isEmpty) {
                                isSelected = false;
                              } else {
                                isSelected = true;
                              }
                              print(value);
                            });
                          },
                        ),
                      ),
                      isSelected
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                onPressed: () async {
                                  isSelected = true;
                                  showAlertDialog(context);
                                  clearText();
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
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            color: Colors.blueAccent)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                onPressed: () async {
                                  // showAlertDialog(context);
                                  // clearText();
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
                                    primary: Colors.blueAccent.shade100,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            color: Colors.blueAccent)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                    ],
                  ),
                  const BottomContainerWidget()
                ],
              )),
              const PortfolioScreen(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        AspectRatio(
                          aspectRatio: 3.0,
                          child: Image.asset(
                            ImageResource.project1,
                            fit: BoxFit.fill,
                            height: 600,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 100, bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                StringResource.flutterprojects,
                                style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                    color: ColorResource.colorFFFFFF,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      StringResource.icici,
                                      textStyle: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          color: ColorResource.colorFFFFFF,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                  repeatForever: true),
                              const SizedBox(
                                height: 20,
                              ),
                              AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      StringResource.visa,
                                      textStyle: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          color: ColorResource.colorFFFFFF,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                  repeatForever: true),
                              const SizedBox(
                                height: 20,
                              ),
                              AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      StringResource.generic,
                                      textStyle: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          color: ColorResource.colorFFFFFF,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                  repeatForever: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.pink[400],
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80, left: 30),
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Description',
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: ColorResource.colorFFFFFF,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 800,
                                      height: 75,
                                      child: CustomText(
                                        'It’s a VISA-powered e-wallet that customer of any bank can use to recharge mobile, send money, shop anywhere, pay bills and much more.',
                                        style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                            color: ColorResource.colorFFFFFF,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 800,
                                      height: 75,
                                      child: CustomText(
                                        'Pockets wallet also comes with a physical shopping card which can be used to shop on any website or retail stores.',
                                        style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                            fontSize: 20,
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
                                          fontSize: 20,
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
                                          fontSize: 20,
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
                                          fontSize: 20,
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
                                          fontSize: 20,
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
                                          fontSize: 20,
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: ColorResource.colorFFFFFF,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Scan to Pay',
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: ColorResource.colorFFFFFF,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        ImageResource.pockets,
                                        width: 250,
                                        height: 250,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    ImageResource.icici2,
                                    alignment: Alignment.center,
                                    width: 325,
                                    height: 325,
                                  ),
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
                          padding: const EdgeInsets.only(top: 80, left: 30),
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
                                      width: 800,
                                      height: 100,
                                      child: CustomText(
                                        'Visa Digital Solutions equip you with the tools you need to create, manage and accept secure digital payments in-store, online or in-app.',
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
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
                                        fontSize: 20,
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
                                        fontSize: 20,
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
                                        fontSize: 20,
                                        color: ColorResource.color222222,
                                        fontWeight: FontWeight.w100,
                                      )),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 60),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    ImageResource.visa,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 800,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80, left: 30),
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
                                    Container(
                                      width: 800,
                                      height: 100,
                                      child: CustomText(
                                        'Instead of packages we can make use of it and we can use for our upcoming projects.',
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                          color: ColorResource.colorFFFFFF,
                                          fontWeight: FontWeight.w100,
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Currency Converter',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                        fontWeight: FontWeight.w100,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Google Maps',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                        fontWeight: FontWeight.w100,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Otp View and Returning User',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                        fontWeight: FontWeight.w100,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'International phone field and country code',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                        fontWeight: FontWeight.w100,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Encryption and Decryption',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Download and Share',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'QR Code Generator',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Set Pin',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Biometric Authenetication',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Walkthrough View',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'WebView',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      'Email, Call, Message, Whatsapp',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: ColorResource.colorFFFFFF,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              // const Spacer(),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 60),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    ImageResource.genericcomponenets1,
                                    // width: 250,
                                    height: 250,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          color: Colors.orange[400],
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'Yet More to come....',
                                textStyle: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: ColorResource.colorFFFFFF,
                                )),
                              )
                            ],
                            isRepeatingAnimation: true,
                            repeatForever: true,
                          ))
                    ]),
                  ]),
                ),
              ),
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
                                style: const TextStyle(
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
                              height: 500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 40, left: 25),
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Build your Fintech Product',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 550,
                                child: Text(
                                  'Check out our API docs to jump-start your product journey.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50),
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
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
                          Image.asset(
                            'assets/docs.png',
                            height: 300,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text('OUR VALUES',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                    Image.asset(
                      'assets/value.png',
                      height: 500,
                      width: 800,
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
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 70),
                                child: InkWell(
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
                    Container(
                        child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/fintech.png',
                          height: 300,
                        ),
                        Container(
                          width: 500,
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
                              Container(
                                width: 200,
                                child: ElevatedButton(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                    const BottomContainerWidget()
                  ],
                ),
              ),
            ]),
          ),
        ]));
  }
}
