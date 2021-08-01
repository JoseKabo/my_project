// To parse this JSON data, do
//
//     final signUpModelResponse = signUpModelResponseFromJson(jsonString);

import 'dart:convert';

SignUpModelResponse signUpModelResponseFromJson(String str) => SignUpModelResponse.fromJson(json.decode(str));

String signUpModelResponseToJson(SignUpModelResponse data) => json.encode(data.toJson());

class SignUpModelResponse {
    SignUpModelResponse({
        required this.error,
        required this.status,
        required this.message,
    });

    bool error;
    int status;
    String message;

    factory SignUpModelResponse.fromJson(Map<String, dynamic> json) => SignUpModelResponse(
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
