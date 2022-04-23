import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/units.dart';

part 'data_form_state.dart';

class DataFormCubit extends Cubit<DataFormState> {
  DataFormCubit() : super(FormInitial());

  static DataFormCubit get(context) => BlocProvider.of(context);
  bool isMale = true;
  int age = 20;
  String selectedWeightUnit = Units.weightUnits[0];
  String selectedHeightUnit = Units.heightUnits[0];
  void changeGender(bool value) {
    isMale = value;
    emit(FormChangeGender());
  }

  void incrementAge() {
    age++;
    emit(FormIncrementAge());
  }

  void decrementAge() {
    age--;
    emit(FormDecrementAge());
  }

  void changeWeightUnit(String value) {
    selectedWeightUnit = value;
    emit(FormChangeWeightUnit());
  }

  void changeHeightUnit(String value) {
    selectedHeightUnit = value;
    emit(FormChangeHeightUnit());
  }
}
