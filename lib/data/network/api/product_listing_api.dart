import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fake_store_api/data/models/product_list_response.dart';
import 'package:fake_store_api/data/network/service/api_exception.dart';
import 'package:fake_store_api/data/network/service/api_service.dart';
import 'package:fake_store_api/data/network/service/app_url.dart';

class ProductListingApi {
    final ApiService _apiService = ApiService();




    Future<List<ProductListResponse>> getProducts() async {
    try {
      final Response response = await _apiService.get(
        AppUrl.product,
        options: Options(
          headers: {},
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;

        return data.map((e) => ProductListResponse.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}