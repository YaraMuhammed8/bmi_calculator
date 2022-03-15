import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  String text;
  Function onPressed;

  BuildButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff89ffc8),
              Color(0xff66ffb8),
            ],
          )),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        minWidth: double.infinity,
        height: 55,
        textColor: Colors.white,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, fontFamily: "Cairo"),
        ),
      ),
    );
  }
}
