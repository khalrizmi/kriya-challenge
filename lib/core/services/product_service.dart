import 'package:kriya_test/core/models/product_model.dart';
import 'package:kriya_test/core/repositories/interface/product_repository.dart';

class ProductService {
  late ProductRepository _productRepository;

  ProductService({required ProductRepository productRepository}) {
    _productRepository = productRepository;
  }

  Future<List<ProductModel>> getProducts() async {
    return await _productRepository.get();
  }

  Future<bool> buyProduct(List<ProductModel> products) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
