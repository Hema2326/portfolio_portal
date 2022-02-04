import 'package:flutter/material.dart';
import 'package:portfolio_portal/widgets/responsive_widget.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      leading: !ResponsiveWidget.isSmallSceenSize(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    'assets/logo.png',
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
                color: Colors.redAccent,
              )),
    );
