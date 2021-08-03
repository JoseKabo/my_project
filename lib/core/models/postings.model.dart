// To parse this JSON data, do
//
//     final postingsResponse = postingsResponseFromJson(jsonString);

import 'dart:convert';

PostingsResponse postingsResponseFromJson(String str) => PostingsResponse.fromJson(json.decode(str));

String postingsResponseToJson(PostingsResponse data) => json.encode(data.toJson());

class PostingsResponse {
    PostingsResponse({
        this.error,
        this.status,
        this.message,
    });

    bool? error;
    int? status;
    Message? message;

    factory PostingsResponse.fromJson(Map<String, dynamic> json) => PostingsResponse(
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

    List<Postings>? response;
    String? message;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        response: List<Postings>.from(json["response"].map(
          (x) => Postings.fromJson(x))
        ),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
        "message": message,
    };
}

class Postings {
    Postings({
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

    factory Postings.fromJson(Map<String, dynamic> json) => Postings(
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
