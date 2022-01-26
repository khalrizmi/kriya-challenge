import 'package:kriya_test/core/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> get();
}
