import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));
String productModelToJson(ProductsModel product) => json.encode(product.toJson());

class ProductsModel {
  List<Product> data;

  ProductsModel({required this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      ProductsModel(
          data: List<Product>.from(json['data'].map((p) => Product.fromJson(p))),
      );

  Map<String, dynamic> toJson() => {
    "data" : List<Product>.from(data.map((d) => d.toJson()))
  };
}

class Product {
  int id;
  String name;
  String price;
  String time;
  String category;

  Product({required this.id, required this.name, required this.price,
  required this.time, required this.category});

  factory Product.fromJson(Map<String, dynamic> json) =>
      Product(id: json['id'], name: json['name'], price: json['price'],
          time: json['time'], category: json['category']);

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "price" : price,
    "time" : time,
    "category" : category,
  };


}
