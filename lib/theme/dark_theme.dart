import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData DarkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xff2B2B2B),
  colorScheme: ColorScheme.dark(),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff2B2B2B),
    elevation: 0,
    toolbarHeight: 80,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.grey.shade900),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Cairo"),
  ),
  iconTheme: IconThemeData(color: Colors.white),
);
