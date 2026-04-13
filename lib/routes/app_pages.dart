import 'package:fake_store_api/modules/binding/product_list_binding.dart';
import 'package:fake_store_api/modules/view/product_list_screen.dart';
import 'package:fake_store_api/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoutes.productListScreen,
      page: () => ProductListScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: ProductListBinding(),
    ),
  ];
}