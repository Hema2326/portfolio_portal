import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/utils/custom_text.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/utils/string_resource.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.pink[400],
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child:
                    // Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // children: [
                    Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        StringResource.icici,
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                          fontSize: 30,
                          color: ColorResource.colorFFFFFF,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      Image.asset(
                        ImageResource.pockets,
                        width: 150,
                        height: 150,
                      ),
                      CustomText(
                        'Description',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: ColorResource.colorFFFFFF,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 700,
                        height: 100,
                        child: CustomText(
                          'It’s a VISA-powered e-wallet that customer of any bank can use to recharge mobile, send money, shop anywhere, pay bills and much more.',
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              // fontWeight: FontWeight.bold,
                              color: ColorResource.colorFFFFFF,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 700,
                        height: 100,
                        child: CustomText(
                          'Pockets wallet also comes with a physical shopping card which can be used to shop on any website or retail stores.',
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              // fontWeight: FontWeight.bold,
                              color: ColorResource.colorFFFFFF,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        'Fund Transfer',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: ColorResource.colorFFFFFF,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        'Making NFC Payments',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: ColorResource.colorFFFFFF,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        'Recharges',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: ColorResource.colorFFFFFF,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        'Benefits of Physical Card',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: ColorResource.colorFFFFFF,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        'Pay Utility Bills',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: ColorResource.colorFFFFFF,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        'Shopping',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: ColorResource.colorFFFFFF,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            ImageResource.icici2,
                            alignment: Alignment.center,
                            width: 260,
                            height: 260,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ],
                // ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              color: ColorResource.colorFFFFFF,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child:
                    // Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // children: [
                    Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        StringResource.visa,
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                          fontSize: 30,
                          color: ColorResource.color222222,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 800,
                        height: 100,
                        child: CustomText(
                          'Visa Digital Solutions equip you with the tools you need to create, manage and accept secure digital payments in-store, online or in-app.',
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                            fontSize: 20,
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
                          fontSize: 20,
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
                          fontSize: 20,
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
                          fontSize: 20,
                          color: ColorResource.color222222,
                          fontWeight: FontWeight.w100,
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 80),
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          ImageResource.visa,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),

                //   ],
                // ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child:
                    // Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // children: [
                    Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        StringResource.generic,
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                          fontSize: 30,
                          color: ColorResource.colorFFFFFF,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 800,
                        height: 100,
                        child: CustomText(
                          'Instead of packages we can make use of it. We have created generic components for our upcoming flutter projects.',
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                            fontSize: 20,
                            color: ColorResource.colorFFFFFF,
                            fontWeight: FontWeight.w100,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        'Currency Converter',
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                          fontSize: 17,
                          color: ColorResource.colorFFFFFF,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        'Google Maps',
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                          fontSize: 17,
                          color: ColorResource.colorFFFFFF,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        'Otp View and Returning User',
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                          fontSize: 17,
                          color: ColorResource.colorFFFFFF,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        'International phone field and country code',
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                          fontSize: 17,
                          color: ColorResource.colorFFFFFF,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 80),
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          ImageResource.genericcomponenets,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),

                //   ],
                // ),
              ),
            ),
          ]),
        )),
      ]),
    );
  }
}
