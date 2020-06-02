import 'dart:convert';

import 'package:books/models/User.dart';
import 'package:books/utils/check_response.dart';
import 'package:http/http.dart' as http;

class Login {
  final String api = "http://192.168.1.7:4000";

  static Future<CheckResponse<User>> login(login, pass) async {
    try {
      final body = {'username': login, 'password': pass};

      final response = await http.post(
        "${Login().api}/users/authenticate",
        body: body,
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      final responseParsed = json.decode(response.body);

      if (response.statusCode == 200) {
        return CheckResponse.ok(User(responseParsed));
      }

      return CheckResponse.error(responseParsed['message']);
    } catch (error, exception) {
      print(" >> $error : $exception");
      return CheckResponse.error("Erro ao realizar o login");
    }
  }
}
