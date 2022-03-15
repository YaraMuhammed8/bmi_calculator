part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterInrementState extends CounterState {}
class CounterDerementState extends CounterState {}
