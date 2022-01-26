import 'package:flutter/material.dart';
import 'package:kriya_test/core/models/product_model.dart';
import 'package:kriya_test/core/viewmodels/views/product_viewmodel.dart';
import 'package:kriya_test/ui/base_widget.dart';
import 'package:kriya_test/ui/kriya_router.dart';
import 'package:kriya_test/ui/widgets/empty_state_widget.dart';
import 'package:kriya_test/ui/widgets/header_widget.dart';
import 'package:kriya_test/ui/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product"),
        ),
        floatingActionButton: _buildFloatingActionButton(),
        body: BaseWidget<ProductViewModel>(
            model: Provider.of<ProductViewModel>(context),
            onModelReady: (viewModel) async {
              viewModel.getProducts();
            },
            builder:
                (BuildContext context, ProductViewModel viewModel, child) =>
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderWidget(
                            productViewModel: viewModel,
                          ),
                          _buildTitleProduct(),
                          _buildProductList(viewModel),
                        ],
                      ),
                    )));
  }

  Widget _buildTitleProduct() {
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: const Text(
        "Product",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProductList(ProductViewModel viewModel) {
    return Expanded(
        child: RefreshIndicator(
      onRefresh: () => viewModel.getProducts(),
      child: viewModel.isFirstLoad
          ? _buildShimmerLoading()
          : viewModel.products.isEmpty
              ? const EmptyStateWidget(
                  title: "Empty Product",
                  description: "No products available yet")
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) => ProductItemWidget(
                        product: viewModel.products[index],
                        onPressed: (ProductModel product, ProductPressed type) {
                          if (type == ProductPressed.add) {
                            viewModel.addProduct(product);
                          } else if (type == ProductPressed.reduce) {
                            viewModel.reduceProduct(product);
                          }
                        },
                      )),
    ));
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                width: double.infinity,
              ),
            ));
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
        child: const Icon(
          Icons.check_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.productDetail);
        });
  }
}
