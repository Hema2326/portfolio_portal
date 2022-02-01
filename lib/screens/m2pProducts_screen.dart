import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

import '../widgets/draw_clip.dart';

class M2PproductScreen extends StatefulWidget {
  const M2PproductScreen({Key? key}) : super(key: key);

  @override
  _M2PproductScreenState createState() => _M2PproductScreenState();
}

class _M2PproductScreenState extends State<M2PproductScreen>
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
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'We',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AnimatedTextKit(
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          ScaleAnimatedText(
                            'Enable',
                            textStyle: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ScaleAnimatedText(
                            'Embed',
                            textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                      Text(
                        'Fintech',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: Image.asset(
                      'assets/camera.png',
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40, left: 15),
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
                      SizedBox(height: 30),
                      Text(
                        'Build your Fintech Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Check out our API docs to jump-start your product journey.',
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
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
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: const BorderSide(color: Colors.white)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/docs.png',
                    height: 200,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('OUR VALUES',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            Image.asset(
              'assets/value.png',
              height: 400,
              width: 700,
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
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: InkWell(
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
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: InkWell(
                          onTap: () async {
                            const url = "https://m2pfintech.com/fleet-drive/";
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
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: InkWell(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/fintech.png',
                  height: 220,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'CONTACT US',
                          style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Redefine Innovation With Us',
                          style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: Wrap(
                            children: [
                              Text(
                                'M2P experts with proven experience in fintech businesses and banking help you co-create products, access reputed bank networks and offer mentorship support.',
                                // maxLines: 2,
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 180,
                          child: ElevatedButton(
                            onPressed: () async {
                              const url = "https://m2pfintech.com/contact-us/";
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
                                    borderRadius: BorderRadius.circular(15.0),
                                    side:
                                        const BorderSide(color: Colors.white)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                textStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
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
                                  color:
                                      isSelected ? Colors.black : Colors.white,
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
                                  color:
                                      isSelected1 ? Colors.black : Colors.white,
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
                                const url = "https://twitter.com/flutterdev";
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
                                  color:
                                      isSelected4 ? Colors.red : Colors.white,
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
