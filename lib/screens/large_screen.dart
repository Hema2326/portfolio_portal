import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

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
