import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kindershala/providers/appProvider.dart';
import 'package:kindershala/utils/colors.dart';
import 'package:provider/provider.dart';

BottomNavigationBar appBottomNavigation(context) {
  AppProvider provider = Provider.of<AppProvider>(context);

  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.rss), label: 'Feeds'),
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.solidMessage),
        label: 'Message',
      ),
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.house),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.userAstronaut),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.gear),
        label: 'Settings',
      ),
    ],
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.shifting,
    currentIndex: provider.bottonNavIndex,
    onTap: (value) {
      provider.changeBottomNav(context, value);
    },
  );
}
