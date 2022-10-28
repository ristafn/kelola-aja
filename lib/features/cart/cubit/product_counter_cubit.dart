import 'package:bloc/bloc.dart';

class ProductCounterCubit extends Cubit<int> {
  ProductCounterCubit() : super(1);

  void onIncrement() => emit(state + 1);

  void onDecrement() => emit(state > 0 ? state - 1 : 0);
}
