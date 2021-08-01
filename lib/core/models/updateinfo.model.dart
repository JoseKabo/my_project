// To parse this JSON data, do
//
//     final updateInfoResponse = updateInfoResponseFromJson(jsonString);

import 'dart:convert';

UpdateInfoResponse updateInfoResponseFromJson(String str) => UpdateInfoResponse.fromJson(json.decode(str));

String updateInfoResponseToJson(UpdateInfoResponse data) => json.encode(data.toJson());

class UpdateInfoResponse {
    UpdateInfoResponse({
        this.error,
        this.status,
        this.message,
    });

    bool? error;
    int? status;
    Message? message;

    factory UpdateInfoResponse.fromJson(Map<String, dynamic> json) => UpdateInfoResponse(
        error: json["error"],
        status: json["status"],
        message: Message.fromJson(json["message"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "message": message!.toJson(),
    };
}

class Message {
    Message({
        this.response,
        this.message,
    });

    List<UpdateUserModel>? response;
    String? message;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        response: List<UpdateUserModel>.from(json["response"].map((x) => UpdateUserModel.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
        "message": message,
    };
}

class UpdateUserModel {
    UpdateUserModel({
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
    String? birthday;
    String? biography;

    factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        birthday: json["birthday"],
        biography: json["biography"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "birthday": birthday,
        "biography": biography,
    };
}
