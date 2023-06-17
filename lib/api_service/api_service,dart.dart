import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samplebloc/helper/helper.dart';
import 'package:samplebloc/model/home_product_model.dart';

class ApiService {
  Future<List<HomeProduct>> getProductData() async {
  final response =   await http .get(Uri.parse('https://fakestoreapi.com/products'));

  try {
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