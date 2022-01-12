import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MediumScreen extends StatefulWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  _MediumScreenState createState() => _MediumScreenState();
}

class _MediumScreenState extends State<MediumScreen> {
  late ScrollController _scrollController;
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;
  bool isHovering3 = false;

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
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 250,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
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
                          color: isHovering ? Colors.blue[700] : Colors.white,
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
                          color: isHovering1 ? Colors.blue[400] : Colors.white,
                          size: 20.0),
                      onTap: () {},
                      onHover: (value) {
                        setState(() {
                          isHovering1 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      child: FaIcon(FontAwesomeIcons.instagram,
                          color: isHovering2 ? Colors.pink[400] : Colors.white,
                          size: 20.0),
                      onTap: () {},
                      onHover: (value) {
                        setState(() {
                          isHovering2 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      child: FaIcon(FontAwesomeIcons.facebook,
                          color: isHovering3 ? Colors.blue[600] : Colors.white,
                          size: 20.0),
                      onTap: () {},
                      onHover: (value) {
                        setState(() {
                          isHovering3 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          )),
                      onTap: () {
                        _scrollToTop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
