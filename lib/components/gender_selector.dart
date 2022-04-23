import 'package:bmi_calculator/blocs/data_form_cubit/data_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gender_item.dart';

class GenderSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataFormCubit, DataFormState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = DataFormCubit.get(context);
          return Row(
            children: [
              Expanded(
                child: GenderItem(
                    text: "Male",
                    imgName: "male.svg",
                    isActive: cubit.isMale,
                    onPressed: () {
                      cubit.changeGender(true);
                    }),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GenderItem(
                  text: "Female",
                  imgName: "female.svg",
                  isActive: !cubit.isMale,
                  onPressed: () {
                    cubit.changeGender(false);
                  },
                ),
              ),
            ],
          );
        });
  }
}