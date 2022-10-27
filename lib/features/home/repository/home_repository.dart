import '../models/product.dart';

abstract class HomeRepository {
  Future<List<Product>?> fetchAll(String code);
}
