import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/modules/basics_app/counter/cubit/states.dart';

class CountCubit extends Cubit<CountStates> {
  CountCubit() : super(CountInitial());
  int counter = 1;

  static CountCubit get(context) => BlocProvider.of(context);

  void minus() {
    counter--;
    emit(CountMinus(counter));
  }

  void plus() {
    counter++;
    emit(CountPlus(counter));
  }
}
