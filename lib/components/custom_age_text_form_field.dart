import 'package:bmi_calculator/blocs/data_form_cubit/data_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAgeTextFormField extends StatelessWidget {
  TextEditingController controller;

  CustomAgeTextFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataFormCubit, DataFormState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DataFormCubit.get(context);
        controller.text = cubit.age.toString();
        return TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "please fill the field";
            }
          },
          style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey.shade50,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none),
              prefixIcon: TextButton(
                onPressed: () {
                  cubit.decrementAge();
                  controller.text = cubit.age.toString();
                },
                child: const Text(
                  "-",
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                ),
              ),
              suffixIcon: TextButton(
                onPressed: () {
                  cubit.incrementAge();
                  controller.text = cubit.age.toString();
                },
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                ),
              )),
        );
      },
    );
  }
}
