import 'package:http/http.dart' as http;

import '../Models/Product_Model.dart';
import '../bloc/product_model_bloc.dart';

class ProductRepo {
  Future<List<ProductModel>> getproduct() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception("Failed to load");
    }
  }
}
