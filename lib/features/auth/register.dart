// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kindershala/features/auth/login.dart';
import 'package:kindershala/utils/colors.dart';
import 'package:kindershala/utils/strings.dart';
import 'package:kindershala/utils/theme.dart';
import 'package:kindershala/utils/widgets.dart';

class Register extends StatefulWidget {
  static String routeName = "/register";
  const Register({
    Key? key,
  }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                          //Register Page Header
                          RegisterPageHeader(),

                          //Register Form
                          RegisterForm()
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

class RegisterPageHeader extends StatelessWidget {
  const RegisterPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Image(
            image: AssetImage(Strings.registerPageTitleImage),
            height: 200,
            width: 200,
          ),
        ),

        //Page Titles
        Column(
          children: const [
            Text(
              '${Strings.registerPageTitle} to ${Strings.appTitle}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Fontsize.title),
            ),
            SizedBox(height: 10),
            Text(
              Strings.registerPageSubTitle,
              style: TextStyle(fontSize: Fontsize.subtitle),
            )
          ],
        )
      ],
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool hidePwd = true;
  bool loading = false;
  bool c_hidePwd = true;
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController(text: 'admin@admin.com');
  final password = TextEditingController(text: 'password');
  final c_password = TextEditingController(text: 'confirm_password_text');

  register() async {
    HapticFeedback.vibrate();

    var data = {
      'email': email.text,
      'password': password.text,
      'c_password': c_password.text,
    };

    if (_formKey.currentState!.validate()) {
      print('Register button clicked $data');

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
          //Email
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),

          //Password
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: hidePwd,
            controller: password,
            decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePwd = !hidePwd;
                      });
                    },
                    icon: hidePwd
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility))),
          ),
          const SizedBox(height: 20),

          //Confirm Password
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: c_hidePwd,
            controller: c_password,
            decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Confirm password',
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        c_hidePwd = !c_hidePwd;
                      });
                    },
                    icon: c_hidePwd
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility))),
          ),
          const SizedBox(height: 30),

          //Register button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  register();
                },
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppButtonHeight.height),
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor),
                child: !loading
                    ? const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    : Container(
                        height: 20,
                        width: 20,
                        child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white)),
                      )),
          ),
          const SizedBox(height: 5),

          //Switch page ,already have account, Login
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Already have account,',
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    HapticFeedback.vibrate();
                    print('Go to Login page');
                    Navigator.popAndPushNamed(context, Login.routeName);
                  },
                  child: const Text(
                    'Login',
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
