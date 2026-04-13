import 'package:fake_store_api/modules/controller/product_list_controller.dart';
import 'package:get/get.dart';

class ProductListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() => ProductListController());
  
  }
}