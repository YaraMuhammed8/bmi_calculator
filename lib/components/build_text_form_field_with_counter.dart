import 'package:bmi_calculator/blocs/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildTextFormFieldWithCounter extends StatelessWidget {
  TextEditingController controller;

  BuildTextFormFieldWithCounter({required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = CounterCubit.get(context);
          controller.text = cubit.counter.toString();
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
                    cubit.decrementCounter();
                    controller.text = cubit.counter.toString();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                  ),
                ),
                suffixIcon: TextButton(
                  onPressed: () {
                    cubit.incrementCounter();
                    controller.text = cubit.counter.toString();
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                  ),
                )),
          );
        },
      ),
    );
  }
}
