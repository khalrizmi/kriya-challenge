import 'package:flutter/material.dart';
import 'package:kriya_test/core/models/product_model.dart';

class ProductItemSelectedWidget extends StatelessWidget {
  final ProductModel product;

  const ProductItemSelectedWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(product.title ?? "-")),
          const SizedBox(
            width: 16,
          ),
          Text("${product.qty}")
        ],
      ),
    );
  }
}
