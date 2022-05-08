import 'dart:convert';

import 'package:http/http.dart' as http;

class NotificationService {
  static Future<String> sendSmsCompte(String numero,String code) async {
    final response = await http.post(
      Uri.parse('https://gateway.intechsms.sn/api/send-sms'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'app_key': "619F6F3783FF4619F6F3783FF5",
        "sender": "BrazilTest",
        "content": "Votre code de vérification est : $code",
        "msisdn": ["+221"+numero]
      }),
    );

    var data = json.decode(response.body);
    if (data['error']) {
      print(response.body);
      return '';
    }
    print(response.body);
    return code;
  }
}
