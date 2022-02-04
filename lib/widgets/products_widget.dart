import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_portal/widgets/bottomContainer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget>
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
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
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
                                side: const BorderSide(color: Colors.white)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
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
                          const url = "https://m2pfintech.com/fleet-drive/";
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
                                fontSize: 28, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Redefine Innovation With Us',
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: 700,
                        child: Text(
                          'M2P experts with proven experience in fintech businesses and banking help you co-create products, access reputed bank networks and offer mentorship support.',
                          maxLines: 2,
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () async {
                          const url = "https://m2pfintech.com/contact-us/";
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
                                side: const BorderSide(color: Colors.white)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const BottomContainerWidget(),
          ],
        ),
      ),
    );
  }
}
