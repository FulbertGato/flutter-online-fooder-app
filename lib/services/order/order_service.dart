import 'dart:convert';

import 'package:customer_app/services/auth/auth_service.dart';
import 'package:customer_app/services/cart/cart_service.dart';

import '../../models/cartItem.dart';
import 'package:http/http.dart' as http;

class OrderService {
  static List<dynamic> detail_commandes = [];

  static void setdetailsCommande() {
    var detail_commandes_map = CartService.cartItemMap;
    detail_commandes_map.forEach((key, cartItem) {
      detail_commandes.add(cartItem.toJson());
    });
  }

  static Future<http.Response> createOrder() async {
    setdetailsCommande();
    var  client_id = authService.user.id;
    var total_price = CartService.getTotal();
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/api/order/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'detail_commandes': detail_commandes,
        'client_id': client_id,
        'total': total_price,}),
    );
    print(response.body);
    return response;
  }
}
