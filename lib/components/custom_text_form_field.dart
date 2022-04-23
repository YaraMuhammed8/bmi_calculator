import 'package:bmi_calculator/blocs/data_form_cubit/data_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/units.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  String type;
  List<String> unitsList = [];
  String selectedUnit = "";
  CustomTextFormField({required this.controller, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataFormCubit,DataFormState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DataFormCubit.get(context);
        if (type == 'weight') {
          unitsList = Units.weightUnits;
          selectedUnit = cubit.selectedWeightUnit;
        } else {
          unitsList = Units.heightUnits;
          selectedUnit = cubit.selectedHeightUnit;
        }
        return TextFormField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            suffixIcon: DecoratedBox(
              decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(color: Colors.blueGrey, width: 1.5)),
              ),
              child: SizedBox(
                width: 70,
                child: Center(
                  child: DropdownButton(
                    value: selectedUnit,
                    elevation: 1,
                    underline:const SizedBox(),
                    dropdownColor: Colors.blueGrey.shade100,
                    style: const TextStyle(
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.blueGrey,
                    ),
                    alignment: Alignment.center,
                    onChanged: (value) {
                      if (type == 'weight'){
                        cubit.changeWeightUnit(value.toString());
                      }
                      else if(type == 'height')
                        {
                          cubit.changeHeightUnit(value.toString());
                        }
                    },
                    items: List.generate(
                        unitsList.length,
                        (index) => DropdownMenuItem(
                              value: unitsList[index],
                              child: Text(
                                unitsList[index],
                                style:
                                    const TextStyle(color: Colors.blueGrey),
                              ),
                            )),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
