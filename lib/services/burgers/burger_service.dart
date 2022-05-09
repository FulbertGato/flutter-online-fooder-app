import 'dart:convert';

import 'package:customer_app/models/burger.dart';
import 'package:http/http.dart' as http;

class BurgerService {
  

  static Future<List<Burger>> getAllBurgers() async {
    var uri = Uri.https('urchin-app-3onl3.ondigitalocean.app', '/api/burger');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    List data = json.decode(response.body);

    List _temp = [];
    for (var i in data) {
      _temp.add(i);
    }
    return Burger.burgerFromSnapshot(_temp);
  }

  static List<Burger> getBurgersFatigue(Future<List> mazo) {
    List<Burger> _temp = [];
    mazo.then((value) {
      for (var i in value) {
        _temp.add(i);
        
        
      }
    });
    
    return _temp;
  }
}
