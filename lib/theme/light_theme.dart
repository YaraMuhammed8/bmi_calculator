import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color primaryColor = Color(0xff006672);
ThemeData LightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    background: Colors.blueGrey.shade700,
    onBackground: Colors.blueGrey.shade700,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: 80,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(color: primaryColor),
    titleTextStyle: TextStyle(
        color: primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Cairo"),
  ),
  iconTheme: IconThemeData(color: primaryColor),
);
