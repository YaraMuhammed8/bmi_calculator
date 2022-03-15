import 'package:bmi_calculator/blocs/change_gender/change_gender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeGenderCubit(),
      child: BlocConsumer<ChangeGenderCubit, ChangeGenderState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ChangeGenderCubit.get(context);
            return Row(
              children: [
                Expanded(
                  child: GenderItem(
                      text: "Male",
                      imgName: "male.svg",
                      isActive: cubit.isMale,
                      onPressed: () {
                        cubit.setToMale();
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
                      cubit.setToFemale();
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}

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
              ? const BorderSide(color: Color(0xff006672), width: 2)
              : BorderSide.none),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 50,
            width: 50,
            child: SvgPicture.asset(
              "assets/images/" + imgName,
              color: isActive ? const Color(0xff006672) : Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
                color: isActive ? const Color(0xff006672) : Colors.blueGrey,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                fontSize: 17),
          )
        ]),
      ),
    );
  }
}
