import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/utils/custom_text.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/utils/string_resource.dart';
import 'package:portfolio_portal/widgets/bottomContainer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget>
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

  void clearText() {
    emailController.clear();
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
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
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
          Container(
            height: 700,
            child: Padding(
              padding: EdgeInsets.zero,
              child: CarouselSlider(
                items: [
                  Expanded(
                    // padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 30, right: 10),
                              // height: 180,
                              // width: 800,
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
                                margin:
                                    const EdgeInsets.only(left: 40, bottom: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    color:
                                                        Colors.lightBlueAccent,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      ColorResource.colorFFFFFF,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      side: const BorderSide(
                                                          color: Colors.white)),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30,
                                                      vertical: 20),
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                                                      textStyle:
                                                          const TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                              margin:
                                  const EdgeInsets.only(left: 30, right: 10),
                              // height: 180,
                              // width: 800,
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
                                margin:
                                    const EdgeInsets.only(left: 40, bottom: 20),
                                width: 700,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  textStyle: const TextStyle(
                                                    color:
                                                        Colors.lightBlueAccent,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      ColorResource.colorFFFFFF,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      side: const BorderSide(
                                                          color: Colors.white)),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30,
                                                      vertical: 20),
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                                                      textStyle:
                                                          const TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                              margin:
                                  const EdgeInsets.only(left: 40, right: 10),
                              // height: 180,
                              // width: 800,
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
                                margin:
                                    const EdgeInsets.only(left: 40, bottom: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    color:
                                                        Colors.lightBlueAccent,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      ColorResource.colorFFFFFF,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      side: const BorderSide(
                                                          color: Colors.white)),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30,
                                                      vertical: 20),
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                                                      textStyle:
                                                          const TextStyle(
                                                        color: ColorResource
                                                            .colorFFFFFF,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                            width: 550,
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
                // height: 180,
                // width: MediaQuery.of(context).size.width,
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
                                borderRadius: BorderRadius.circular(30.0),
                                side:
                                    const BorderSide(color: Colors.blueAccent)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
          const BottomContainerWidget(),
        ],
      )),
    );
  }
}
