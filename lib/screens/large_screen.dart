import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  late ScrollController _scrollController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;
  bool isHovering3 = false;
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 0, 20, 0),
            child: Row(
              children: [
                Image.asset(
                  'assets/logo1.png',
                  height: 150,
                  width: 150,
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHovering = value;
                    });
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color: isHovering ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 20,
                ),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHovering1 = value;
                    });
                  },
                  child: Text(
                    'Portfolio',
                    style: TextStyle(
                        color: isHovering1 ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 20,
                ),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHovering2 = value;
                    });
                  },
                  child: Text(
                    'Projects',
                    style: TextStyle(
                        color: isHovering2 ? Colors.red : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 250,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.0))),
                child: Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Chennai, INDIA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 25),
                              const Text(
                                'M2P Fintech,\n3rd Floor, MM Complex, \n30/10, Hopman Street 2nd Street,\nAlandur, Chennai - 600016.TamilNadu. \nIndia',
                                style: TextStyle(color: Colors.white60),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                'ping@m2pfintech.com',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Mumbai, INDIA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'M2P Fintech,\n91Springboard, 1st Floor,\nKagalwala House,Plot No. 175,\nCST Road, Behind Mercedes\nBenz showroom,\nKalina, MUMBAI - 400 098.',
                                style: TextStyle(color: Colors.white60),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                '044-40554808',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Abu Dhabi, UAE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'M2P Solutions Ltd,\nOffice No.2452, 24 - Al Sila Tower, \nAbu Dhabi Global Market Square,\nAl Maryah Island\nAbu Dhabi,\nUnited Arab Emirates.',
                                style: TextStyle(color: Colors.white60),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                '© 2021 M2P Fintech',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dubai, UAE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'M2P Solutions Ltd,\nSuite 105-106, \nBuilding 1, Bay Square,\nBusiness Bay,\nDubai.',
                                style: TextStyle(color: Colors.white60),
                              ),
                              const SizedBox(
                                height: 55,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Legal   ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    ' Privacy policy',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: FaIcon(FontAwesomeIcons.linkedin,
                                    color: isHovering
                                        ? Colors.blue[700]
                                        : Colors.white,
                                    size: 20.0),
                                onTap: () async {
                                  const url =
                                      "https://www.linkedin.com/authwall?trk=gf&trkInfo=AQH40bJuvpRNdAAAAX5O0iFIuWCj7F96IZOHbTDfHM_AN4cwx0-wzPOj1PFgLBfxB9L85nUiD4I2sqXjVcN4qT66e_ZUEm2Wczqs-049m4ctLkq193R5q9hmdTHz1DsOahwt8-M=&originalReferer=https://www.m2pfintech.com/&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Fm2pfintech";
                                  await launch(url);
                                },
                                onHover: (value) {
                                  setState(() {
                                    isHovering = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                child: FaIcon(FontAwesomeIcons.twitter,
                                    color: isSelected1
                                        ? Colors.blue[400]
                                        : Colors.white,
                                    size: 20.0),
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    isSelected1 = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                child: FaIcon(FontAwesomeIcons.instagram,
                                    color: isSelected2
                                        ? Colors.pink[400]
                                        : Colors.white,
                                    size: 20.0),
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    isSelected2 = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                child: FaIcon(FontAwesomeIcons.facebook,
                                    color: isSelected3
                                        ? Colors.blue[600]
                                        : Colors.white,
                                    size: 20.0),
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    isSelected3 = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 50),
                              InkWell(
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.arrow_upward,
                                      color: Colors.white,
                                    )),
                                onTap: () {
                                  _scrollToTop();
                                },
                              ),
                            ],
                          )
                        ])))),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(height: 900),
                Column(
                  children: [
                Container(
                  margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  height: 300,
                  width: 500,
                  child: Center(
                  child: AnimatedTextKit(

                  // repeatForever: true,

                    animatedTexts: [
                      TypewriterAnimatedText('The Lorem ipsum text is derived from sections 1.10.32 and 1.10.33 of CiceroDe finibus bonorum et malorum The physical source may have been the 1914 Loeb Classical Library edition of De finibus, where the Latin text, presented on the left-hand (even) pages, breaks off on page 34 with Neque porro quisquam est qui do-" and continues on page 36 with "lorem ipsum suggesting that the galley type of that page was mixed up to make the dummy text seen today.',
                        textAlign: TextAlign.center,
                        textStyle: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,

                          ),
                        ),

                        cursor: '|'),


                    ],
                    displayFullTextOnTap: true,
                    totalRepeatCount: 1,
                    isRepeatingAnimation: false,
                  ),
      ),
                ),



                    SizedBox(
                      height: 59
                    ),
                    ElevatedButton(onPressed: (){

                    }, child: Text('Portfolio'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        // onPrimary: Colors.yellow, // foreground
                      ),
                    )
                  ],
                ),
                Spacer(),
                    Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_rfDuEU.json',
                      height: 600.0,
                      repeat: true,
                      reverse: true,
                      animate: true,
                    ),

                  ],
                ),
            Container(
              color: Colors.red,
            )

              ],
            ),



      ),
    );
  }
}
