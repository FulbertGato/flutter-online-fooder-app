import 'package:customer_app/models/burger.dart';
import 'package:customer_app/models/complement.dart';

import 'product.dart';

class Menu {
  final String imgPath;
  final String title;
  final String desc;
  final String duration;
  final double prix;
  final String delivery;
  final String rating;
  final Burger burger;
  final String code;
  final List<Complement> complements;

  Menu({
    required this.imgPath,
    required this.title,
    required this.desc,
    required this.duration,
    required this.prix,
    required this.delivery,
    this.rating = '4.5',
    required this.burger,
    required this.code,
    required this.complements,
  });

  factory Menu.fromJson(dynamic json) {
    var _complements = <Complement>[];
    for (var element in (json['complements'] as List)) {
      _complements.add(Complement.fromJson(element));
    }

    return Menu(
      imgPath: "https://urchin-app-3onl3.ondigitalocean.app/${json['image']}",
      title: json['name'] as String,
      desc: json['description'] as String,
      duration: json['cookingTime'] as String,
      prix: json['price'] as double,
      delivery: "hu",
      rating: "4.5",
      burger: Burger.fromJson(json['burgerObject']),
      code: json['code'] as String,
      complements: _complements,
    );
  }

  static List<Menu> menuFromSnapshot(List snapshot) {
    return snapshot.map((data) => Menu.fromJson(data)).toList();
  }

  static Product menuToProduct(Menu menu) {
    return Product(
      imgPath: menu.imgPath,
      title: menu.title,
      desc: menu.desc,
      duration: menu.duration,
      prix: menu.prix,
      code: menu.code,
    );
  }
}
