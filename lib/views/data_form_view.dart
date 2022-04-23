import 'package:bmi_calculator/views/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/data_form_cubit/data_form_cubit.dart';
import '../components/custom_button.dart';
import '../components/custom_age_text_form_field.dart';
import '../components/custom_text_form_field.dart';
import '../components/gender_selector.dart';
import '../components/title_of_fields.dart';

class DataFormView extends StatelessWidget {
  DataFormView({Key? key}) : super(key: key);
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleOfFields(
                title: "Gender",
              ),
              GenderSelector(),
              const SizedBox(height: 10),
              TitleOfFields(
                title: "Weight",
              ),
              CustomTextFormField(
                controller: weightController,
                type: 'weight',
              ),
              const SizedBox(height: 10),
              TitleOfFields(
                title: "Height",
              ),
              CustomTextFormField(
                controller: heightController,
                type: 'height',
              ),
              const SizedBox(height: 10),
              TitleOfFields(
                title: "Age",
              ),
              CustomAgeTextFormField(controller: ageController),
              const SizedBox(height: 20),
              BlocConsumer<DataFormCubit, DataFormState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = DataFormCubit.get(context);
                  return CustomButton(
                      text: "Calculate",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultView(
                                      height:
                                          double.parse(heightController.text),
                                      weight:
                                          double.parse(weightController.text),
                                      heightUnit: cubit.selectedHeightUnit,
                                      weightUnit: cubit.selectedWeightUnit,
                                      age: int.parse(ageController.text),
                                    )),
                          );
                        }
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
