import 'dart:convert';

import 'package:books/utils/prefs.dart.dart';

class User {
  String username;
  String firstName;
  String lastName;
  String createdDate;
  String id;
  String token;

  User(
      {this.username,
      this.firstName,
      this.lastName,
      this.createdDate,
      this.id,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    createdDate = json['createdDate'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['createdDate'] = this.createdDate;
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return "{username: $username, firstName: $firstName, lastName: $lastName, createdDate: $createdDate, id: $id, token: $token}";
  }

  void save() {
    Map map = toJson();

    String js = json.encode(map);

    Prefs.setString("user", js);
  }

  static Future<User> get() async {
    return User.fromJson(json.decode(await Prefs.getString("user")));
  }
}
