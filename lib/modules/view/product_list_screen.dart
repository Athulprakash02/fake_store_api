import 'package:fake_store_api/modules/controller/product_list_controller.dart';
import 'package:fake_store_api/modules/view/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductListScreen extends StatelessWidget {
  final ProductListController controller = Get.find();

  ProductListScreen({super.key});

  int getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width > 900) return 4; // Tablet landscape
    if (width > 600) return 3; // Tablet portrait
    return 2; // Mobile (Flipkart style)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fake Store")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.productsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(context),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: controller.productsList[index]);
          },
        );
      }),
    );
  }
}