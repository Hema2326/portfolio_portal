import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_portal/screens/app_bar.dart';

class SmallScreen extends StatefulWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  _SmallScreenState createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Image.asset(
              'assets/logo1.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isHovering = value;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.redAccent),
                ),
                child: Text(
                  'Home',
                  style: TextStyle(
                      color: isHovering ? Colors.red : Colors.black,
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
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isHovering1 = value;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.redAccent),
                ),
                child: Text(
                  'Portfolio',
                  style: TextStyle(
                      color: isHovering1 ? Colors.red : Colors.black,
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
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isHovering2 = value;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.redAccent),
                ),
                child: Text(
                  'Projects',
                  style: TextStyle(
                      color: isHovering2 ? Colors.red : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width / 20,
              height: 30,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100),
            Lottie.network(
              'https://assets4.lottiefiles.com/packages/lf20_rfDuEU.json',
              height: 600.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
