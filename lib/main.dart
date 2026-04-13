import 'package:fake_store_api/constants/app_strings.dart';
import 'package:fake_store_api/routes/app_pages.dart';
import 'package:fake_store_api/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        title: AppStrings.appName,
        initialRoute: AppRoutes.productListScreen,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
       
      );
  }
}