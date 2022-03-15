import 'package:bmi_calculator/components/build_button.dart';
import 'package:bmi_calculator/components/build_text_form_field.dart';
import 'package:bmi_calculator/components/build_text_form_field_with_counter.dart';
import 'package:bmi_calculator/components/gender_selector.dart';
import 'package:bmi_calculator/components/title_of_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bmi_calculator/views/result_view.dart';

class HomeScreen extends StatelessWidget {
  Color fillColor = Colors.blueGrey.shade50;
  @override
  Widget build(BuildContext context) {
    TextEditingController ageController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffFAFAFA),
            elevation: 0,
            toolbarHeight: 90,
            title: Row(
              children: [
                Image.asset(
                  "assets/images/bmi.png",
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
                const Text(
                  " BMI Calculator",
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
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleOfFields(title: "Gender",),
                    GenderSelector(),
                    const SizedBox(height: 20),
                    TitleOfFields(title: "Weight",),
                    BuildTextFormField(controller: weightController, type: 'w',),
                    const SizedBox(height: 20),
                    TitleOfFields(title: "Height",),
                    BuildTextFormField(controller: heightController, type: 'h',),
                    const SizedBox(height: 20),
                    TitleOfFields(title: "Age",),
                    BuildTextFormFieldWithCounter(controller: ageController),
                    const SizedBox(height: 20),
                    BuildButton(
                        text: "Calculate",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultView(
                                        height: double.parse(heightController.text),
                                        weight: double.parse(weightController.text),
                                        age: int.parse(ageController.text),
                                      )),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
