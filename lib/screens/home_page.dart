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

  final PageStorageBucket _bucket = PageStorageBucket();

  ScrollController? _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController!.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // _opacity = _scrollPosition < screenSize.height * 0.40
    //     ? _scrollPosition / (screenSize.height * 0.40)
    //     : 1;
    return Scaffold(
      backgroundColor: ColorResource.colorFFFFFF,
      // key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 20,
        toolbarOpacity: 0.8,
        backgroundColor: ColorResource.colorFFFFFF,
        elevation: 7,
      ),
      body: PageStorage(
        bucket: _bucket,
        child: const ResponsiveWidget(
            largeScreen: LargeScreen(
              key: PageStorageKey('view'),
            ),
            mediumScreen: MediumScreen(
              key: PageStorageKey('view1'),
            ),
            smallScreen: SmallScreen(key: PageStorageKey('view2')),
            customScreen: CustomScreen(key: PageStorageKey('view3'))),
      ),
    );
  }
}
