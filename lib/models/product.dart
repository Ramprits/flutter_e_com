import 'package:meta/meta.dart';

class Product {
  String id, name, description;
  Map<String, dynamic> picture;
  num price;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.description,
    @required this.picture,
  });

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
        description: jsonData["description"],
        id: jsonData["id"],
        price: jsonData["price"],
        picture: jsonData["picture"],
        name: jsonData["name"]);
  }
}
