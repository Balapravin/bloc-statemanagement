
import 'dart:convert';
import 'package:bloc_poc/model/product_data.dart';
import 'package:http/http.dart' as http;
import '../helper/helper.dart';

class ApiService {
  Future loginApi(String email, String password) async {
    try {
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        helper.logger(response.body);
        return jsonDecode(response.body);
      } else {
        helper.logger(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(' Login Exception --->  $e');
    }
  }

  Future<List<ProductData>> getProductData() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/category/jewelery'));
      if (response.statusCode == 200) {
        helper.logger(jsonDecode(response.body).toString());
        return productDataFromJson(response.body);
      } else {
        throw Exception('getProductData -----> ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('getProductData Exception -----> $e');
    }
  }
}

final ApiService apiService = ApiService();