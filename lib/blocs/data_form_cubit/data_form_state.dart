part of 'data_form_cubit.dart';

@immutable
abstract class DataFormState {}

class FormInitial extends DataFormState {}
class FormChangeGender extends DataFormState {}
class FormIncrementAge extends DataFormState {}
class FormDecrementAge extends DataFormState {}
class FormChangeWeightUnit extends DataFormState {}
class FormChangeHeightUnit extends DataFormState {}
