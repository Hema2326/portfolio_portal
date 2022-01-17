import 'package:flutter/material.dart';
import 'package:portfolio_portal/screens/custom_screen.dart';
import 'package:portfolio_portal/screens/large_screen.dart';
import 'package:portfolio_portal/screens/medium_screen.dart';
import 'package:portfolio_portal/screens/small_screen.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/utils/string_resource.dart';
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
                          ? ColorResource.colorF58220
                          : ColorResource.color222222),
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
                          ? ColorResource.colorF58220
                          : ColorResource.color222222),
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
                          ? ColorResource.colorF58220
                          : ColorResource.color222222),
                ),
              ),
              SizedBox(
                width: screenSize.width / 20,
              ),
            ],
          ),
        ),
      ),
      body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          mediumScreen: MediumScreen(),
          smallScreen: SmallScreen(),
          customScreen: CustomScreen()),
    );
  }
}
