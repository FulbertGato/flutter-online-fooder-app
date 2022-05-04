import 'package:customer_app/models/burger.dart';
import 'package:customer_app/models/complement.dart';

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
    (json['complements'] as List).forEach((element) {
      _complements.add(Complement.fromJson(element));
    });
    print(_complements);
    return Menu(
      imgPath: "assets/img/food/tamago.png",
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
}
