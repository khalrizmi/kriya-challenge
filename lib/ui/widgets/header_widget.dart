import 'package:flutter/material.dart';
import 'package:kriya_test/core/viewmodels/views/product_viewmodel.dart';
import 'package:kriya_test/ui/shared/shared_color.dart';

class HeaderWidget extends StatefulWidget {
  final ProductViewModel productViewModel;

  const HeaderWidget({Key? key, required this.productViewModel})
      : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 3,
        color: SharedColors.primaryColor,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Total Product",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                "${widget.productViewModel.totalProductsSelected}",
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
