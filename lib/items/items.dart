import 'dart:convert';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
  Shop({
    this.status,
    this.results,
    this.data,
    this.message,
  });

  String? status;
  int? results;
  Data? data;
  String? message;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        status: json["status"],
        results: json["results"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.product,
  });

  List<Product> product;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.stock,
    required this.createDate,
    required this.category,
  });

  int id;
  String name;
  String image;
  String price;
  int stock;
  int createDate;
  List<Category> category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        stock: json["stock"],
        createDate: json["createDate"],
        category: List<Category>.from(
            json["category"].map((x) => categoryValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "stock": stock,
        "createDate": createDate,
        "category":
            List<dynamic>.from(category.map((x) => categoryValues.reverse[x])),
      };
}

enum Category { ELECTRONIC, LAPTOP, MOBILE, WATCH, KEYBOARD, HEADSEAT }

final categoryValues = EnumValues({
  "electronic": Category.ELECTRONIC,
  "headseat": Category.HEADSEAT,
  "keyboard": Category.KEYBOARD,
  "laptop": Category.LAPTOP,
  "mobile": Category.MOBILE,
  "watch": Category.WATCH
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
