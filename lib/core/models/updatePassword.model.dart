// To parse this JSON data, do
//
//     final UpdatePassword = UpdatePasswordFromJson(jsonString);

import 'dart:convert';

UpdatePassword updatePasswordFromJson(String str) => UpdatePassword.fromJson(json.decode(str));

String updatePasswordToJson(UpdatePassword data) => json.encode(data.toJson());

class UpdatePassword {
    UpdatePassword({
        required this.id,
        required this.lastPassword,
        required this.newPassword,
    });

    String id;
    String lastPassword;
    String newPassword;

    factory UpdatePassword.fromJson(Map<String, dynamic> json) => UpdatePassword(
        id: json["id"],
        lastPassword: json["lastPassword"],
        newPassword: json["newPassword"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lastPassword": lastPassword,
        "newPassword": newPassword
    };
}
