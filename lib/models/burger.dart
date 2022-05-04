class Burger {
  final String imgPath;
  final String title;
  final String desc;
  final String duration;
  final double prix;
  final String delivery;
  final String rating;

  Burger({
    required this.imgPath,
    required this.title,
    required this.desc,
    required this.duration,
    required this.prix,
    required this.delivery,
     this.rating = '4.5',
  });

  factory Burger.fromJson(dynamic json) {
    return Burger(
      imgPath: "assets/img/food/tamago.png",
      title: json['name'] as String,
      desc: json['description'] as String,
      duration: json['cookingTime'] as String,
      prix: json['price'] as double,
      delivery: "hu",
      
    );
  }
  static List<Burger> burgerFromSnapshot(List snapshot) {

    return snapshot.map((data) => Burger.fromJson(data)).toList();
  }

  @override
  String toString() => " $title";
}