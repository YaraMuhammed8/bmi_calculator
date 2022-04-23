import 'package:bmi_calculator/blocs/result_cubit/result_cubit.dart';
import 'package:bmi_calculator/components/bmi_chart.dart';
import 'package:bmi_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/custom_button.dart';

class ResultView extends StatelessWidget {
  double height;
  double weight;
  String heightUnit;
  String weightUnit;
  int age;

  ResultView({
    required this.height,
    required this.age,
    required this.weight,
    required this.heightUnit,
    required this.weightUnit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResultCubit, ResultState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ResultCubit.get(context);
        cubit.calculateBMI(
            height: height,
            weight: weight,
            heightUnit: heightUnit,
            weightUnit: weightUnit);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/bmi.png",
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
                const Text(" BMI Result"),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 250, child: BMIChart(bmi: cubit.newBMI)),
                  Text(
                      "Your BMI is ${cubit.newBMI.toStringAsFixed(2)} which indicates you're in the  ${cubit.status} category.\n"
                      "Maintaining a healthy weight is important for your heart health. "
                      "Moving more can lower your risk factors for heart disease.",
                      style: AppTextStyles.bodyText),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      text: "Recalculate",
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
