import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kriya_test/ui/views/product_detail_view.dart';
import 'package:kriya_test/ui/views/product_view.dart';

class RoutePaths {
  static const String product = "product";
  static const String productDetail = "product_detail";
}

class KriyaRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.product:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RoutePaths.product),
            builder: (_) => ProductView());
      case RoutePaths.productDetail:
        return MaterialPageRoute(
            settings: RouteSettings(name: RoutePaths.productDetail),
            builder: (_) => ProductDetailView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Container(),
                ));
    }
  }
}
