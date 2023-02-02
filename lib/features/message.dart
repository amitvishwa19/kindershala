import 'package:flutter/material.dart';

import '../widgets/homeAppBar.dart';

class Message extends StatelessWidget {
  static String routeName = "/message";
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Container(
        child: Center(
          child: Text('Message Page'),
        ),
      ),
    );
  }
}
