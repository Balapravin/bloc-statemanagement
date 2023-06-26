// To parse this JSON data, do
//
//     final productData = productDataFromJson(jsonString);

import 'dart:convert';

List<ProductData> productDataFromJson(String str) => List<ProductData>.from(json.decode(str).map((x) => ProductData.fromJson(x)));

String productDataToJson(List<ProductData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductData {
    final int? id;
    final String? title;
    final double? price;
    final String? description;
    final String? category;
    final String? image;
    final int? status;

    ProductData({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.status =0,
    });

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
    };
}

class Rating {
    final double? rate;
    final int? count;

    Rating({
        this.rate,
        this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
