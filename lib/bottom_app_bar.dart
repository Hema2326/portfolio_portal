import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;

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
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 250,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chennai, INDIA',
                    ),
                    SizedBox(height: 20),
                    Text(
                        'M2P Fintech,\n3rd Floor, MM Complex, \n30/10, Hopman Street 2nd Street,\nAlandur, Chennai - 600016.TamilNadu. \nIndia'),
                    SizedBox(
                      height: 50,
                    ),
                    Text('ping@m2pfintech.com')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chennai, INDIA'),
                    SizedBox(height: 20),
                    Text(
                        'M2P Fintech,\n3rd Floor, MM Complex, \n30/10, Hopman Street 2nd Street,\nAlandur, Chennai - 600016.TamilNadu. \nIndia'),
                    SizedBox(
                      height: 50,
                    ),
                    Text('044-40554808')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chennai, INDIA'),
                    SizedBox(height: 20),
                    Text(
                        'M2P Fintech,\n3rd Floor, MM Complex, \n30/10, Hopman Street 2nd Street,\nAlandur, Chennai - 600016.TamilNadu. \nIndia'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chennai, INDIA'),
                    SizedBox(height: 20),
                    Text(
                        'M2P Fintech,\n3rd Floor, MM Complex, \n30/10, Hopman Street 2nd Street,\nAlandur, Chennai - 600016.TamilNadu. \nIndia'),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        child: FaIcon(FontAwesomeIcons.linkedin,
                            color: Colors.white, size: 20.0),
                        onTap: () {}),
                    GestureDetector(
                        child: FaIcon(FontAwesomeIcons.twitter,
                            color: Colors.white, size: 20.0),
                        onTap: () {}),
                    GestureDetector(
                        child: FaIcon(FontAwesomeIcons.instagram,
                            color: Colors.white, size: 20.0),
                        onTap: () {}),
                    GestureDetector(
                        child: FaIcon(FontAwesomeIcons.facebook,
                            color: Colors.white, size: 20.0),
                        onTap: () {}),
                  ],
                ),
                IconButton(
                  icon: Container(
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    _scrollToTop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
