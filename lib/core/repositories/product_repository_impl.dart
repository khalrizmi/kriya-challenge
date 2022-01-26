import 'dart:convert';

import 'package:kriya_test/core/models/product_model.dart';
import 'package:kriya_test/core/repositories/interface/product_repository.dart';
import 'package:kriya_test/core/services/api.dart';

class ProductRepositoryImpl implements ProductRepository {
  late Api _api;

  ProductRepositoryImpl({required Api api}) {
    _api = api;
  }

  @override
  Future<List<ProductModel>> get() async {
    final response = await _api.get(url: "todos");
    final resDecoded = json.decode(response);

    print(resDecoded);

    return List<ProductModel>.from(
        resDecoded.map((x) => ProductModel.fromJson(x))).toList();
  }
}
