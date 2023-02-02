import 'package:flutter/material.dart';

class Strings {
  Strings._();

  static const appTitle = 'KinderShala';
  static const appVersion = '2.1.4';
  //static const splashHeroImage = 'assets/images/splash_grocery.png';

  // UI Texts & Sizes
  static const onboardingSkipText = 'Umm, i know, Skip for me';
  static const onboardingStartingText = 'I am exited to get Started';

  //Ui Images Path
  static const splashBackground = 'assets/images/splash_background.png';
  static const pageBackground = 'assets/images/kindershala_page_background.png';
  static const appLogo = 'assets/images/logo.png';

  //====================================Auth=============================================================================
  static const authPageBottomImage = 'assets/images/bottom_child_flag.png';
  static const authPageTitleImage = 'assets/images/auth/auth_page_title.png';
  static const loginPageTitleImage =
      'assets/images/auth/loginPpage_title_image.png';
  static const registerPageTitleImage =
      'assets/images/auth/register_title_image.png';
  static const forgotPasswordxPageTitleImage =
      'assets/images/auth/forgot_password.png';

  //======================================================================================================================

  // Login Page Texts
  static const loginPageTitle = 'Welcome Back';
  static const loginPageSubTitle =
      'Its take big heart to teach litten minds, $appTitle shapes your gem to Diamond';

  // Registern Page Texts
  static const registerPageTitle = 'Get On Board';
  static const registerPageSubTitle =
      'Create your Profile to start your journey to your to shape your gem to a Diomand';

  // Forgot Password Page Texts
  static const forgotPasswordPageTitle = 'Oops ! Forgot Password';
  static const forgotPasswordPageSubTitle =
      'Oh ! you can forgot things?, i can too, i am too small to remeber the things';

  static const currencySign = '₹';

  //Auth Page
  static const authWelcomeTitle = 'KinderShala';
  static const authWelcomeSubtitle =
      'We are Crazy for your Child , If its matter of Learning, We are there, The right environment for growing';

  static const String introTitle =
      "We make learning easy. Join KinderShala to learn Courses for free on KinderShala.";

  static const noInternetError =
      'Check your internet connection and try again later';

  static const serverTimeOut =
      'Server time out, please check your internet connection or try again later';

  static List<Map<String, String>> onboardData = [
    {
      "title": "Welcome to $appTitle",
      "text":
          "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.” – Dr. Seuss",
      "image": "assets/images/onboarding/onboard_11.png"
    },
    {
      "title": "Learn & Grow with $appTitle",
      "text":
          "You’re braver than you believe and stronger than you seem, and smarter than you think.” – Christopher Robin",
      "image": "assets/images/onboarding/onboard_22.png"
    },
    {
      "title": "We Work Best When We Work Together!",
      "text":
          "The more that you read, the more things you will know. The more you learn, the more places you’ll go!” – Dr. Seuss",
      "image": "assets/images/onboarding/onboard_33.png"
    },
  ];
}
