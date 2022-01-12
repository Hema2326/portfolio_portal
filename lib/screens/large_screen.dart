import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_portal/screens/app_bar.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar:
         PreferredSize(
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
                    style:
                        TextStyle(color: isHovering ? Colors.red : Colors.black,fontSize: 18,fontWeight: FontWeight.w600),
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
                    style:
                        TextStyle(color: isHovering1 ? Colors.red : Colors.black,fontSize: 18,fontWeight: FontWeight.w600),
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
                    style:
                        TextStyle(color: isHovering2 ? Colors.red : Colors.black,fontSize: 18,fontWeight: FontWeight.w600),
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
    );
  }
}
