import 'package:flutter/material.dart';
import 'package:kriya_test/core/utils/kriya_toast.dart';
import 'package:kriya_test/core/viewmodels/views/product_viewmodel.dart';
import 'package:kriya_test/ui/base_widget.dart';
import 'package:kriya_test/ui/widgets/empty_state_widget.dart';
import 'package:kriya_test/ui/widgets/header_widget.dart';
import 'package:kriya_test/ui/widgets/product_item_selected_widget.dart';
import 'package:kriya_test/ui/widgets/shared_button_widget.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: BaseWidget<ProductViewModel>(
        model: Provider.of<ProductViewModel>(context),
        builder: (context, viewModel, child) => Container(
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
              _buildBuyButton(viewModel)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleProduct() {
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: const Text(
        "Product Selected",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProductList(ProductViewModel viewModel) {
    return Expanded(
        child: viewModel.productSelected.isEmpty
            ? const EmptyStateWidget(
                title: "Empty Product",
                description: "Please select the product first")
            : ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: viewModel.productSelected.length,
                itemBuilder: (context, index) => ProductItemSelectedWidget(
                      product: viewModel.productSelected[index],
                    )));
  }

  Widget _buildBuyButton(ProductViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
      child: SharedButtonWidget(
          text: "PURCHASE",
          isBusy: viewModel.busy,
          onPressed: () async {
            if (viewModel.busy) {
              return;
            } else if (viewModel.totalProductsSelected == 0) {
              KriyaToast.show(
                  "Please choose a product before making a purchase");
            } else {
              bool result = await viewModel.buyProduct();
              if (result) {
                KriyaToast.show("Successful purchase");
                Navigator.pop(context);
              } else {
                KriyaToast.show("Failed purchase");
              }
            }
          }),
    );
  }
}
