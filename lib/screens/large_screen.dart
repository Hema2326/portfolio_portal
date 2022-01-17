import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/utils/string_resource.dart';
import 'package:url_launcher/url_launcher.dart';
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
        backgroundColor: ColorResource.colorFFFFFF,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
            child: Row(
              children: [
                Image.asset(
                  ImageResource.yaplogo,
                  height: 150,
                  width: 150,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHovering = value;
                    });
                  },
                  child: Text(
                    StringResource.home,
                    style: TextStyle(
                        color: isHovering
                            ? ColorResource.colorEC1C24
                            : ColorResource.color222222,
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
                    StringResource.portfolio,
                    style: TextStyle(
                        color: isHovering1
                            ? ColorResource.colorEC1C24
                            : ColorResource.color222222,
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
                    StringResource.services,
                    style: TextStyle(
                        color: isHovering2
                            ? ColorResource.colorEC1C24
                            : ColorResource.color222222,
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(height: 900),
            Lottie.network(
              'https://assets4.lottiefiles.com/packages/lf20_rfDuEU.json',
              height: 600.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 250,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: ColorResource.color222222,
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
                                    color: ColorResource.colorFFFFFF,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 25),
                              const Text(
                                'M2P Fintech,\n3rd Floor, MM Complex, \n30/10, Hopman Street 2nd Street,\nAlandur, Chennai - 600016.TamilNadu. \nIndia',
                                style:
                                    TextStyle(color: ColorResource.colorFFFFFF),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                'ping@m2pfintech.com',
                                style:
                                    TextStyle(color: ColorResource.colorFFFFFF),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Mumbai, INDIA',
                                style: TextStyle(
                                    color: ColorResource.colorFFFFFF,
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
                                style:
                                    TextStyle(color: ColorResource.colorFFFFFF),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Abu Dhabi, UAE',
                                style: TextStyle(
                                    color: ColorResource.colorFFFFFF,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'M2P Solutions Ltd,\nOffice No.2452, 24 - Al Sila Tower, \nAbu Dhabi Global Market Square,\nAl Maryah Island\nAbu Dhabi,\nUnited Arab Emirates.',
                                style:
                                    TextStyle(color: ColorResource.colorffffff),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                '© 2021 M2P Fintech',
                                style:
                                    TextStyle(color: ColorResource.colorFFFFFF),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dubai, UAE',
                                style: TextStyle(
                                    color: ColorResource.colorFFFFFF,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'M2P Solutions Ltd,\nSuite 105-106, \nBuilding 1, Bay Square,\nBusiness Bay,\nDubai.',
                                style:
                                    TextStyle(color: ColorResource.colorffffff),
                              ),
                              const SizedBox(
                                height: 55,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Legal   ',
                                    style: TextStyle(
                                        color: ColorResource.colorFFFFFF),
                                  ),
                                  const Text(
                                    ' Privacy policy',
                                    style: TextStyle(
                                        color: ColorResource.colorFFFFFF),
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
                                        ? ColorResource.color1976d2
                                        : ColorResource.colorFFFFFF,
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
                                        ? ColorResource.color42a5f5
                                        : ColorResource.colorFFFFFF,
                                    size: 20.0),
                                onTap: () async {
                                  const url =
                                      "https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D";
                                  await launch(url);
                                },
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
                                        ? ColorResource.colorec407a
                                        : ColorResource.colorFFFFFF,
                                    size: 20.0),
                                onTap: () async {
                                  const url =
                                      'https://www.instagram.com/accounts/login/';
                                  await launch(url);
                                },
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
                                        ? ColorResource.color1e88e5
                                        : ColorResource.colorFFFFFF,
                                    size: 20.0),
                                onTap: () async {
                                  const url = "https://www.facebook.com/";
                                  await launch(url);
                                },
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
                                        color: ColorResource.colorEC1C24,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.arrow_upward,
                                      color: ColorResource.colorFFFFFF,
                                    )),
                                onTap: () {
                                  _scrollToTop();
                                },
                              ),
                            ],
                          )
                        ])))));
  }
}
