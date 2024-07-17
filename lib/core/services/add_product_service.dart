import 'package:app_store/core/helper/api.dart';
import 'package:app_store/core/model/api_manger/getAllProdect.dart';

class AddProductService {
  Future<GetAllProdect> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );
    return GetAllProdect.fromJson(data);
  }
}
