import 'dart:convert';

SignInModel addPostReponseFromJson(String str) => SignInModel.fromJson(json.decode(str));

String addPostReponseToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
    SignInModel({
        this.email,
        this.password,
    });
    String? email;
    String? password;

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}