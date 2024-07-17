import 'package:app_store/core/helper/api.dart';
import 'package:app_store/core/model/api_manger/getAllProdect.dart';

class CategoriesServices {
  Future<List<GetAllProdect>> getCategoresProdect(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: "https:fakestoreapi.com/products/category/$categoryName");
    List<GetAllProdect> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(GetAllProdect.fromJson(data[i]));
    }
    return productList;
  }
}
