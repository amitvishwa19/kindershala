import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:kindershala/providers/appProvider.dart';
import 'package:kindershala/utils/colors.dart';
import 'package:kindershala/utils/widgets.dart';
import 'package:kindershala/widgets/homeAppBar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HomePageAppBar(),
      body: Stack(
        children: [
          PageBackground(context),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: primaryColor.withOpacity(1),
        child: GNav(
          gap: 10,
          haptic: true,
          iconSize: 30,
          //curve: Curves.easeIn,
          //duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //backgroundColor: primaryColor.withOpacity(0.5),
          color: Colors.grey,
          activeColor: Colors.white,
          tabBorderRadius: 30,
          tabBackgroundColor: Colors.grey.withOpacity(0.5),
          onTabChange: (value) {
            appProvider.changeBottomNav(context, value);
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.visibility,
              text: 'Smart Vision',
            ),
            GButton(
              icon: Icons.school,
              text: 'Smart Class',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
