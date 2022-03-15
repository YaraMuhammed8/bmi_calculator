import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/units.dart';
part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit() : super(UnitInitial());
  String selectedWeightUnit = weightUnit;
  String selectedHeightUnit = heightUnit;
  static UnitCubit get(context) => BlocProvider.of(context);
  changeUnit(String value, String type) {
    if (type == 'w') {
      selectedWeightUnit = value;
      weightUnit = value;
    } else {
      selectedHeightUnit = value;
      heightUnit = value;
    }
    emit(UnitChanged());
  }
}
