import 'package:bmi_calculator/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenderItem extends StatelessWidget {

  String imgName;
  String text;
  Function onPressed;
  bool isActive;
  GenderItem(
      {required this.text,
      required this.imgName,
      required this.onPressed,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: Colors.blueGrey.shade50,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: isActive
              ?  BorderSide(color: primaryColor, width: 2)
              : BorderSide.none),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 50,
            width: 50,
            child: SvgPicture.asset(
              "assets/images/" + imgName,
              color: isActive ? primaryColor : Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
                color: isActive ? primaryColor : Colors.blueGrey,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                fontSize: 17),
          )
        ]),
      ),
    );
  }
}
