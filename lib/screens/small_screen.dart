import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_portal/screens/m2pProducts_screen.dart';
import 'package:portfolio_portal/screens/portfolio_screen.dart';
import 'package:portfolio_portal/screens/projects_screen.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/utils/custom_text.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/utils/string_resource.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/bottomContainer_widget.dart';

class SmallScreen extends StatefulWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  _SmallScreenState createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style7,
      menuScreen: const SideBar(),
      mainScreen: const MainView(),
      borderRadius: 40.0,
      showShadow: true,
      angle: -12.0,
      backgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInOut,
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = InkWell(
    child: Text(
      "Cancel",
      style: TextStyle(color: Colors.red),
    ),
    onTap: () {
      Navigator.pop(context);
    },
  );
  SizedBox(width: 20);
  Widget continueButton = InkWell(
    child: Text(
      "Continue",
      style: TextStyle(color: Colors.blue),
    ),
    onTap: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("Would you like to subsribe our news letter?"),
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

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;
  bool isHovering3 = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.blue[300],
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Portfolio Portal',
            style: const TextStyle(
                color:  Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isHovering = value;
              });
            },
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white),
              ),
              child: Text(
                'Home',
                style: TextStyle(
                    color: isHovering ? Colors.pink : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width / 20,
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PortfolioScreen()),
              );
            },
            onHover: (value) {
              setState(() {
                isHovering1 = value;
              });
            },
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
              ),
              child: Text(
                'Portfolio',
                style: TextStyle(
                    color: isHovering1 ? Colors.pink : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width / 20,
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProjectsScreen()));
            },
            onHover: (value) {
              setState(() {
                isHovering2 = value;
              });
            },
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(const Radius.circular(5)),
                border: Border.all(color: Colors.white),
              ),
              child: Text(
                'Projects',
                style: TextStyle(
                    color: isHovering2 ? Colors.pink : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width / 20,
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const M2PproductScreen()));
            },
            onHover: (value) {
              setState(() {
                isHovering3 = value;
              });
            },
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                 color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.white),
              ),
              child: Text(
                'M2P products',
                style: TextStyle(
                    color: isHovering3 ? Colors.pink : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  void clearText() {
    emailController.clear();
  }

  bool isSelected = false;
  late AnimationController _controller;

  double value = 0;

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.bounceIn,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => ZoomDrawer.of(context)!.toggle(),
                icon: const Icon(Icons.menu))),
        body: SingleChildScrollView(
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
                  child: SizedBox(
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 30, right: 10),
                                      // height: 180,
                                      // width: 800,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 15),
                                            CustomText(StringResource.dart,
                                                style: GoogleFonts.aBeeZee(
                                                    textStyle: const TextStyle(
                                                  color:
                                                      ColorResource.colorFFFFFF,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                            const SizedBox(height: 15),
                                            CustomText(
                                              StringResource.dart1,
                                              style: GoogleFonts.aBeeZee(
                                                textStyle: const TextStyle(
                                                  color:
                                                      ColorResource.colorFFFFFF,
                                                  fontSize: 12,
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
                                                        "https://dart.dev";
                                                    await launch(url);
                                                  },
                                                  child: CustomText(
                                                    StringResource.dartdev,
                                                    style: GoogleFonts.aBeeZee(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors
                                                            .lightBlueAccent,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      primary: ColorResource
                                                          .colorFFFFFF,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  15.0),
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 20),
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
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
                                                        style:
                                                            GoogleFonts.aBeeZee(
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
                                      ),
                                    ),
                                  ],
                                ),
                                // const Spacer(),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 30, right: 10),
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
                                        child: Column(
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
                                                      fontSize: 20,
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
                                                      fontSize: 12,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text('Get Started',
                                style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                  color: ColorResource.colorFFFFFF,
                                  fontSize: 20,
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
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 30),
                      child: Text(
                        'Join our News Letter Keep up with the latest Flutter news, releases, and more',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                              color: ColorResource.color222222,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 100,
                      width: 200,
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
                                      borderRadius: BorderRadius.circular(30.0),
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
              ]),
        ));
  }
}
