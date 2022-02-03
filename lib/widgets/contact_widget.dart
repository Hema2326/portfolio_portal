import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceModel {
  final String experienceTitle;
  final String experienceSubTitle;
  final double? height;

  ExperienceModel(this.experienceTitle, this.experienceSubTitle, {this.height});
}

class Contact {
  static Widget details(
      BuildContext context,
      String image,
      String name,
      String desgination,
      String introduction,
      String about,
      List<ExperienceModel> experience,
      String email,
      String github,
      String linkdin) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 150.0,
            child: ClipRRect(
              child: Image.asset(image),
              borderRadius: BorderRadius.circular(150.0),
            ),
          ),
        ),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          desgination,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 60),
        const Text("Introduction",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Text(
            introduction,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 40),
        const Text("About Me",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.all(48.0),
          child: Text(
            about,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 40),
          child: Text("Experience",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 38.0, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ListView.builder(
                itemCount: experience.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return DesignWidget(
                    title: experience[index].experienceTitle,
                    subTitle: experience[index].experienceSubTitle,
                  );
                }),
            Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Icon(
                  Icons.phone_android,
                  color: Colors.white,
                )),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    copyToClipboard(context, email);
                  },
                  child: Text(email, style: const TextStyle(fontSize: 16))),
              const SizedBox(width: 30),
              InkWell(
                child: const FaIcon(FontAwesomeIcons.github,
                    color: Colors.black, size: 25.0),
                onTap: () async {
                  await launch(github);
                },
              ),
              const SizedBox(width: 30),
              InkWell(
                child: FaIcon(FontAwesomeIcons.linkedin,
                    color: Colors.blue[400], size: 25.0),
                onTap: () async {
                  await launch(linkdin);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  static Future<void> copyToClipboard(
      BuildContext context, String email) async {
    await Clipboard.setData(ClipboardData(text: email));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied')),
    );
  }
}

class DesignWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final double height;

  const DesignWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.height = 500})
      : super(key: key);

  @override
  _DesignWidgetState createState() => _DesignWidgetState();
}

class _DesignWidgetState extends State<DesignWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Icon(
                  Icons.phone_android,
                  color: Colors.white,
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 38.0, top: 50, bottom: 50),
                child: Text(widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                  height: widget.height,
                  width: 10,
                  child: const VerticalDivider(color: Colors.blue)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 68.0, right: 20),
                child: Text(
                  widget.subTitle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
