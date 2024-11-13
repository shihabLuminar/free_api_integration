import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:token_test/model/products_res_model.dart';
import 'package:token_test/utils/app_utils.dart';

class HomeScreenController with ChangeNotifier {
//create variable to sotre products list get form sever

  List<ProductModel> productsList = [];

  Future<void> getProducts() async {
    // setup url
    final url = Uri.parse("https://freeapi.luminartechnohub.com/products-all/");
    try {
      // call api
      final response = await http.get(url, headers: {
        "Authorization": "Bearer ${await AppUtils.getStoredAccessToken()}",
      });
      log(response.body);
      // check status code
      if (response.statusCode == 200) {
// convet data to model
        ProductsResModel resModel = productsResModelFromJson(response.body);

        // store data to vairiable

        productsList = resModel.data ?? [];
      }
    } catch (e) {}
  }
}
