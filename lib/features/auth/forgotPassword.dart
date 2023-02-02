// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kindershala/features/auth/login.dart';
import 'package:kindershala/features/auth/register.dart';
import 'package:kindershala/utils/colors.dart';
import 'package:kindershala/utils/strings.dart';
import 'package:kindershala/utils/theme.dart';
import 'package:kindershala/utils/widgets.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = "/forgotPassword";
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
            child: SizedBox(
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
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          //Login Page Header
                          ForgotPasswordPageHeader(),

                          //Login Form
                          ForgotPasswordForm(),
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

class ForgotPasswordPageHeader extends StatelessWidget {
  const ForgotPasswordPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Image(
            image: AssetImage(Strings.forgotPasswordxPageTitleImage),
            height: 200,
            width: 200,
          ),
        ),

        //Page Titles
        Column(
          children: const [
            Text(
              Strings.forgotPasswordPageTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Fontsize.title),
            ),
            SizedBox(height: 10),
            Text(
              Strings.forgotPasswordPageSubTitle,
              style: TextStyle(fontSize: Fontsize.subtitle),
            )
          ],
        )
      ],
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordForm();
}

class _ForgotPasswordForm extends State<ForgotPasswordForm> {
  bool hidePwd = true;
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();

  forgotPasswordClicked() async {
    var data = {
      'email': email.text,
    };

    if (_formKey.currentState!.validate()) {
      print('Forgot Password button clicked with data $data');

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

          //Login Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  forgotPasswordClicked();
                },
                child: !loading
                    ? const Text(
                        'Oops! I Forgot the Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    : const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white)),
                      ),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: InputBoxHeight.height),
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  print('Back to login clicked');
                  Navigator.popAndPushNamed(context, Login.routeName);
                },
                child: const Text(
                  'Back to Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryColor),
                )),
          ),
        ],
      ),
    );
  }
}
