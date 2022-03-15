import 'package:bmi_calculator/components/bmi_chart.dart';
import 'package:bmi_calculator/models/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/build_button.dart';
import '../models/bmi_status.dart';

class ResultView extends StatelessWidget {
  double height;
  double weight;
  int age;
  double bmi = 0;
  String status="";
  ResultView({required this.height, required this.age, required this.weight}){
    bmi = weight;
    if(heightUnit =='cm') {
      height = height / 100.0;}
    bmi /= (height * height);
    for(int i=0;i<bmiStatus.length;i++){
      if(bmi >= bmiStatus[i].start && bmi <= bmiStatus[i].end){
        status =  bmiStatus[i].status;
    }
  }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0,
        toolbarHeight: 90,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              "assets/images/bmi.png",
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
            const Text(
              " BMI Result",
              style: TextStyle(
                  color: Color(0xff006672),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Cairo"),
            ),
          ],
        ),
        flexibleSpace: SvgPicture.asset("assets/images/wave.svg"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BMIChart(bmi: bmi),
              Text(
                  "Your BMI is ${bmi.toStringAsFixed(2)} which indicates you're in the  $status category.",
                  style: TextStyle(
                      color: Colors.blueGrey.shade700,
                      fontSize: 19,
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w500)),
              Text(
                "Maintaining a healthy weight is important for your heart health. "
                "Moving more can lower your risk factors for heart disease.",
                style: TextStyle(
                    color: Colors.blueGrey.shade700,
                    fontSize: 19,
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              BuildButton(
                  text: "Recalculate",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
