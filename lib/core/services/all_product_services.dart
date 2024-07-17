import 'package:app_store/core/helper/api.dart';
import 'package:app_store/core/model/api_manger/getAllProdect.dart';

class AllProductServices {
  static Future<List<GetAllProdect>> getProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<GetAllProdect> prodectList = [];
    for (int i = 0; i < data.length; i++) {
      prodectList.add(GetAllProdect.fromJson(data[i]));
    }
    return prodectList;
  }
}
