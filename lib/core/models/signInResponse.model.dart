// To parse this JSON data, do
//
//     final signInModelResponse = signInModelResponseFromJson(jsonString);

import 'dart:convert';

SignInModelResponse signInModelResponseFromJson(String str) => SignInModelResponse.fromJson(json.decode(str));

String signInModelResponseToJson(SignInModelResponse data) => json.encode(data.toJson());

class SignInModelResponse {
    SignInModelResponse({
        this.error,
        this.status,
        this.userInfo,
    });

    bool? error;
    int? status;
    UserInfo? userInfo;

    factory SignInModelResponse.fromJson(Map<String, dynamic> json) => SignInModelResponse(
        error: json["error"],
        status: json["status"],
        userInfo: UserInfo.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "result": userInfo!.toJson(),
    };
}

class UserInfo {
    UserInfo({
        this.id,
        this.name,
        this.username,
        this.email,
        this.birthday,
        this.biography,
    });

    String? id;
    String? name;
    String? username;
    String? email;
    DateTime? birthday;
    String? biography;

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        birthday: DateTime.parse(json["birthday"]),
        biography: json["biography"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "birthday": birthday!.toIso8601String(),
        "biography": biography,
    };
}
