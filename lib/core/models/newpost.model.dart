// To parse this JSON data, do
//
//     final newPostReponse = newPostReponseFromJson(jsonString);

import 'dart:convert';

NewPostReponse newPostReponseFromJson(String str) => NewPostReponse.fromJson(json.decode(str));

String newPostReponseToJson(NewPostReponse data) => json.encode(data.toJson());

class NewPostReponse {
    NewPostReponse({
        this.error,
        this.status,
        this.message,
    });

    bool? error;
    int? status;
    Message? message;

    factory NewPostReponse.fromJson(Map<String, dynamic> json) => NewPostReponse(
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

    List<NewPostModel>? response;
    String? message;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        response: List<NewPostModel>.from(json["response"].map((x) => NewPostModel.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
        "message": message,
    };
}

class NewPostModel {
    NewPostModel({
        this.id,
        this.description,
        this.likes,
        this.trashes,
        this.posted,
    });

    String? id;
    String? description;
    int? likes;
    int? trashes;
    DateTime? posted;

    factory NewPostModel.fromJson(Map<String, dynamic> json) => NewPostModel(
        id: json["id"],
        description: json["description"],
        likes: json["likes"],
        trashes: json["trashes"],
        posted: DateTime.parse(json["posted"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "likes": likes,
        "trashes": trashes,
        "posted": posted!.toIso8601String(),
    };
}
