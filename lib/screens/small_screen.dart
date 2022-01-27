import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_portal/screens/large_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models.dart/models.dart';
import '../widgets/draw_clip.dart';
import '../widgets/flip_widget.dart';

class SmallScreen extends StatefulWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  _SmallScreenState createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style7,
      menuScreen: const SideBar(),
      mainScreen: const MainView(),
      borderRadius: 40.0,
      showShadow: true,
      angle: -12.0,
      backgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInOut,
    );
  }
}

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.blue[300],
      child: Column(
        children: [
          const SizedBox(height: 50),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isHovering = value;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PortfolioScreen()),
              );
            },
            onHover: (value) {
              setState(() {
                isHovering1 = value;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
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
              padding: const EdgeInsets.all(10),
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
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late ScrollController _scrollController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  late AnimationController _controller;

  double value = 0;

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.bounceIn,
  );

  late final AnimationController arrow = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _arrowAnimation =
      CurvedAnimation(parent: arrow, curve: Curves.easeInCubic);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -3,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    controller.dispose();
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
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => ZoomDrawer.of(context)!.toggle(),
                icon: const Icon(Icons.menu))),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(height: 100),
              ],
            ),
            Stack(
              children: [
                AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return ClipPath(
                          clipper: DrawClip(_controller.value),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 270,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.blue.shade600,
                                        Colors.blueAccent.shade100
                                      ]),
                                )),
                          ));
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://careers.google.com/jobs/results/?distance=50&hl=en_US&jlo=en_US&q=flutter";
                              await launch(url);
                            },
                            child: const Text(
                              'Careers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url = "https://medium.com/flutter";
                              await launch(url);
                            },
                            child: const Text(
                              'News',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url = "https://flutter.dev/brand";
                              await launch(url);
                            },
                            child: const Text(
                              'Brand',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url = "https://flutter.dev/culture";
                              await launch(url);
                            },
                            child: const Text(
                              'Culture',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://flutter.dev/multi-platform/mobile";
                              await launch(url);
                            },
                            child: const Text(
                              'Mobile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://flutter.dev/multi-platform/web";
                              await launch(url);
                            },
                            child: const Text(
                              'Web',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://flutter.dev/multi-platform/desktop";
                              await launch(url);
                            },
                            child: const Text(
                              'Desktop',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  "https://flutter.dev/multi-platform/embedded";
                              await launch(url);
                            },
                            child: const Text(
                              'Embedded',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Column(
                        children: [
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.medium,
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url = "https://medium.com/flutter";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.meetup,
                                  color: isSelected2
                                      ? Colors.red[700]
                                      : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url =
                                    "https://www.meetup.com/pro/flutter/";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected2 = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.github,
                                  color:
                                      isSelected1 ? Colors.black : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url = "https://github.com/flutter";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected1 = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.twitter,
                                  color: isSelected3
                                      ? Colors.blue[400]
                                      : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url = "https://twitter.com/flutterdev";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected3 = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotationTransition(
                            turns: _animation,
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.youtube,
                                  color:
                                      isSelected4 ? Colors.red : Colors.white,
                                  size: 25.0),
                              onTap: () async {
                                const url =
                                    "https://www.youtube.com/flutterdev";
                                await launch(url);
                              },
                              onHover: (value) {
                                setState(() {
                                  isSelected4 = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 70,
                  child: RotationTransition(
                    turns: _arrowAnimation,
                    child: InkWell(
                      child: const Icon(
                        Icons.arrow_circle_up,
                        color: Colors.white,
                      ),
                      onTap: () {
                        _scrollToTop();
                      },
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late FixedExtentScrollController controller;
  static const double _itemHeight = 300;
  static const int _itemCount = 100;

  @override
  void initState() {
    controller = FixedExtentScrollController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<PortfolioModel> digits = [
      PortfolioModel('assets/flutter-engage.png', 'Mari'),
      PortfolioModel('assets/flutter-engage.png', 'Chinnadurai'),
      PortfolioModel('assets/alexia.png', 'Alexia'),
      PortfolioModel('assets/flutter-engage.png', 'Hema'),
      PortfolioModel('assets/flutter-engage.png', 'Seema'),
      PortfolioModel('assets/flutter-engage.png', 'Nandhakumar'),
      PortfolioModel('assets/flutter-engage.png', 'Jones'),
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade600,
              Colors.blueAccent.shade100,
              Colors.pink
            ]),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            left: 40,
            top: 40,
            child: Container(
              color: Colors.black,
              child: FlipPanel.builder(
                itemBuilder: (context, index) => Container(
                  width: 106.0,
                  height: 128.0,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          '${digits[index].image}',
                          fit: BoxFit.fill,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          '${digits[index].name}',
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.yellow),
                        ),
                      ),
                    ],
                  ),
                ),
                itemsCount: digits.length,
                period: const Duration(milliseconds: 1000),
                loop: -1,
              ),
            ),
          ),
          ClickableListWheelScrollView(
            scrollController: controller,
            onItemTapCallback: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MariScreen()),
                  );
                  break;

                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChinnaduraiScreen()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlexiaScreen()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HemaScreen()),
                  );
                  break;
                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeemaScreen()),
                  );
                  break;
                case 5:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NadhaScreen()),
                  );
                  break;
                case 6:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JonesScreen()),
                  );
                  break;

                default:
              }
            },
            itemHeight: _itemHeight,
            itemCount: digits.length,
            child: ListWheelScrollView.useDelegate(
                itemExtent: _itemHeight,
                diameterRatio: 1,
                controller: controller,
                onSelectedItemChanged: (index) {},
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: digits.length,
                    builder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              '${digits[index].image}',
                              fit: BoxFit.fill,
                              height: 250,
                              width: 250,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${digits[index].name}',
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
          ),
        ],
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
