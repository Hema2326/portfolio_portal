// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:portfolio_portal/screens/app_bar.dart';
// import 'dart:math' as math;

// class SmallScreen extends StatefulWidget {
//   const SmallScreen({Key? key}) : super(key: key);

//   @override
//   _SmallScreenState createState() => _SmallScreenState();
// }

// class _SmallScreenState extends State<SmallScreen>
//     with TickerProviderStateMixin {
//   late ScrollController _scrollController;

//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
//   bool isHovering = false;
//   bool isHovering1 = false;
//   bool isHovering2 = false;
//   bool isSelected = false;
//   bool isSelected1 = false;
//   bool isSelected2 = false;
//   bool isSelected3 = false;
//   bool isSelected4 = false;
//   late AnimationController _controller;

//   late final AnimationController controller = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   )..repeat(reverse: true);

//   late final Animation<double> _animation = CurvedAnimation(
//     parent: controller,
//     curve: Curves.bounceIn,
//   );

//   late final AnimationController arrow = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   )..repeat(reverse: true);
//   late final Animation<double> _arrowAnimation =
//       CurvedAnimation(parent: arrow, curve: Curves.easeInCubic);

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();

//     _controller = AnimationController(
//       value: 0.0,
//       duration: const Duration(seconds: 25),
//       upperBound: 1,
//       lowerBound: -3,
//       vsync: this,
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     controller.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   _scrollToTop() {
//     _scrollController.animateTo(_scrollController.position.minScrollExtent,
//         duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//         key: scaffoldKey,
//         extendBodyBehindAppBar: true,
//         appBar: topNavigationBar(context, scaffoldKey),
//         drawer: Drawer(
//           backgroundColor: Colors.white,
//           child: Column(
//             children: [
//               Image.asset(
//                 'assets/logo1.png',
//                 height: 150,
//                 width: 150,
//               ),
//               const SizedBox(height: 50),
//               InkWell(
//                 onTap: () {},
//                 onHover: (value) {
//                   setState(() {
//                     isHovering = value;
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.redAccent),
//                   ),
//                   child: Text(
//                     'Home',
//                     style: TextStyle(
//                         color: isHovering ? Colors.red : Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: screenSize.width / 20,
//                 height: 30,
//               ),
//               InkWell(
//                 onTap: () {},
//                 onHover: (value) {
//                   setState(() {
//                     isHovering1 = value;
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.redAccent),
//                   ),
//                   child: Text(
//                     'Portfolio',
//                     style: TextStyle(
//                         color: isHovering1 ? Colors.red : Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: screenSize.width / 20,
//                 height: 30,
//               ),
//               InkWell(
//                 onTap: () {},
//                 onHover: (value) {
//                   setState(() {
//                     isHovering2 = value;
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.redAccent),
//                   ),
//                   child: Text(
//                     'Projects',
//                     style: TextStyle(
//                         color: isHovering2 ? Colors.red : Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: screenSize.width / 20,
//                 height: 30,
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(height: 100),
//               ],
//             ),
//             Stack(
//               children: [
//                 AnimatedBuilder(
//                     animation: _controller,
//                     builder: (BuildContext context, Widget? child) {
//                       return ClipPath(
//                           clipper: DrawClip(_controller.value),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                                 height: 270,
//                                 width: double.maxFinite,
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                       begin: Alignment.bottomLeft,
//                                       end: Alignment.topRight,
//                                       colors: [
//                                         Colors.blue.shade600,
//                                         Colors.blueAccent.shade100
//                                       ]),
//                                 )),
//                           ));
//                     }),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://careers.google.com/jobs/results/?distance=50&hl=en_US&jlo=en_US&q=flutter";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Careers',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url = "https://medium.com/flutter";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'News',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url = "https://flutter.dev/brand";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Brand',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url = "https://flutter.dev/culture";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Culture',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://flutter.dev/multi-platform/mobile";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Mobile',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://flutter.dev/multi-platform/web";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Web',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://flutter.dev/multi-platform/desktop";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Desktop',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://flutter.dev/multi-platform/embedded";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Embedded',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.medium,
//                                   color:
//                                       isSelected ? Colors.black : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url = "https://medium.com/flutter";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.meetup,
//                                   color: isSelected2
//                                       ? Colors.red[700]
//                                       : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url =
//                                     "https://www.meetup.com/pro/flutter/";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected2 = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.github,
//                                   color:
//                                       isSelected1 ? Colors.black : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url = "https://github.com/flutter";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected1 = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.twitter,
//                                   color: isSelected3
//                                       ? Colors.blue[400]
//                                       : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url = "https://twitter.com/flutterdev";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected3 = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.youtube,
//                                   color:
//                                       isSelected4 ? Colors.red : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url =
//                                     "https://www.youtube.com/flutterdev";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected4 = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   right: 30,
//                   bottom: 70,
//                   child: RotationTransition(
//                     turns: _arrowAnimation,
//                     child: InkWell(
//                       child: const Icon(
//                         Icons.arrow_circle_up,
//                         color: Colors.white,
//                       ),
//                       onTap: () {
//                         _scrollToTop();
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ]),
//         ));
//   }
// }

// class DrawClip extends CustomClipper<Path> {
//   double move = 0;
//   double slice = math.pi;
//   DrawClip(this.move);
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.lineTo(0, size.height * 0.6);

//     double xCenter =
//         size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
//     double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
//     path.quadraticBezierTo(
//       xCenter,
//       yCenter,
//       size.width,
//       size.height * 0.8,
//     );

//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:portfolio_portal/screens/app_bar.dart';
// import 'dart:math' as math;

// class SmallScreen extends StatefulWidget {
//   const SmallScreen({Key? key}) : super(key: key);

//   @override
//   _SmallScreenState createState() => _SmallScreenState();
// }

// class _SmallScreenState extends State<SmallScreen>
//     with TickerProviderStateMixin {
//   late ScrollController _scrollController;

//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
//   bool isHovering = false;
//   bool isHovering1 = false;
//   bool isHovering2 = false;
//   bool isSelected = false;
//   bool isSelected1 = false;
//   bool isSelected2 = false;
//   bool isSelected3 = false;
//   bool isSelected4 = false;
//   late AnimationController _controller;

//   late final AnimationController controller = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   )..repeat(reverse: true);

//   late final Animation<double> _animation = CurvedAnimation(
//     parent: controller,
//     curve: Curves.bounceIn,
//   );

//   late final AnimationController arrow = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   )..repeat(reverse: true);
//   late final Animation<double> _arrowAnimation =
//       CurvedAnimation(parent: arrow, curve: Curves.easeInCubic);

//   var _maxSlide = 0.75;
//   var _extraHeight = 0.1;
//   late double _startingPos;
//   var _drawerVisible = false;
//   late AnimationController _animationController;
//   Size _screen = const Size(0, 0);
//   late CurvedAnimation _animator;
//   late CurvedAnimation _objAnimator;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();

//     _controller = AnimationController(
//       value: 0.0,
//       duration: const Duration(seconds: 25),
//       upperBound: 1,
//       lowerBound: -3,
//       vsync: this,
//     )..repeat();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _animator = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOutQuad,
//       reverseCurve: Curves.easeInQuad,
//     );
//     _objAnimator = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//       reverseCurve: Curves.easeIn,
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     _screen = MediaQuery.of(context).size;
//     _maxSlide *= _screen.width;
//     _extraHeight *= _screen.height;
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     controller.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   _scrollToTop() {
//     _scrollController.animateTo(_scrollController.position.minScrollExtent,
//         duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: GestureDetector(
//         onHorizontalDragStart: _onDragStart,
//         onHorizontalDragUpdate: _onDragUpdate,
//         onHorizontalDragEnd: _onDragEnd,
//         child: Stack(
//           clipBehavior: Clip.antiAlias, children: <Widget>[
//             //Space color - it also makes the empty space touchable
//             Container(color: const Color(0xFFaaa598)),
//             _buildBackground(),
//             // _build3dObject(),
//             _buildDrawer(),
//             _buildHeader(),
//             _buildOverlay(),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onDragStart(DragStartDetails details) {
//     _startingPos = details.globalPosition.dx;
//   }

//   void _onDragUpdate(DragUpdateDetails details) {
//     final globalDelta = details.globalPosition.dx - _startingPos;
//     if (globalDelta > 0) {
//       final pos = globalDelta / _screen.width;
//       if (_drawerVisible && pos <= 1.0) return;
//       _animationController.value = pos;
//     } else {
//       final pos = 1 - (globalDelta.abs() / _screen.width);
//       if (!_drawerVisible && pos >= 0.0) return;
//       _animationController.value = pos;
//     }
//   }

//   void _onDragEnd(DragEndDetails details) {
//     if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
//       if (details.velocity.pixelsPerSecond.dx > 0) {
//         _animationController.forward(from: _animationController.value);
//         _drawerVisible = true;
//       } else {
//         _animationController.reverse(from: _animationController.value);
//         _drawerVisible = false;
//       }
//       return;
//     }
//     if (_animationController.value > 0.5) {
//       {
//         _animationController.forward(from: _animationController.value);
//         _drawerVisible = true;
//       }
//     } else {
//       {
//         _animationController.reverse(from: _animationController.value);
//         _drawerVisible = false;
//       }
//     }
//   }

//   void _toggleDrawer() {
//     if (_animationController.value < 0.5) {
//       _animationController.forward();
//     } else {
//       _animationController.reverse();
//     }
//   }

//   _buildMenuItem(String s, {bool active = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: InkWell(
//         onTap: () {},
//         child: Text(
//           s.toUpperCase(),
//           style: TextStyle(
//             fontSize: 25,
//             color: active ? const Color(0xffbb0000) : null,
//             fontWeight: FontWeight.w900,
//           ),
//         ),
//       ),
//     );
//   }

//   _buildFooterMenuItem(String s) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: InkWell(
//         onTap: () {},
//         child: Text(
//           s.toUpperCase(),
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w900,
//           ),
//         ),
//       ),
//     );
//   }

//   _buildBackground() => Positioned.fill(
//         top: -_extraHeight,
//         bottom: -_extraHeight,
//         child: AnimatedBuilder(
//           animation: _animator,
//           builder: (context, widget) => Transform.translate(
//             offset: Offset(_maxSlide * _animator.value, 0),
//             child: Transform(
//               transform: Matrix4.identity()
//                 ..setEntry(3, 2, 0.001)
//                 ..rotateY((pi / 2 + 0.1) * -_animator.value),
//               alignment: Alignment.centerLeft,
//               child: widget,
//             ),
//           ),
//           child: Container(
//             color: const Color(0xffe8dfce),
//             child: Stack(
//               overflow: Overflow.visible,
//               children: <Widget>[
//                 //Fender word
//                 Positioned(
//                   top: _extraHeight + 0.1 * _screen.height,
//                   left: 80,
//                   child: Transform.rotate(
//                     angle: 90 * (pi / 180),
//                     alignment: Alignment.centerLeft,
//                     child: const Text(
//                       "FENDER",
//                       style: TextStyle(
//                         fontSize: 100,
//                         color: Color(0xFFc7c0b2),
//                         shadows: [
//                           Shadow(
//                             color: Colors.black26,
//                             blurRadius: 5,
//                             offset: Offset(2.0, 0.0),
//                           ),
//                         ],
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Shadow
//                 Positioned(
//                   top: _extraHeight + 0.13 * _screen.height,
//                   bottom: _extraHeight + 0.24 * _screen.height,
//                   left: _maxSlide - 0.41 * _screen.width,
//                   right: _screen.width * 1.06 - _maxSlide,
//                   child: Column(
//                     children: <Widget>[
//                       Flexible(
//                         child: FractionallySizedBox(
//                           widthFactor: 0.2,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               boxShadow: [
//                                 const BoxShadow(
//                                   blurRadius: 50,
//                                   color: Colors.black38,
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Flexible(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               const BoxShadow(
//                                 blurRadius: 50,
//                                 color: Colors.black26,
//                               )
//                             ],
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 AnimatedBuilder(
//                   animation: _animator,
//                   builder: (_, __) => Container(
//                     color: Colors.black.withAlpha(
//                       (150 * _animator.value).floor(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );

//   _buildDrawer() => Positioned.fill(
//         top: -_extraHeight,
//         bottom: -_extraHeight,
//         left: 0,
//         right: _screen.width - _maxSlide,
//         child: AnimatedBuilder(
//           animation: _animator,
//           builder: (context, widget) {
//             return Transform.translate(
//               offset: Offset(_maxSlide * (_animator.value - 1), 0),
//               child: Transform(
//                 transform: Matrix4.identity()
//                   ..setEntry(3, 2, 0.001)
//                   ..rotateY(pi * (1 - _animator.value) / 2),
//                 alignment: Alignment.centerRight,
//                 child: widget,
//               ),
//             );
//           },
//           child: Container(
//             color: const Color(0xffe8dfce),
//             child: Stack(
//               overflow: Overflow.visible,
//               children: <Widget>[
//                 Positioned(
//                   top: 0,
//                   bottom: 0,
//                   right: 0,
//                   child: Container(
//                     width: 5,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.transparent, Colors.black12],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   top: _extraHeight,
//                   bottom: _extraHeight,
//                   child: SafeArea(
//                     child: Container(
//                       width: _maxSlide,
//                       child: Padding(
//                         padding: const EdgeInsets.all(40.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Row(
//                               children: <Widget>[
//                                 Container(
//                                   width: 25,
//                                   height: 25,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: Colors.black26,
//                                       width: 4,
//                                     ),
//                                     shape: BoxShape.circle,
//                                   ),
//                                 ),
//                                 Transform.translate(
//                                   offset: const Offset(-15, 0),
//                                   child: const Text(
//                                     "STRING",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       backgroundColor: Color(0xffe8dfce),
//                                       fontWeight: FontWeight.w900,
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 _buildMenuItem("Guitars", active: true),
//                                 _buildMenuItem("Basses"),
//                                 _buildMenuItem("Amps"),
//                                 _buildMenuItem("Pedals"),
//                                 _buildMenuItem("Others"),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 _buildFooterMenuItem("About"),
//                                 _buildFooterMenuItem("Support"),
//                                 _buildFooterMenuItem("Terms"),
//                                 _buildFooterMenuItem("Faqs"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 AnimatedBuilder(
//                   animation: _animator,
//                   builder: (_, __) => Container(
//                     width: _maxSlide,
//                     color: Colors.black.withAlpha(
//                       (150 * (1 - _animator.value)).floor(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );

//   // _build3dObject() => Positioned(
//   //       top: 0.1 * _screen.height,
//   //       bottom: 0.22 * _screen.height,
//   //       left: _maxSlide - _screen.width * 0.5,
//   //       right: _screen.width * 0.85 - _maxSlide,
//   //       child: AnimatedBuilder(
//   //         animation: _objAnimator,
//   //         builder: (_, __) => ImageSequenceAnimator(
//   //           "assets/guitarSequence", //folderName
//   //           "", //fileName
//   //           1, //suffixStart
//   //           4, //suffixCount
//   //           "png", //fileFormat
//   //           120, //frameCount
//   //           fps: 60,
//   //           isLooping: false,
//   //           isBoomerang: true,
//   //           isAutoPlay: false,
//   //           frame: (_objAnimator.value * 120).ceil(),
//   //         ),
//   //       ),
//   //     );

//   _buildHeader() => SafeArea(
//         child: AnimatedBuilder(
//             animation: _animator,
//             builder: (_, __) {
//               return Transform.translate(
//                 offset: Offset((_screen.width - 60) * _animator.value, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 50,
//                       height: 50,
//                       child: InkWell(
//                         onTap: _toggleDrawer,
//                         child: const Icon(Icons.menu),
//                       ),
//                     ),
//                     Opacity(
//                       opacity: 1 - _animator.value,
//                       child: const Text(
//                         "PRODUCT DETAIL",
//                         style: TextStyle(fontWeight: FontWeight.w900),
//                       ),
//                     ),
//                     const SizedBox(width: 50, height: 50),
//                   ],
//                 ),
//               );
//             }),
//       );

//   _buildOverlay() => Positioned(
//         top: 0,
//         bottom: 50,
//         left: 0,
//         right: 0,
//         child: AnimatedBuilder(
//           animation: _animator,
//           builder: (_, widget) => Opacity(
//             opacity: 1 - _animator.value,
//             child: Transform.translate(
//               offset: Offset((_maxSlide + 50) * _animator.value, 0),
//               child: Transform(
//                 transform: Matrix4.identity()
//                   ..setEntry(3, 2, 0.001)
//                   ..rotateY((pi / 2 + 0.1) * -_animator.value),
//                 alignment: Alignment.centerLeft,
//                 child: widget,
//               ),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 50.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 const Text(
//                   "Fender\nAmerican\nElite Strat",
//                   style: const TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//                 Row(
//                   children: <Widget>[
//                     const Text(
//                       "SPEC",
//                       style: const TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                     const Icon(Icons.keyboard_arrow_down),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
// }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//         key: scaffoldKey,
//         extendBodyBehindAppBar: true,
//         appBar: topNavigationBar(context, scaffoldKey),
//         drawer: Drawer(
//           backgroundColor: Colors.white,
//           child: Column(
//             children: [
//               Image.asset(
//                 'assets/logo1.png',
//                 height: 150,
//                 width: 150,
//               ),
//               const SizedBox(height: 50),
//               InkWell(
//                 onTap: () {},
//                 onHover: (value) {
//                   setState(() {
//                     isHovering = value;
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.redAccent),
//                   ),
//                   child: Text(
//                     'Home',
//                     style: TextStyle(
//                         color: isHovering ? Colors.red : Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: screenSize.width / 20,
//                 height: 30,
//               ),
//               InkWell(
//                 onTap: () {},
//                 onHover: (value) {
//                   setState(() {
//                     isHovering1 = value;
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.redAccent),
//                   ),
//                   child: Text(
//                     'Portfolio',
//                     style: TextStyle(
//                         color: isHovering1 ? Colors.red : Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: screenSize.width / 20,
//                 height: 30,
//               ),
//               InkWell(
//                 onTap: () {},
//                 onHover: (value) {
//                   setState(() {
//                     isHovering2 = value;
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.redAccent),
//                   ),
//                   child: Text(
//                     'Projects',
//                     style: TextStyle(
//                         color: isHovering2 ? Colors.red : Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: screenSize.width / 20,
//                 height: 30,
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(height: 100),
//               ],
//             ),
//             Stack(
//               children: [
//                 AnimatedBuilder(
//                     animation: _controller,
//                     builder: (BuildContext context, Widget? child) {
//                       return ClipPath(
//                           clipper: DrawClip(_controller.value),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                                 height: 270,
//                                 width: double.maxFinite,
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                       begin: Alignment.bottomLeft,
//                                       end: Alignment.topRight,
//                                       colors: [
//                                         Colors.blue.shade600,
//                                         Colors.blueAccent.shade100
//                                       ]),
//                                 )),
//                           ));
//                     }),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://careers.google.com/jobs/results/?distance=50&hl=en_US&jlo=en_US&q=flutter";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Careers',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url = "https://medium.com/flutter";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'News',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url = "https://flutter.dev/brand";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Brand',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url = "https://flutter.dev/culture";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Culture',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://flutter.dev/multi-platform/mobile";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Mobile',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://flutter.dev/multi-platform/web";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Web',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://flutter.dev/multi-platform/desktop";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Desktop',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               const url =
//                                   "https://flutter.dev/multi-platform/embedded";
//                               await launch(url);
//                             },
//                             child: const Text(
//                               'Embedded',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.medium,
//                                   color:
//                                       isSelected ? Colors.black : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url = "https://medium.com/flutter";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.meetup,
//                                   color: isSelected2
//                                       ? Colors.red[700]
//                                       : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url =
//                                     "https://www.meetup.com/pro/flutter/";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected2 = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.github,
//                                   color:
//                                       isSelected1 ? Colors.black : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url = "https://github.com/flutter";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected1 = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.twitter,
//                                   color: isSelected3
//                                       ? Colors.blue[400]
//                                       : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url = "https://twitter.com/flutterdev";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected3 = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           RotationTransition(
//                             turns: _animation,
//                             child: InkWell(
//                               child: FaIcon(FontAwesomeIcons.youtube,
//                                   color:
//                                       isSelected4 ? Colors.red : Colors.white,
//                                   size: 25.0),
//                               onTap: () async {
//                                 const url =
//                                     "https://www.youtube.com/flutterdev";
//                                 await launch(url);
//                               },
//                               onHover: (value) {
//                                 setState(() {
//                                   isSelected4 = value;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   right: 30,
//                   bottom: 70,
//                   child: RotationTransition(
//                     turns: _arrowAnimation,
//                     child: InkWell(
//                       child: const Icon(
//                         Icons.arrow_circle_up,
//                         color: Colors.white,
//                       ),
//                       onTap: () {
//                         _scrollToTop();
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ]),
//         ));
//   }
// }

// class DrawClip extends CustomClipper<Path> {
//   double move = 0;
//   double slice = math.pi;
//   DrawClip(this.move);
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.lineTo(0, size.height * 0.6);

//     double xCenter =
//         size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
//     double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
//     path.quadraticBezierTo(
//       xCenter,
//       yCenter,
//       size.width,
//       size.height * 0.8,
//     );

//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

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

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.6);

    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(
      xCenter,
      yCenter,
      size.width,
      size.height * 0.8,
    );

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
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
            onTap: () {},
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
