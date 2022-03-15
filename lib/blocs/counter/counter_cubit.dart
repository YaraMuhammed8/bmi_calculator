import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  static CounterCubit get(context)=> BlocProvider.of(context);
  int counter = 20;
  void incrementCounter(){
    counter++;
    emit(CounterInrementState());
  }
  void decrementCounter(){
    counter--;
    emit(CounterDerementState());
  }
}
