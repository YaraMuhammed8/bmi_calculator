import 'package:bmi_calculator/blocs/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/light_theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
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
                  const Text(" BMI Calculator"),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.changeBodyMode();
                    },
                    icon: Icon(cubit.appBarAction)),
                IconButton(
                  onPressed: () {
                    cubit.changeThemeMode();
                  },
                  icon: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: cubit.themeLightMode?Colors.white:Colors.black87,
                          borderRadius: BorderRadius.circular(5),
                          /*boxShadow: [
                            BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 5,
                                color: Colors.grey.shade300)
                          ]*/),
                      child: Icon(
                        cubit.themeLightMode?Icons.light_mode_outlined:Icons.mode_night_outlined,
                        size: 22,
                        color:cubit.themeLightMode?primaryColor:Colors.white,
                      )),
                )
              ],
              flexibleSpace: SvgPicture.asset("assets/images/wave.svg",color:(!cubit.themeLightMode)? Colors.grey.shade900:null),
            ),
            body: cubit.bodyView);
      },
    );
  }
}
