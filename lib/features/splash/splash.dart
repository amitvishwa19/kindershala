import 'package:flutter/material.dart';
import 'package:kindershala/features/auth/auth.dart';

import 'package:kindershala/features/home.dart';
import 'package:kindershala/features/onboarding/onboarding.dart';
import 'package:kindershala/features/smartML.dart';
import 'package:kindershala/providers/appProvider.dart';
import 'package:kindershala/utils/strings.dart';
import 'package:kindershala/utils/widgets.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  static String routeName = "/splash";
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool animated = false;

  @override
  void initState() {
    super.initState();
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    bool authinticated = appProvider.authinticated;
    bool onboarding = appProvider.onboarding;

    moveToNextScreen(onboarding, authinticated);
  }

  moveToNextScreen(onboarding, authinticated) async {
    if (onboarding) {
      if (authinticated) {
        await Future.delayed(const Duration(seconds: 5), () {
          Navigator.popAndPushNamed(context, HomePage.routeName);
          //Navigator.popAndPushNamed(context, SmartVision.routeName);
        });
      } else {
        await Future.delayed(const Duration(seconds: 5), () {
          //Navigator.popAndPushNamed(context, HomePage.routeName);
          Navigator.popAndPushNamed(context, AuthPage.routeName);
        });
      }
    } else {
      await Future.delayed(const Duration(seconds: 5), () {
        //Navigator.popAndPushNamed(context, HomePage.routeName);
        Navigator.popAndPushNamed(context, Onboarding.routeName);
      });
    }
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          PageBackground(context),
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(Strings.appLogo))),
            ),
          )
        ],
      ),
    ));
  }
}
