import 'package:flutter/foundation.dart';

class User {
  String id, username, email, jwt;
  User(
      {@required this.id,
      @required this.username,
      @required this.email,
      @required this.jwt}) {}

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
        jwt: jsonData['jwt'],
        username: jsonData["username"],
        email: jsonData["email"],
        id: jsonData["id"]);
  }
}
