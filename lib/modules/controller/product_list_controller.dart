import 'package:fake_store_api/data/models/product_list_response.dart';
import 'package:fake_store_api/data/network/api/product_listing_api.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  var productsList = <ProductListResponse>[].obs;
  final ProductListingApi productsApi = ProductListingApi();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);

    try {
      final response = await productsApi.getProducts();
      productsList.clear();
      productsList.assignAll(response);
    } catch (e) {
      isLoading(false);
    }
    isLoading(false);
  }
}
