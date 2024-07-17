import 'package:app_store/core/helper/api.dart';

import '../model/api_manger/getAllProdect.dart';

class UpdateProduct {
  Future<GetAllProdect> updateProduct(
      {required String id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
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
