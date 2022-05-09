class Order {
  final String shopPic;
  final String shopName;
  final double price;
 
  final String image;

  const Order({
    required this.shopName,
    required this.shopPic,
    required this.image,
    required this.price,
    
  });

  factory Order.fromJson(dynamic json) {
    return Order(
      shopName: 'Brazil Burger',
      shopPic: 'assets/img/totsuki.svg',
      price: json['total'] as double,
      image: "assets/img/food/okonomiyaki.png",
    );
  }

  
}
