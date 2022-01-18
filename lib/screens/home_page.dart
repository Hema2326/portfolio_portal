import 'package:flutter/material.dart';
import 'package:portfolio_portal/screens/custom_screen.dart';
import 'package:portfolio_portal/screens/large_screen.dart';
import 'package:portfolio_portal/screens/medium_screen.dart';
import 'package:portfolio_portal/screens/small_screen.dart';
import 'package:portfolio_portal/utils/color_resource.dart';

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
      backgroundColor: ColorResource.colorFFFFFF,
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 20,
        toolbarOpacity: 0.8,
        backgroundColor: ColorResource.colorFFFFFF,
        elevation: 7,
      ),
      body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          mediumScreen: MediumScreen(),
          smallScreen: SmallScreen(),
          customScreen: CustomScreen()),
    );
  }
}
