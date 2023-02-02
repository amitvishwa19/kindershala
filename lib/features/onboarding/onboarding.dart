// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kindershala/features/auth/auth.dart';
import 'package:kindershala/features/splash/splash.dart';
import 'package:kindershala/utils/colors.dart';
import 'package:kindershala/utils/strings.dart';
import 'package:kindershala/utils/sharePref.dart';
import 'package:kindershala/utils/strings.dart';

class Onboarding extends StatefulWidget {
  static String routeName = "/onboarding";
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Strings.pageBackground),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 750,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                        print(value);
                      });
                    },
                    itemCount: Strings.onboardData.length,
                    itemBuilder: (context, index) => OnBoardContent(
                          appTitle: Strings.onboardData[index]['title'] ?? '',
                          appSubtitle: Strings.onboardData[index]['text'] ?? '',
                          image: Strings.onboardData[index]['image'] ?? '',
                        )),
              )
            ],
          )
        ],
      ),
      bottomSheet: currentPage != Strings.onboardData.length - 1
          ? Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              decoration: const BoxDecoration(color: primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      await SharePref.setBool('onBoarding', true);
                      Navigator.pushReplacementNamed(
                          context, AuthPage.routeName);
                    },
                    child: const Text(
                      Strings.onboardingSkipText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(Strings.onboardData.length,
                        (index) => buildDots(index)),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, AuthPage.routeName);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: const BoxDecoration(color: primaryColor),
                  child: const Text(
                    Strings.onboardingStartingText,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
            ),
    ));
  }

  AnimatedContainer buildDots(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
          color: currentPage == index ? onBoardActiveDot : onBoardInActiveDot,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  final String appTitle, appSubtitle, image;
  const OnBoardContent(
      {Key? key,
      required this.appTitle,
      required this.appSubtitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(50),
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
        const SizedBox(height: 40),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            appTitle,
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Text(
            appSubtitle,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
