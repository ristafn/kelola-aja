import 'package:bloc/bloc.dart';

import '../models/product.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  void onAdded(List<Product> state) {
    emit(state);
  }

  void onDeleted(int index) {
    state.removeAt(index);
    emit(state);
  }
}
