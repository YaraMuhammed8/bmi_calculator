import 'package:bmi_calculator/views/data_form_view.dart';
import 'package:bmi_calculator/views/history_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../local/cache/cache_helper.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  bool bodyFormMode = true;
  bool themeLightMode =(CacheHelper.getBoolean(key: "isLight"))??true;
  IconData appBarAction = Icons.history;
  Widget bodyView = DataFormView();
  void changeBodyMode() {
    bodyFormMode = !bodyFormMode;
    if (bodyFormMode == true) {
      appBarAction = Icons.history;
      bodyView = DataFormView();
    } else {
      appBarAction = Icons.add;
      bodyView = HistoryView();
    }
    emit(MainChangeBodyMode());
  }

  void changeThemeMode() {
    themeLightMode = !themeLightMode;
    CacheHelper.putBoolean(key: "isLight", value: themeLightMode).then((value) {
      emit(MainChangeThemeMode());
    });
  }
}