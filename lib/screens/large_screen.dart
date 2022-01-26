import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/widgets/flip_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

import '../models.dart/models.dart';
import '../widgets/draw_clip.dart';
import 'custom_screen.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen>
    with TickerProviderStateMixin {
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
  bool isSelected4 = false;

  TabController? _tabController;

  late AnimationController _controller;

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
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 3);
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -3,
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    controller.dispose();
    arrow.dispose();
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
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(70, 40, 0, 0),
                child: Image.asset(
                  'assets/flutterlogo.png',
                  width: 60,
                ),
              ),
            ],
          ),
        ),
        body: Column(children: [
          Row(
            children: [
              const Text(''),
              const Spacer(),
              Flexible(
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                  child: TabBar(
                      controller: _tabController,
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      indicatorColor: Colors.lightBlueAccent,
                      labelColor: Colors.black,
                      tabs: [
                        const Tab(
                          text: 'Home',
                        ),
                        const Tab(text: 'Portfolio'),
                        const Tab(text: 'Projects'),
                      ]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlueAccent,
            child: Center(
              child: Marquee(
                text:
                    'Flutter is Google’s free and open-source UI framework for creating native mobile applications. Released in 2017, Flutter allows developers to build mobile applications for both iOS and Android with a single codebase and programming language. This capability makes building iOS and Android apps simpler and faster.',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Flexible(
            child: TabBarView(controller: _tabController, children: [
              const PortfolioScreen(),
              SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Image.asset(
                      'assets/flutter-engage.png',
                      fit: BoxFit.fill,
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ]),
                  Center(
                    child: Container(
                      height: 500,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: CarouselSlider(
                          items: [
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 150,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.lightBlue),
                                      child: const Center(
                                          child: const Text(
                                        'Fast',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  const Spacer(),
                                  Container(
                                    color: Colors.white,
                                    // padding: const EdgeInsets.only(bottom: 20),
                                    child: Lottie.network(
                                      'https://assets1.lottiefiles.com/packages/lf20_w7401juf.json',
                                      height: 400.0,
                                      width: 500,
                                      repeat: true,
                                      reverse: true,
                                      animate: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 150,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.lightBlue),
                                      child: const Center(
                                          child: const Text(
                                        'Multi Plateform',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  const Spacer(),
                                  Container(
                                    color: Colors.white,
                                    // padding: const EdgeInsets.only(bottom: 20),
                                    child: Lottie.network(
                                      'https://assets3.lottiefiles.com/packages/lf20_awhygdgw.json',
                                      height: 400.0,
                                      width: 500,
                                      repeat: true,
                                      reverse: true,
                                      animate: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 150,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.lightBlue),
                                      child: const Center(
                                          child: const Text(
                                        'Plateform',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  const Spacer(),
                                  Container(
                                    color: Colors.white,
                                    // padding: const EdgeInsets.only(bottom: 20),
                                    child: Lottie.network(
                                      'https://assets2.lottiefiles.com/packages/lf20_lvgmrl5j.json',
                                      height: 400.0,
                                      width: 500,
                                      repeat: true,
                                      reverse: true,
                                      animate: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          //Slider Container properties
                          options: CarouselOptions(
                            autoPlayCurve: Curves.fastOutSlowIn,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            autoPlay: true,
                            viewportFraction: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.redAccent.shade100,
                            Colors.blueAccent,
                          ],
                        )),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Text('Get Started',
                            style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                              color: ColorResource.colorFFFFFF,
                              fontWeight: FontWeight.bold,
                            ))),
                        const SizedBox(height: 20),
                        Text(
                          'Instant access to the power of the Flutter framework',
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              color: ColorResource.colorFFFFFF,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            const url =
                                "https://docs.flutter.dev/get-started/install";
                            await launch(url);
                          },
                          child: Text(
                            'Install',
                            style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: ColorResource.colorFFFFFF,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
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
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.white,
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
                                        color: isSelected1
                                            ? Colors.black
                                            : Colors.white,
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
                                      const url =
                                          "https://twitter.com/flutterdev";
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
                                        color: isSelected4
                                            ? Colors.red
                                            : Colors.white,
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
                  ),
                ],
              )),
              const Icon(Icons.movie),
            ]),
          ),
        ]));
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
      PortfolioModel('assets/flutter-engage.png', 'Mari', onTap: () {
        print('dd');
      }

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MariScreen()),
          // );
          ),
      PortfolioModel('assets/flutter-engage.png', 'Chinnadurai', onTap: () {
        print('dd');
      }),
      PortfolioModel('assets/alexia.png', 'Alexia', onTap: () {
        print('dd');
      }),
      PortfolioModel('assets/flutter-engage.png', 'Hema', onTap: () {
        print('dd');
      }),
      PortfolioModel('assets/flutter-engage.png', 'Seema', onTap: () {
        print('dd');
      }),
      PortfolioModel('assets/flutter-engage.png', 'Nandhakumar', onTap: () {
        print('dd');
      }),
      PortfolioModel('assets/flutter-engage.png', 'Jones', onTap: () {
        print('dd');
      }),
    ];
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Positioned(
          left: 50,
          top: 70,
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
            digits[index].onTap;
            // '${digits[index].onTap}';
            // print("onItemTapCallback index: $index");
          },
          itemHeight: _itemHeight,
          itemCount: digits.length,
          child: ListWheelScrollView.useDelegate(
              itemExtent: _itemHeight,
              diameterRatio: 1,
              controller: controller,
              onSelectedItemChanged: (index) {
                '${digits[index].onTap}';
                // print("onSelectedItemChanged index: $index");
              },
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
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ),
        Positioned(
          right: 100,
          bottom: 90,
          child: FloatingActionButton.small(
            onPressed: () {},
            // digits[index].onTap,

            // onPressed: () {

            //   final nextIndex = controller.selectedItem + 1;

            //   controller.animateToItem(nextIndex,
            //       duration: const Duration(seconds: 1), curve: Curves.bounceIn);
            // },
            child: const Icon(Icons.arrow_forward_sharp),
          ),
        ),
      ],
      clipBehavior: Clip.hardEdge,
    );
  }
}

class MariScreen extends StatefulWidget {
  @override
  State<MariScreen> createState() => _MariScreenState();
}

class _MariScreenState extends State<MariScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
