import 'package:flutter/material.dart';
import 'package:kindershala/widgets/homeAppBar.dart';

class Feeds extends StatelessWidget {
  static String routeName = "/feeds";
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Container(
        child: Center(
          child: Text('Feeds Page'),
        ),
      ),
    );
  }
}
