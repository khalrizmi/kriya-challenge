import 'package:flutter/material.dart';
import 'package:kriya_test/core/models/product_model.dart';

enum ProductPressed { reduce, add }

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;
  final Function(ProductModel, ProductPressed) onPressed;

  const ProductItemWidget(
      {Key? key, required this.product, required this.onPressed})
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
          _buildButton()
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              onPressed(product, ProductPressed.reduce);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text("${product.qty}"),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              onPressed(product, ProductPressed.add);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
