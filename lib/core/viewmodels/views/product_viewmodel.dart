import 'package:kriya_test/core/models/product_model.dart';
import 'package:kriya_test/core/services/product_service.dart';
import 'package:kriya_test/core/viewmodels/base_viewmodel.dart';

class ProductViewModel extends BaseViewModel {
  late ProductService _productService;
  List<ProductModel> _products = [];
  int _totalProductsSelected = 0;

  bool isFirstLoad = true;

  List<ProductModel> get products => _products;

  int get totalProductsSelected => _totalProductsSelected;

  List<ProductModel> get productSelected =>
      products.where((element) => element.qty! > 0).toList();

  ProductViewModel({required ProductService productService}) {
    _productService = productService;
  }

  Future getProducts() async {
    setBusy(true);

    _totalProductsSelected = 0;
    _products = await _productService.getProducts();
    isFirstLoad = false;
    notifyListeners();

    setBusy(false);
  }

  void addProduct(ProductModel product) {
    final prod = _products.firstWhere((element) => element.id == product.id);
    prod.qty = prod.qty! + 1;
    _totalProductsSelected++;
    notifyListeners();
  }

  void reduceProduct(ProductModel product) {
    final prod = _products.firstWhere((element) => element.id == product.id);
    if (prod.qty != null && prod.qty! > 0) {
      prod.qty = prod.qty! - 1;
      _totalProductsSelected--;
      notifyListeners();
    }
  }

  Future<bool> buyProduct() async {
    setBusy(true);

    bool result = false;

    if (productSelected.isNotEmpty) {
      result = await _productService.buyProduct(productSelected);

      getProducts();
    }

    setBusy(false);

    return result;
  }
}
