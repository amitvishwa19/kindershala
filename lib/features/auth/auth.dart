import 'package:flutter/material.dart';
import 'package:kindershala/features/auth/login.dart';
import 'package:kindershala/features/auth/register.dart';
import 'package:kindershala/utils/colors.dart';
import 'package:kindershala/utils/strings.dart';
import 'package:kindershala/utils/theme.dart';
import 'package:kindershala/utils/widgets.dart';

class AuthPage extends StatefulWidget {
  static String routeName = "/auth";
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthState();
}

class _AuthState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageBackground(context),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Center(
                  child: Image(
                    image: AssetImage(Strings.authPageTitleImage),
                    height: 300,
                    width: 300,
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      Strings.authWelcomeTitle,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(Strings.authWelcomeSubtitle,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, Login.routeName);
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: primaryColor),
                          padding: const EdgeInsets.symmetric(
                              vertical: AppButtonHeight.height,
                              horizontal: 100),
                          foregroundColor: primaryColor,
                          backgroundColor: Colors.white),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, Register.routeName);
                            },
                            style: OutlinedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppButtonHeight.height,
                                    horizontal: 100),
                                foregroundColor: Colors.white,
                                backgroundColor: primaryColor),
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 20),
                            )))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
