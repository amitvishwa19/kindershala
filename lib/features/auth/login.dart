// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kindershala/features/auth/forgotPassword.dart';
import 'package:kindershala/features/auth/register.dart';
import 'package:kindershala/utils/colors.dart';
import 'package:kindershala/utils/strings.dart';
import 'package:kindershala/utils/theme.dart';
import 'package:kindershala/utils/widgets.dart';

class Login extends StatelessWidget {
  static String routeName = "/login";
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  print('Container,Page is clicked');
                },
                child: Stack(
                  children: [
                    PageBackground(context),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          //Login Page Header
                          LoginPageHeader(),

                          //Login Form
                          LoginForm(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Image(
            image: AssetImage(Strings.loginPageTitleImage),
            height: 200,
            width: 200,
          ),
        ),

        //Page Titles
        Column(
          children: const [
            Text(
              Strings.loginPageTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Fontsize.title),
            ),
            SizedBox(height: 10),
            Text(
              Strings.loginPageSubTitle,
              style: TextStyle(fontSize: Fontsize.subtitle),
            )
          ],
        )
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool hidePwd = true;
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController(text: 'info@devlomatix.com');
  final password = TextEditingController(text: 'password');

  loginClicked() async {
    var data = {
      'email': email.text,
      'password': password.text,
    };
    if (kDebugMode) {}
    if (_formKey.currentState!.validate()) {
      print('Login button clicked with data $data');

      setState(() {
        loading = true;
      });

      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //Email Id
          TextFormField(
            controller: email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Email';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Please enter Email',
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),

          const SizedBox(
            height: 40,
          ),

          //Password
          TextFormField(
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
            obscureText: hidePwd,
            controller: password,
            decoration: InputDecoration(
                labelText: 'Please enter Password',
                hintText: 'Password',
                prefixIcon: Icon(Icons.key),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePwd = !hidePwd;
                      });
                    },
                    icon: hidePwd
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility))),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  print('Forgot password clicked');
                  Navigator.popAndPushNamed(context, ForgotPassword.routeName);
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryColor),
                )),
          ),

          //Login Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  loginClicked();
                },
                child: !loading
                    ? const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    : SizedBox(
                        height: 20,
                        width: 20,
                        child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white)),
                      ),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppButtonHeight.height),
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor)),
          ),

          SizedBox(height: 20),

          Text('Or',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          SizedBox(height: 20),

          //Login With Google
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  print('Login with Google');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login with Google',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppButtonHeight.height),
                    elevation: 0,
                    foregroundColor: primaryColor,
                    backgroundColor: Colors.white)),
          ),

          //Dont have account text
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Dont have account, ',
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    HapticFeedback.vibrate();
                    print('Go to register page');
                    Navigator.popAndPushNamed(context, Register.routeName);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: primaryColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
