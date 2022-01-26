import 'package:get_it/get_it.dart';
import 'package:kriya_test/core/repositories/interface/product_repository.dart';
import 'package:kriya_test/core/repositories/product_repository_impl.dart';
import 'package:kriya_test/core/services/api.dart';

import 'package:kriya_test/core/services/product_service.dart';
import 'package:kriya_test/core/viewmodels/views/product_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerSingleton<Api>(Api());

  // repositories
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(api: locator<Api>()));

  // services
  locator.registerLazySingleton<ProductService>(
      () => ProductService(productRepository: locator<ProductRepository>()));

  // viewmodels
  locator.registerFactory<ProductViewModel>(
      () => ProductViewModel(productService: locator<ProductService>()));
}
