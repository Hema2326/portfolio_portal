import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen>
    with SingleTickerProviderStateMixin {
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
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    // _scrollController.dispose();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(70, 40, 0, 0),
                    child: Image.asset(
                      'assets/flutterlogo.png',
                      // height: 60,
                      width: 60,
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Container(
                      color: Colors.white,
                      // height: 50,
                      // width: 10,

                      margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
                      child: TabBar(
                          controller: _tabController,
                          isScrollable: false,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          indicatorColor: Colors.lightBlueAccent,
                          labelColor: Colors.black,
                          tabs: [
                            Tab(
                              text: 'Home',
                            ),
                            Tab(text: 'Portfolio'),
                            Tab(text: 'Projects'),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Marquee(
                    text:
                        'Flutter is Google’s free and open-source UI framework for creating native mobile applications. Released in 2017, Flutter allows developers to build mobile applications for both iOS and Android with a single codebase and programming language. This capability makes building iOS and Android apps simpler and faster.',

                    style:  GoogleFonts.aBeeZee(
                    textStyle:
                    TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),),
                ),
              ),
              Flexible(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/flutter-engage.png',
                                      fit: BoxFit.cover,
                                      height: 560,
                                      // width: MediaQuery.of(context).size.width,
                                    ),
                                    Image.asset(
                                      'assets/flutter-engage.png',
                                      fit: BoxFit.cover,
                                      height: 560,
                                      // width: MediaQuery.of(context).size.width,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height:40,
                                  width: 150,
                                  padding:EdgeInsets.all(10),
                                  decoration:BoxDecoration(
borderRadius: BorderRadius.circular(15),
                                    color: Colors.lightBlue
                            ),
                                    child: Center(child: Text('Fast',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ))),
                                Container(
                                    height:40,
                                    width: 150,
                                    padding:EdgeInsets.all(10),
                                    decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.lightBlue
                                    ),
                                    child: Center(child: Text('Fast',
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ))),
                                SizedBox(width: 40),
                                Container(
                                    height:40,
                                    width: 150,
                                    padding:EdgeInsets.all(10),
                                    decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.lightBlue
                                    ),
                                    child: Center(child: Text('Fast',
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ))),
                                Spacer(),
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Lottie.network(
                                    'https://assets1.lottiefiles.com/packages/lf20_w7401juf.json',
                                    height: 500.0,
                                    repeat: true,
                                    reverse: true,
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              padding: EdgeInsets.only(bottom: 20),
                              child: Lottie.network(
                                'https://assets4.lottiefiles.com/packages/lf20_rfDuEU.json',
                                height: 600.0,
                                repeat: true,
                                reverse: true,
                                animate: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.directions_bike),
                      Icon(Icons.movie),
                    ],
                  ),
                ),
              ),
            ],
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
        body: Text(''));
  }
}
