import 'package:flutter/material.dart';

class TitleOfFields extends StatelessWidget {
  String title;
  TitleOfFields({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.blueGrey.shade700,
          fontSize: 18,
          fontWeight: FontWeight.w900,
          fontFamily: "Tajawal"),
    );
  }
}
