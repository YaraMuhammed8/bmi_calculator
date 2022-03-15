import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'change_gender_state.dart';

class ChangeGenderCubit extends Cubit<ChangeGenderState> {
  ChangeGenderCubit() : super(ChangeGenderInitial());
  bool  isMale =true;
  static ChangeGenderCubit get(context)=> BlocProvider.of(context);
  void setToFemale()
  {
    isMale = false;
    emit(ChangeGenderChanged());
  }
  void setToMale()
  {
    isMale = true;
    emit(ChangeGenderChanged());
  }
}