import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samplebloc/helper/helper.dart';
import 'package:samplebloc/model/home_product_model.dart';

class ApiService {
  Future loginApi(String email, String password) async {
    try {
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        helper.logger(response.body);
        return jsonDecode(response.body);
      } else {
        helper.logger("Login error");
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(' Login Exception --->  $e');
    }
  }

  Future<List<HomeProduct>> getProductData() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        helper.logger(jsonDecode(response.body).toString());
        return homeProductFromJson(response.body);
      } else {
        throw Exception('getProductData -----> ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('getProductData Exception -----> $e');
    }
  }
}

final ApiService apiService = ApiService();
