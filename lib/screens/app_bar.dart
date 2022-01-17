import 'package:flutter/material.dart';
import 'package:portfolio_portal/utils/color_resource.dart';
import 'package:portfolio_portal/utils/image_resource.dart';
import 'package:portfolio_portal/widgets/responsive_widget.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      backgroundColor: ColorResource.colorFFFFFF,
      elevation: 2,
      leading: !ResponsiveWidget.isSmallSceenSize(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    ImageResource.yaplogo,
                    // 'assets/logo.png',
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              onPressed: () {
                key.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: ColorResource.colorEC1C24,
              )),
    );
