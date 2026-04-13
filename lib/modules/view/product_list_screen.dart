import 'package:fake_store_api/constants/app_strings.dart';
import 'package:fake_store_api/modules/controller/product_list_controller.dart';
import 'package:fake_store_api/modules/view/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  final ProductListController controller = Get.find();

  ProductListScreen({super.key});

  int getCrossAxisCount(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    if (size.width > 900) return 4; 
    if (size.width > 600) return 3; 
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text(AppStrings.appName)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
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
          ),
        );
      }),
    );
  }
}
