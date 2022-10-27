import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kelola_aja/features/home/models/product.dart';
import 'package:kelola_aja/features/home/repository/home_repository.dart';

class HomeImplementation implements HomeRepository {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String _collection = 'products';

  @override
  Future<List<Product>?> fetchAll(String code) async {
    try {
      final query = await _db.collection(_collection).where('code', isEqualTo: code).get();
      final body = query.docs;

      return body
          .map<Product>((json) => Product.fromJson(json.data()))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
