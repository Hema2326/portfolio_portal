import 'package:flutter/material.dart';
import 'package:portfolio_portal/screens/custom_screen.dart';
import 'package:portfolio_portal/screens/large_screen.dart';
import 'package:portfolio_portal/screens/medium_screen.dart';
import 'package:portfolio_portal/screens/small_screen.dart';
import 'package:portfolio_portal/widgets/responsive_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
    key: scaffoldKey,
      extendBodyBehindAppBar: true,
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
                    color: isHovering ? Colors.orangeAccent : Colors.black),
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
                    color: isHovering1 ? Colors.orangeAccent : Colors.black),
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
                'Services',
                style: TextStyle(
                    color: isHovering2 ? Colors.orangeAccent : Colors.black),
              ),
            ),
            SizedBox(
              width: screenSize.width / 20,
            ),


          ],
        ),
      ),
    ),
body: ResponsiveWidget(
    largeScreen: LargeScreen(),
    mediumScreen: MediumScreen(),
    smallScreen: SmallScreen(),
    customScreen: CustomScreen()),
    );
  }
}
