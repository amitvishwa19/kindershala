import 'package:flutter/cupertino.dart';
import 'package:kindershala/utils/strings.dart';
import 'package:matcher/matcher.dart';

Widget PageBackground(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Strings.pageBackground), fit: BoxFit.cover)),
  );
}
