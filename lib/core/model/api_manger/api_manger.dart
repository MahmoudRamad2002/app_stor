import 'dart:convert';
import 'dart:core';

import 'package:app_store/core/helper/api.dart';
import 'package:app_store/core/model/api_manger/getAllProdect.dart';
import 'package:http/http.dart' as http;

class apiMager {
  //https://fakestoreapi.com/products
  //https://fakestoreapi.com/products/categories
  static const String baseUrl = 'https://fakestoreapi.com';

  static Future<GetAllProdect> getProduct() async {
    var url = Uri.http(baseUrl, '/products');
    var resopnse = await http.get(url);
    var body = resopnse.body;
    var json = jsonDecode(body);
    var product = GetAllProdect.fromJson(json);
    return product;
  }

  static Future<dynamic> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }

  static Future<GetAllProdect> getCategoresProdect(
      {required String categoryName}) async {
    var url = Uri.http(baseUrl, "/products/category/$categoryName", {});
    var response = await http.get(url);
    var body = response.body;
    var json = jsonDecode(body);
    var categories = GetAllProdect.fromJson(json);
    return categories;
  }
}
