import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/menu.dart';

class MenuService {
  static Future<List<Menu>> getAllMenus() async {
    var uri = Uri.https('urchin-app-3onl3.ondigitalocean.app', '/api/menu');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    List data = json.decode(response.body);
    List _temp = [];
    for (var i in data) {
      _temp.add(i);
    }
    return Menu.menuFromSnapshot(_temp);
  }

  static List<Menu> getMenusList(Future<List> mazo) {
    List<Menu> _temp = [];
    mazo.then((value) {
      for (var i in value) {
        _temp.add(i);
       
      }
    });
    
    return _temp;
  }
  
}
