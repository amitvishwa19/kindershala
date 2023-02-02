import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kindershala/features/feeds.dart';
import 'package:kindershala/features/home.dart';
import 'package:kindershala/features/message.dart';
import 'package:kindershala/features/profile.dart';
import 'package:kindershala/features/settings.dart';
import 'package:kindershala/providers/appProvider.dart';
import 'package:kindershala/widgets/bottomNavigation.dart';
import 'package:provider/provider.dart';

class AppBasePage extends StatelessWidget {
  static String routeName = "/appbase";
  AppBasePage({Key? key}) : super(key: key);

  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);

    final List<Widget> pages = [
      const Feeds(),
      const Message(),
      const HomePage(),
      const Profile(),
      const Settings(),
    ];

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final timegap = DateTime.now().difference(pre_backpress);
          final cantExit = timegap >= const Duration(seconds: 2);
          pre_backpress = DateTime.now();

          if (cantExit) {
            //show snackbar

            if (provider.bottonNavIndex == 0) {
              Fluttertoast.showToast(msg: "Press back again to exit the App");
            } else {
              provider.changeBottomNav(context, 0);
            }

            return false;
          } else {
            return true;
          }
        },
        child: pages[provider.bottonNavIndex],
      ),
      bottomNavigationBar: appBottomNavigation(context),
    );
  }
}
