import 'package:bmi_calculator/blocs/main_cubit/main_cubit.dart';
import 'package:bmi_calculator/blocs/result_cubit/result_cubit.dart';
import 'package:bmi_calculator/theme/dark_theme.dart';
import 'package:bmi_calculator/theme/light_theme.dart';
import 'package:bmi_calculator/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/data_form_cubit/data_form_cubit.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataFormCubit(),
        ),
        BlocProvider(
          create: (context) => ResultCubit(),
        ),
        BlocProvider(
          create: (context) => MainCubit(),
        ),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:LightTheme,
            darkTheme: DarkTheme,
            themeMode: cubit.themeLightMode?ThemeMode.light:ThemeMode.dark,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}