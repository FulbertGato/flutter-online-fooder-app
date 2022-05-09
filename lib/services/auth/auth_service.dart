import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user.dart';

class authService {
  static bool isLoggedIn = false;
  static User user = User(
    id: 0,
    lastName: "",
    firstName: "",
    email: "",
    phone: "",
    password: "",
  );

//register user

  static Future<bool> registerUser(User user) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/api/auth/client'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': user.password,
        'first_name': user.firstName,
        'last_name': user.lastName,
        'phone': user.phone,
      }),
    );

    var data = json.decode(response.body);
    if (data['error'] != null) {
      print(response.body);
      isLoggedIn = false;
      return false;
    }
    print(response.body);

    user.id = data['id'];
    user.email = data['email'];
    user.firstName = data['first_name'];
    user.lastName = data['last_name'];
    user.phone = data['phone'];
    user.password = '';

    authService.user = user;
    isLoggedIn = true;

    return true;
  }

  //login user
  static Future<bool> loginUser(User user) async {

    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': user.password,
        
      }),
    );

    var data = json.decode(response.body);
    if (data['status'] == "error") {
      print(response.body);
      isLoggedIn = false;
      return false;
    }
    print(response.body);

    user.id = data['id'];
    user.email = data['email'];
    user.firstName = data['first_name'];
    user.lastName = data['last_name'];
    user.phone = data['phone'];
    user.password = "";
    isLoggedIn = true;
    authService.user = user;
    print(user.toString());
    return true;
  
  }
}
