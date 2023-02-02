import 'package:flutter/material.dart';

import '../widgets/homeAppBar.dart';

class Profile extends StatelessWidget {
  static String routeName = "/profile";
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Container(
        child: Center(
          child: Text('Profile Page'),
        ),
      ),
    );
  }
}
