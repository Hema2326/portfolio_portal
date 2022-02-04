import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_portal/utils/custom_text.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/utils/string_resource.dart';
import 'package:portfolio_portal/widgets/bottomContainer_widget.dart';

import '../utils/color_resource.dart';

class ProjectsLargeScreenWidget extends StatefulWidget {
  const ProjectsLargeScreenWidget({Key? key}) : super(key: key);

  @override
  _ProjectsLargeScreenWidgetState createState() =>
      _ProjectsLargeScreenWidgetState();
}

class _ProjectsLargeScreenWidgetState extends State<ProjectsLargeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: CustomText(
          StringResource.flutterprojects,
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                AspectRatio(
                  aspectRatio: 3.0,
                  child: Image.asset(
                    ImageResource.project1,
                    fit: BoxFit.fill,
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 120, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        StringResource.flutterprojects,
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            color: ColorResource.colorFFFFFF,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(
                          StringResource.icici,
                          textStyle: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              color: ColorResource.colorFFFFFF,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ], isRepeatingAnimation: true, repeatForever: true),
                      const SizedBox(
                        height: 20,
                      ),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(
                          StringResource.visa,
                          textStyle: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              color: ColorResource.colorFFFFFF,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ], isRepeatingAnimation: true, repeatForever: true),
                      const SizedBox(
                        height: 20,
                      ),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(
                          StringResource.generic,
                          textStyle: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              color: ColorResource.colorFFFFFF,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ], isRepeatingAnimation: true, repeatForever: true),
                    ],
                  ),
                ),
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.pink[600],
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              StringResource.icici,
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 50,
                                color: ColorResource.colorFFFFFF,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              'Description',
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: ColorResource.colorFFFFFF,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 1000,
                              height: 100,
                              child: CustomText(
                                'It’s a VISA-powered e-wallet that customer of any bank can use to recharge mobile, send money, shop anywhere, pay bills and much more.',
                                style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    // fontWeight: FontWeight.bold,
                                    color: ColorResource.colorFFFFFF,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              height: 100,
                              child: CustomText(
                                'Pockets wallet also comes with a physical shopping card which can be used to shop on any website or retail stores.',
                                style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    // fontWeight: FontWeight.bold,
                                    color: ColorResource.colorFFFFFF,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              'Fund Transfer',
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: ColorResource.colorFFFFFF,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              'Making NFC Payments',
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: ColorResource.colorFFFFFF,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              'Recharges',
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: ColorResource.colorFFFFFF,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              'Benefits of Physical Card',
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: ColorResource.colorFFFFFF,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              'Pay Utility Bills',
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: ColorResource.colorFFFFFF,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              'Shopping',
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: ColorResource.colorFFFFFF,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              'Scan to Pay',
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: ColorResource.colorFFFFFF,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                ImageResource.pockets,
                                width: 250,
                                height: 250,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            ImageResource.icici2,
                            width: 500,
                            height: 500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 600,
                color: ColorResource.colorFFFFFF,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              StringResource.visa,
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 50,
                                color: ColorResource.color222222,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 1000,
                              child: CustomText(
                                'Visa Digital Solutions equip you with the tools you need to create, manage and accept secure digital payments in-store, online or in-app.',
                                style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                  fontSize: 25,
                                  color: ColorResource.color222222,
                                  fontWeight: FontWeight.w100,
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              'Digital',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 25,
                                color: ColorResource.color222222,
                                fontWeight: FontWeight.w100,
                              )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              'Travel',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 25,
                                color: ColorResource.color222222,
                                fontWeight: FontWeight.w100,
                              )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              'Money',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 25,
                                color: ColorResource.color222222,
                                fontWeight: FontWeight.w100,
                              )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            ImageResource.visa,
                            width: 300,
                            height: 300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 800,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              StringResource.generic,
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 50,
                                color: ColorResource.colorFFFFFF,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 700,
                              height: 100,
                              child: CustomText(
                                'Instead of packages we can make use of it and we can use for our upcoming projects.',
                                style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                  fontSize: 25,
                                  color: ColorResource.colorFFFFFF,
                                  fontWeight: FontWeight.w100,
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Currency Converter',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Google Maps',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Otp View and Returning User',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'International phone field and country code',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Encryption and Decryption',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Download and Share',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'QR Code Generator',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Set Pin',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Biometric Authenetication',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Walkthrough View',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'WebView',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              'Email, Call, Message, Whatsapp',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                color: ColorResource.colorFFFFFF,
                              )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            ImageResource.genericcomponenets1,
                            width: 500,
                            height: 500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  color: Colors.orange[400],
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Yet More to come....',
                        textStyle: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          color: ColorResource.colorFFFFFF,
                        )),
                      )
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  )),
              const BottomContainerWidget(),
            ]),
          ]),
        ),
      ),
    ]);
  }
}
