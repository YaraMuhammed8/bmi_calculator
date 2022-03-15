import 'package:bmi_calculator/blocs/unit/unit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/units.dart';

class BuildTextFormField extends StatelessWidget {
  TextEditingController controller;
  String type;
  List<String> unitsList = [];
  String selectedUnit = "";
  BuildTextFormField({required this.controller, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnitCubit(),
      child: BlocConsumer<UnitCubit, UnitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = UnitCubit.get(context);
          if (type == 'w') {
            unitsList = weightUnits;
            selectedUnit = cubit.selectedWeightUnit;
          } else {
            unitsList = heightUnits;
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
                      underline: const SizedBox(),
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
                        cubit.changeUnit(value.toString(), type);
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
      ),
    );
  }
}
