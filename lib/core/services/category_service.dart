import 'package:app_store/core/helper/api.dart';

class CategoryService {
  static Future<dynamic> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
