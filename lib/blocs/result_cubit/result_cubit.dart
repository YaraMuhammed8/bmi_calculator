import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../local/cache/cache_helper.dart';
import '../../models/bmi_status.dart';

part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit() : super(ResultInitial());
  static ResultCubit get(context) => BlocProvider.of(context);
  double newBMI=0;
  String status = "";
  calculateBMI({
    required double height,
    required double weight,
    required String heightUnit,
    required String weightUnit,
  }) {
    newBMI = weight;
    if (heightUnit == 'cm') {
      height = height / 100.0;
    }
    newBMI /= (height * height);
    setBMIStatus(newBMI);
    CacheHelper.putDouble(key: "lastBMIResult", value: newBMI).then((value) {
      emit(CalculateBMI());
    });
  }

  setBMIStatus(double bmi) {
    for (int i = 0; i < bmiStatus.length; i++) {
      if (bmi >= bmiStatus[i].start && bmi <= bmiStatus[i].end) {
        status = bmiStatus[i].status;
      }
    }
  }
}
