import 'package:flutter/material.dart';

import '../widgets/homeAppBar.dart';

class Settings extends StatelessWidget {
  static String routeName = "/settings";
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Container(
        child: Center(
          child: Text('Settings Page'),
        ),
      ),
    );
  }
}
