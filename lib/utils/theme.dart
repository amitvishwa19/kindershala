import 'package:flutter/material.dart';
import 'package:kindershala/utils/colors.dart';

ThemeData theme() {
  return ThemeData(
      fontFamily: "Muli",
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: primaryColor,
    elevation: 0,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme:
        TextTheme(headline6: TextStyle(color: Color(0XFF888888), fontSize: 18)),
  );
}

TextTheme textTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: textColor),
      bodyText2: TextStyle(color: textColor));
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: textColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: InputBoxHeight.height),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      fillColor: Colors.white,
      filled: true,
      border: outlineInputBorder);
}

class Fontsize {
  Fontsize._();

  static const headline1 = 40.0;
  static const headline2 = 40.0;
  static const title = 30.0;
  static const subtitle = 16.0;
}

class InputBoxHeight {
  InputBoxHeight._();
  static const height = 18.0;
}

class AppButtonHeight {
  AppButtonHeight._();
  static const height = 18.0;
}
