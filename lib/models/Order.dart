class Order {
  final String shopPic;
  final String shopName;
  final String price;
  final List<String> foods;
  final String image;

  const Order({
    required this.shopName,
    required this.shopPic,
    required this.image,
    required this.price,
    required this.foods,
  });
}
