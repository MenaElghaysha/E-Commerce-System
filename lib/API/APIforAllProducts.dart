import 'dart:convert';

import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/model/productsList.dart';
import 'package:http/http.dart' as http;

class ProductsAPI {
  Future<List<ProductsResponse>> getAllProducts() async {
    final http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      var jsonbody = jsonDecode(response.body);
      ProcustsList procustsList = ProcustsList.fromJson(jsonbody);
      List<ProductsResponse> productsResponse = procustsList.products
          .map((e) => ProductsResponse.fromJson(e))
          .toList();
      return productsResponse;
    } else {
      throw ("RequestFailure${response.body}");
    }
  }

  Future<List<ProductsResponse>> getProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('${category}'));

    if (response.statusCode == 200) {
      return List<ProductsResponse>.from(
          json.decode(response.body).map((x) => ProductsResponse.fromJson(x)));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
