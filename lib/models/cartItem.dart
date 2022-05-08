

class CartItem {
  final String imgPath;
  final String title;
  final String duration;
  final double prix;
  final String code;
  int quantity ;
  double totalPrice;
  final String shopName = 'Brazil Burger';
  final String shopPic = 'assets/img/totsuki.svg';
  

  CartItem({
    required this.imgPath,
    required this.title,
    required this.duration,
    required this.prix,
    required this.code,
    this.quantity = 0,
    this.totalPrice = 0,
  });

  //to json
  Map<String, dynamic> toJson() => {
        'imgPath': imgPath,
        'title': title,
        'duration': duration,
        'price': prix,
        'code': code,
        'quantity': quantity,
        'total': totalPrice,
        'shopName': shopName,
        'shopPic': shopPic,
        
      };
  }
        
