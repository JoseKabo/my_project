// To parse this JSON data, do
//
//     final SharedModelReponse = SharedModelReponseFromJson(jsonString);

import 'dart:convert';

SharedModelReponse sharedModelReponseFromJson(String str) => SharedModelReponse.fromJson(json.decode(str));

String sharedModelReponseToJson(SharedModelReponse data) => json.encode(data.toJson());

class SharedModelReponse {
    SharedModelReponse({
        required this.error,
        required this.status,
        required this.message,
    });

    bool error;
    int status;
    String message;

    factory SharedModelReponse.fromJson(Map<String, dynamic> json) => SharedModelReponse(
        error: json["error"],
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "message": message,
    };
}
