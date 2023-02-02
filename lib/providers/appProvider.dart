import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kindershala/features/smartML.dart';
import 'package:kindershala/utils/sharePref.dart';

class AppProvider extends ChangeNotifier {
  int bottonNavIndex = 0;
  bool authinticated = true;
  bool onboarding = true;

  void changeBottomNav(BuildContext context, index) {
    print(index);
    bottonNavIndex = index;

    notifyListeners();

    switch (index) {
      case 1:
        Navigator.pushNamed(context, SmartML.routeName);
        break;
    }
  }

  Future onboarded() async {
    bool onboard = await SharePref.getBool('onboarding');

    if (onboard == false) {
      return true;
    } else {
      return false;
    }
  }

  void changePageIndex(int index) {}
}
