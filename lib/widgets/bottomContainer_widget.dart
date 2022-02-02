import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_portal/widgets/draw_clip.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomContainerWidget extends StatefulWidget {
  const BottomContainerWidget({Key? key}) : super(key: key);

  @override
  State<BottomContainerWidget> createState() => _BottomContainerWidgetState();
}

class _BottomContainerWidgetState extends State<BottomContainerWidget>
    with TickerProviderStateMixin {
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

  @override
  void initState() {
    super.initState();

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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  buildBottomDetails(
                    'Career',
                    "https://careers.google.com/jobs/results/?distance=50&hl=en_US&jlo=en_US&q=flutter",
                  ),
                  const SizedBox(height: 20),
                  buildBottomDetails('News', "https://medium.com/flutter"),
                  const SizedBox(height: 20),
                  buildBottomDetails('Brand', "https://flutter.dev/brand"),
                  const SizedBox(height: 20),
                  buildBottomDetails('Culture', "https://flutter.dev/culture"),
                  const SizedBox(height: 20),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBottomDetails(
                      'Mobile', "https://flutter.dev/multi-platform/mobile"),
                  const SizedBox(height: 20),
                  buildBottomDetails(
                      'Web', "https://flutter.dev/multi-platform/web"),
                  const SizedBox(height: 20),
                  buildBottomDetails(
                      'Desktop', "https://flutter.dev/multi-platform/desktop"),
                  const SizedBox(height: 20),
                  buildBottomDetails('Embedded',
                      "https://flutter.dev/multi-platform/embedded"),
                  const SizedBox(height: 20),
                ],
              ),
              Column(
                children: [
                  RotationTransition(
                    turns: _animation,
                    child: InkWell(
                      child: FaIcon(FontAwesomeIcons.medium,
                          color: isSelected ? Colors.black : Colors.white,
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
                          color: isSelected2 ? Colors.red[700] : Colors.white,
                          size: 25.0),
                      onTap: () async {
                        const url = "https://www.meetup.com/pro/flutter/";
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
                          color: isSelected1 ? Colors.black : Colors.white,
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
                          color: isSelected3 ? Colors.blue[400] : Colors.white,
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
                          color: isSelected4 ? Colors.red : Colors.white,
                          size: 25.0),
                      onTap: () async {
                        const url = "https://www.youtube.com/flutterdev";
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
      ],
    );
  }

  Widget buildBottomDetails(String title, String url) {
    return GestureDetector(
      onTap: () async {
        await launch(url);
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
