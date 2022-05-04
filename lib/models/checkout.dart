class Checkout {
  final String shopPic;
  final String shopName;
  final double price;
  final List<String> foods;
  final String image;
  final String time;

  const Checkout({
    required this.shopName,
    required this.shopPic,
    required this.image,
    required this.price,
    required this.foods,
    required this.time,
  });
}
