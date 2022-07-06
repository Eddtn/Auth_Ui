// To parse this JSON data, do
//
//     final authUserModel = authUserModelFromMap(jsonString);

import 'dart:convert';

import 'package:auth_ui/models/user.dart';

AuthUserModel authUserModelFromMap(String str) =>
    AuthUserModel.fromMap(json.decode(str));

String authUserModelToMap(AuthUserModel data) => json.encode(data.toMap());

class AuthUserModel {
  AuthUserModel({
    required this.token,
    required this.user,
  });

  String token;
  UserModel user;

  factory AuthUserModel.fromMap(Map<String, dynamic> json) => AuthUserModel(
        token: json["token"],
        user: UserModel.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user": user.toMap(),
      };
}
