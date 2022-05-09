import 'package:customer_app/models/product.dart';

class Burger {
  final String imgPath;
  final String title;
  final String desc;
  final String duration;
  final double prix;
  final String delivery;
  final String rating;
  final String code;

  Burger({
    required this.imgPath,
    required this.title,
    required this.desc,
    required this.duration,
    required this.prix,
    required this.delivery,
    required this.code,
    this.rating = '4.5',
  });

  factory Burger.fromJson(dynamic json) {
    return Burger(
      imgPath: "http://10.0.2.2:5000/${json['image']}",
      title: json['name'] as String,
      desc: json['description'] as String,
      duration: json['cookingTime'] as String,
      prix: json['price'] as double,
      delivery: "hu",
      code: json['code'] as String,
    );
  }
  static List<Burger> burgerFromSnapshot(List snapshot) {
    return snapshot.map((data) => Burger.fromJson(data)).toList();
  }

  static Product burgerToProduct(Burger burger) {
    return Product(
      imgPath: burger.imgPath,
      title: burger.title,
      desc: burger.desc,
      duration: burger.duration,
      prix: burger.prix,
      code: burger.code,
    );
  }

  @override
  String toString() => " $title";
}
