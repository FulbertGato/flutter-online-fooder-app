class Complement {
  final String title;
  final String code;
  final double prix;

  Complement({
    required this.title,
    required this.code,
    required this.prix,
  });

  factory Complement.fromJson(dynamic json) {
    return Complement(
      title: json['name'] as String,
      code: json['code'] as String,
      prix: json['price'] as double,
    );
  }

  @override
  String toString() => title;
}
