// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
        required this.name,
        required this.username,
        required this.email,
        required this.birthday,
        required this.password,
    });

    String name;
    String username;
    String email;
    DateTime birthday;
    String password;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        birthday: DateTime.parse(json["birthday"]),
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "password": password,
    };
}
