import 'package:flutter/widgets.dart';
import 'package:kindershala/features/appBasePage.dart';
import 'package:kindershala/features/auth/auth.dart';
import 'package:kindershala/features/auth/forgotPassword.dart';
import 'package:kindershala/features/auth/login.dart';
import 'package:kindershala/features/auth/register.dart';
import 'package:kindershala/features/feeds.dart';
import 'package:kindershala/features/home.dart';
import 'package:kindershala/features/message.dart';
import 'package:kindershala/features/onboarding/onboarding.dart';
import 'package:kindershala/features/profile.dart';
import 'package:kindershala/features/settings.dart';
import 'package:kindershala/features/smartML.dart';
import 'package:kindershala/features/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => const Splash(),
  Onboarding.routeName: (context) => const Onboarding(),
  AuthPage.routeName: (context) => const AuthPage(),
  Register.routeName: (context) => const Register(),
  Login.routeName: (context) => const Login(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  AppBasePage.routeName: (context) => AppBasePage(),
  HomePage.routeName: (context) => const HomePage(),
  SmartML.routeName: (context) => const SmartML(),
  Feeds.routeName: (context) => const Feeds(),
  Message.routeName: (context) => const Message(),
  Profile.routeName: (context) => const Profile(),
  Settings.routeName: (context) => const Settings(),
};
