import 'dart:ui';

import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_portal/widgets/contact_widget.dart';

import '../models.dart/models.dart';
import '../widgets/flip_widget.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late FixedExtentScrollController controller;
  static const double _itemHeight = 450;
  // static const int _itemCount = 100;

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
      PortfolioModel('assets/mari.png', 'Mari'),
      PortfolioModel('assets/chinnadurai.png', 'Chinnadurai'),
      PortfolioModel('assets/alexia.png', 'Alexia'),
      PortfolioModel('assets/hema.png', 'Hema'),
      PortfolioModel('assets/seema.png', 'Seema'),
      PortfolioModel('assets/nandha.png', 'Nandhakumar'),
      PortfolioModel('assets/jones.png', 'Jones'),
    ];
    return Scaffold(
      body: Container(
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
              left: 50,
              top: 70,
              child: Container(
                color: Colors.black,
                child: FlipPanel.builder(
                  itemBuilder: (context, index) => Container(
                    width: 136.0,
                    height: 148.0,
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
                            height: 60,
                            width: 60,
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
                      MaterialPageRoute(
                          builder: (context) => const MariScreen()),
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
                      MaterialPageRoute(
                          builder: (context) => const AlexiaScreen()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HemaScreen()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeemaScreen()),
                    );
                    break;
                  case 5:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NandhaScreen()),
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
                              Padding(
                                padding: const EdgeInsets.only(top: 108.0),
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.asset(
                                          '${digits[index].image}',
                                          fit: BoxFit.cover,
                                        ).image,
                                      ),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 8,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        )
                                      ]),
                                  child: ClipRRect(
                                      child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.grey.withOpacity(0.1),
                                        child: Image.asset(
                                          '${digits[index].image}',
                                          height: 180,
                                          width: 180,
                                        )),
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text(
                                  '${digits[index].name}',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600),
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
      ),
    );
  }
}

class MariScreen extends StatefulWidget {
  const MariScreen({Key? key}) : super(key: key);

  @override
  State<MariScreen> createState() => _MariScreenState();
}

class _MariScreenState extends State<MariScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/mari.png",
            "Mariganesh Thangaraj",
            "Senior Software Engineer",
            "Work for money and code for love! I’m Ganesh, Software Engineer based in India.",
            "Hello, I'm an iOS / Flutter developer with 4+ years of professional experience in dynamic and deadline- driven work environments. Eager to make mobile applications to delight customers with magical experiences. In previous roles developed 7+ mobile apps that were published in App Store and Play Store.",
            [
              ExperienceModel(
                "Senior Software Engineer (Flutter)\nM2P Fintech,Chennai\n03/2021 - present",
                "1.Created Visa digital mobile application using flutter.\n2.Support the team to build generic components for upcoming flutter projects.\n3.Help the team to learn about Bloc state management and live project architecture\n4.M2P fintech web portal is my ongoing projects.",
              ),
              ExperienceModel(
                "Native IOS / Flutter Developer\nTartLabs\n09/2018 - 03/2021",
                "1.Coimbatore Tart Labs is a top-notch software design and development company bringing in transformational outcomes to all the customers across various industries.\n2.Experienced in Cross-Platform Mobile Development using Flutter based mobile app.\n3.Good understanding and usage of States and Flutter Blocs.\n4.Up to date on Apple development standards Build app for both online and Offline storage.\n5.Use SOAP and RESTful API's. Work along with Third party integrated tools.\n6.Experience with versioning tools like Git-Lab .",
              ),
              ExperienceModel(
                  "IOS Developer\nHCL Technologies Ltd\n08/2017 - 09/2018, Chennai",
                  "1.iOS application Developing & Testing.\n2.Design and build advanced app features for the iOS platform with Swift language Involvement in Software Product Life Cycle.\n3.Familiar with defect Tracking Tools & Process.\n4.Interacting with SME’s , senior management, developers, testers and across different competencies to get the task accomplished within the given deadlines. Performed technical designs and implementation of 3+ iOS apps."),
            ],
            "mariganeshthangam@gmail.com",
            "https://github.com/mariganesh555",
            "https://www.linkedin.com/in/mariganesh-t-02831b104"),
      ),
    );
  }
}

class ChinnaduraiScreen extends StatefulWidget {
  const ChinnaduraiScreen({Key? key}) : super(key: key);

  @override
  _ChinnaduraiScreenState createState() => _ChinnaduraiScreenState();
}

class _ChinnaduraiScreenState extends State<ChinnaduraiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/chinnadurai.png",
            "Chinnadurai Viswanathan",
            "Senior Software Engineer",
            "I am Chinnadurai Viswanathan. I completed my M.C.A in 2015 at the Hindusthan Institute of Technology affiliated with Anna University, Chennai, India. ",
            "Hands-on 6.5 years of experience in Mobile development Software and successful Engineer with leading teams in delivering appropriate technology solutions for mobile products. Comprehensive knowledge of platform development, basic architecture, agile & scrum methodologies. Innovative change agent with a unique mix of high-level technology direction and deep technical expertise. \n\nTechnologies: \nAndroid - Using core java\nFlutter(Dart - Android(Java & Kotlin)\niOS (Swift) )\nSolr Search\nPega development",
            [
              ExperienceModel(
                  "Senior Software Engineer (Flutter)\nM2P Fintech,Chennai\nJune 2021 - present",
                  "1.Coordinate with other professionals, such as contractors, architects, engineers to ensure job success.\n2.Prepare scale drawings.\n3.Established compatibility with third-party software products by developing the programme for modification and integration.\n4.Developed and implemented complex Internet and Intranet applications on multiple platforms.\n5.Designed strategic plan for component development practices to support future projects.\n6.Organised and created shooting schedules for the graphic design team, supervising the progress of projects from production to post-production.\n7.Consistently met deadlines and requirements for all production work orders.\n8.Managed creative projects from concept to completion while managing outside vendors.\n9.Developed workflow charts and diagrams to ensure production team compliance with client deadlines.\n10.Trained junior members of the IT team regarding the android application. "),
              ExperienceModel(
                  "MOBILE APP DEVELOPER - Flutter\nTeamLease Services Ltd - Working with FPT Software. Hyderabad, Telangana\nAug. 2020 – Jun. 2021",
                  "1.Coordinate with other professionals, such as contractors, architects, engineers to ensure job success.\n2.Prepare scale drawings.\n3.Established compatibility with third-party software products by developing the programme for modification and integration.\n4.Developed and implemented complex Internet and Intranet applications on multiple platforms.\n5.Designed strategic plan for component development practices to support future projects.\n6.Organised and created shooting schedules for the graphic design team, supervising the progress of projects from production to post-production.\n7.Consistently met deadlines and requirements for all production work orders.\n8.Managed creative projects from concept to completion while managing outside vendors.\n9.Developed workflow charts and diagrams to ensure production team compliance with client deadlines.\n10.Trained junior members of the IT team regarding the android application. "),
              ExperienceModel(
                  "Research & Development Engineer\nImpiger Technologies. Coimbatore, Tamil Nadu\nOct. 2018 – Jul. 2020",
                  "1.Coordinate with other professionals, such as contractors, architects, engineers to ensure job success.\n2.Prepare scale drawings.\n3.Established compatibility with third-party software products by developing the programme for modification and integration.\n4.Developed and implemented complex Internet and Intranet applications on multiple platforms.\n5.Designed strategic plan for component development practices to support future projects.\n6.Organised and created shooting schedules for the graphic design team, supervising the progress of projects from production to post-production.\n7.Consistently met deadlines and requirements for all production work orders.\n8.Managed creative projects from concept to completion while managing outside vendors.\n9.Developed workflow charts and diagrams to ensure production team compliance with client deadlines.\n10.Trained junior members of the IT team regarding the android application. "),
              ExperienceModel(
                  "Project Lead\nPattronize InfoTech/FrotiGrid ICT India Pvt Ltd. Coimbatore, Tamil Nadu\nOct. 2016 – Sep. 2018",
                  "1.Coordinate with other professionals, such as contractors, architects, engineers to ensure job success.\n2.Prepare scale drawings.\n3.Established compatibility with third-party software products by developing the programme for modification and integration.\n4.Developed and implemented complex Internet and Intranet applications on multiple platforms.\n5.Designed strategic plan for component development practices to support future projects.\n6.Organised and created shooting schedules for the graphic design team, supervising the progress of projects from production to post-production.\n7.Consistently met deadlines and requirements for all production work orders.\n8.Managed creative projects from concept to completion while managing outside vendors.\n9.Developed workflow charts and diagrams to ensure production team compliance with client deadlines.\n10.Trained junior members of the IT team regarding the android application. "),
              ExperienceModel(
                  "Junior Android Developer\nAver Soft Solution. Tiruppur, Tamil Nadu\nJun. 2015 – Jun. 2016",
                  "1.Established compatibility with third-party software products by developing the programme for modification and integration.\n2.Developed workflow charts and diagrams to ensure production team compliance with client deadlines ")
            ],
            "chinnaduraiv@live.in",
            "https://github.com/chinnaduraiv",
            "https://www.linkedin.com/in/chinnadurai-viswanathan-b2b6b7a5"),
      ),
    );
  }
}

class AlexiaScreen extends StatefulWidget {
  const AlexiaScreen({Key? key}) : super(key: key);

  @override
  _AlexiaScreenState createState() => _AlexiaScreenState();
}

class _AlexiaScreenState extends State<AlexiaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/alexia.png",
            "Antony Ruby Alexia",
            "Software Engineer",
            "MBA graduate with 6.5+ years of total experience developed my own app and published in play store and for clients. I enjoy learning new things and developing apps",
            "Am a software developer with 2.6+ years of experience prototyping, developing & deploying over 6 Android & iOS applications using Flutter. Robust applications designed with UX in mind and backed by firebase to enhance the user experience.\n\nFew Technologies am working with\n- Flutter \n- Dart \n- Firebase",
            [
              ExperienceModel(
                "Software Engineer (Flutter)\nM2P Fintech\nApr 2021 - Present",
                "1.Created Visa digital mobile application using flutter.\n2.Payease project.\n3.Built generic components for upcoming flutter projects.\n4.Portfolio project in flutter web.\n5.ICICI Pockets is inprocess project.",
              ),
              ExperienceModel(
                  "NARINDER ALLIANCE TECHNOLOGIES LLC\nFlutter Developer\nFeb 2021 - March 2021",
                  "1.Rapid development of front-end screens for existing iOS applications developed in the past\n2.Collaborate with back-end team for data feed & authentication 3 Version control using GIT\n3.Publish & maintain existing flutter applications\n4.Responsible to port existing iOS applications over to android for single uniform code-base in accordance with Material Design standards."),
              ExperienceModel(
                  "FREELANCE ANDROID DEVELOPER\nFull-Stack Flutter Developer\nSep 2018 – Jan 2021",
                  "1.Client communication & understanding the requirements\n2.User Experience (UX) design & prototyping using Adobe XD & Figma\n3.Client review & feedback documentation\n4.Front-end development using flutter\n4.Intuitive animations & hero animations to enhance user experience\n5.Publish application to the Google play-store & Apple app-store"),
              ExperienceModel(
                  "CITICORP SERVICE INDIA PVT. LTD. (CITI BANK)\nOfficer\nDec 2015 – May 2017",
                  "1.User Acceptance Testing (UAT) of financial applications for credit-card processing & chargeback\n2.Coordinate with the development team to illustrate and explain the end-user requirements\n3.Communicateandtraintheend-usersonthenewenhancements and functionalities\n4.Update standard work documents for the end-users based on new updates"),
              ExperienceModel(
                  "QUATRRO PROCESSING SERVICES PVT. LTD.(JP MORGAN ChASE)\nSenior Fraud Analyst\nSep 2012 – Apr 2015",
                  "1.Review customer’s debit & credit card transactions for suspicion of fraud\n2.Monitor systemic flagged accounts and transactions for possible suspicious activities and resolve transaction holds\n3.Expert in financial applications such as PEGA & VROL\n4.Train 4 teams of 6 members each on the credit verification process and the PEGA & VROL applications   ")
            ],
            "alexiadeveloper91@gmail.com",
            "https://github.com/AntonyRuby",
            "https://www.linkedin.com/in/antony-ruby-alexia-a-86b0a1172"),
      ),
    );
  }
}

class HemaScreen extends StatefulWidget {
  const HemaScreen({Key? key}) : super(key: key);

  @override
  _HemaScreenState createState() => _HemaScreenState();
}

class _HemaScreenState extends State<HemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/hema.png",
            "Hemavathi",
            "Software Engineer",
            "Software Engineer || UI/UX Designer || Website Developer",
            "Eager to work at Mobile Application Development and Website Developer and Passionate at Designing",
            [
              ExperienceModel(
                  "Software Engineer (Flutter)\nM2P Fintech,Chennai\nJuly 2021 - present",
                  "1.Working at ICICI projects\n2.Website Developments\n3.Worked on GeneriC Components SDK"),
              ExperienceModel("Website Developer\nSS Tech\nJuly 2016-2019",
                  "Projects Details\n1.Binaryview.in\n2.Zheetec.com\n3.Sstechpark.in\n4.onspotevents.com"),
              ExperienceModel(
                  "Accounts Assistant\nSS colour Impression Private Limited\nDec 2016-july2017",
                  "Worked as Assistant in a Accounts team.")
            ],
            "gd.hema98@gmail.com",
            "https://github.com/Hema2326",
            "https://www.linkedin.com/in/hemavathi-g-34571b214"),
      ),
    );
  }
}

class SeemaScreen extends StatefulWidget {
  const SeemaScreen({Key? key}) : super(key: key);

  @override
  _SeemaScreenState createState() => _SeemaScreenState();
}

class _SeemaScreenState extends State<SeemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/seema.png",
            "Seema SenthilKumar",
            "Software Engineer",
            "I’m Seema. Software Engineer based in India.",
            "Hi!..I have completed my Bachelor of Engineering (ECE) from Dhanalakshmi College of Engineering. I’m a fresher. I have joined M2P Fintech as a intern in the month of April 2021 and officially as a employee in the month of August 2021.",
            [
              ExperienceModel(
                  "Software Engineer\nMobile Development (Flutter)\nM2P Fintech,\nChennai.\n02/08/2021 - present",
                  "1.Created generic components for upcoming flutter projects.\n2.learnt about flutter web.\n3.ICICI Pockets is my current project."),
            ],
            "seemasenthil399@gmail.com",
            "https://github.com/Seema0399",
            "https://www.linkedin.com/in/seema-s-123b111b6"),
      ),
    );
  }
}

class NandhaScreen extends StatefulWidget {
  const NandhaScreen({Key? key}) : super(key: key);

  @override
  _NandhaScreenState createState() => _NandhaScreenState();
}

class _NandhaScreenState extends State<NandhaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/nandha.png",
            "Nandhakumar Krishnan",
            "Software Engineer",
            "Hi! I'm Nandha, I work as a professional  Software Engineer.\"Write code! get money\"",
            "Professional Software Engineer with over 2+ years of experience in Mobile app development using(Flutter, Dart). Involved in in-app Architecture, Design, Development and Testing.  I have developed 5+applications that were published in Play Store and App Store. currently, 1000+ customers using theseapplications.",
            [
              ExperienceModel(
                  "Software Engineer\nMobile Development (Flutter)\nM2P Fintech,\nChennai.\nAugust - present",
                  "1.Created Instalmint (Origa) mobile application using Flutter.\n2.I have learned how to handle the project and move on with day by day activities.\n3.Good understanding & Implementation of Flutter Blocs and Offline implementations."),
              ExperienceModel(
                  "Flutter Developer#REF Technologies Ltd - Dharmapuri, Tamil Nadu \nAugust 2019 to August 2021",
                  "1.Mobile Application Developing & Testing for both Android & iOS using Flutter and Dart.\n2.Good understanding & Implementation of API integration with REST & RESTful API. Work alongwith Third-party integrated tools.\n3.Design and build advanced app features for the Android & iOS platform with Flutter.\n4.Product Life Cycle.Experience with versioning tools like Git-Lab, GitHub and Jira.")
            ],
            "nandhu4011@gmail.com",
            "https://gitlab.com/NandhakumarKrishnanNK/",
            "https://www.linkedin.com/in/nandhakumar-k-14828813a"),
      ),
    );
  }
}

class JonesScreen extends StatefulWidget {
  const JonesScreen({Key? key}) : super(key: key);

  @override
  _JonesScreenState createState() => _JonesScreenState();
}

class _JonesScreenState extends State<JonesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Contact.details(
            context,
            "assets/jones.png",
            "Jones Joseph",
            "Software Engineer",
            "I’m Jones. Software Engineer based in India.",
            "Hi!.. I have completed my Bachelor of Computer Science from Sri Paramakalyani College. I’m a fresher. I have joined M2P Fintech as an intern in July 2021 and officially as an employee in September 2021.\n\n Techniques :\n-> React Native\n-> Basic Hacking\n-> Python\n-> Flutter & Dart",
            [
              ExperienceModel(
                  "Software Engineer (Flutter)\nM2P Fintech,Chennai\n06/09/2021 - present",
                  "1.Working in the Origa Project."),
            ],
            "jonessunil9601@gmail.com",
            "https://github.com/Jones9601",
            "https://www.linkedin.com/in/jones-j-ab5276211"),
      ),
    );
  }
}
