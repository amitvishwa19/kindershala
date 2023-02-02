import 'package:flutter/material.dart';
import 'package:kindershala/utils/strings.dart';

import '../utils/colors.dart';

// ignore: non_constant_identifier_names
AppBar HomePageAppBar() {
  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor: primaryColor,
    title: const Text(Strings.appTitle),
    actions: [],
  );
}
