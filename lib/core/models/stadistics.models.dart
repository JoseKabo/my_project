// To parse this JSON data, do
//
//     final stadisticsResponse = stadisticsResponseFromJson(jsonString);

import 'dart:convert';

StadisticsResponse stadisticsResponseFromJson(String str) => StadisticsResponse.fromJson(json.decode(str));

String stadisticsResponseToJson(StadisticsResponse data) => json.encode(data.toJson());

class StadisticsResponse {
    StadisticsResponse({
        this.error,
        this.status,
        this.message,
    });

    bool? error;
    int? status;
    Message? message;

    factory StadisticsResponse.fromJson(Map<String, dynamic> json) => StadisticsResponse(
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

    List<StadisticsModel>? response;
    String? message;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        response: List<StadisticsModel>.from(json["response"].map((x) => StadisticsModel.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
        "message": message,
    };
}

class StadisticsModel {
    StadisticsModel({
        this.trashes,
        this.likes,
        this.posts,
    });

    int? trashes;
    int? likes;
    int? posts;

    factory StadisticsModel.fromJson(Map<String, dynamic> json) => StadisticsModel(
        trashes: json["trashes"],
        likes: json["likes"],
        posts: json["posts"],
    );

    Map<String, dynamic> toJson() => {
        "trashes": trashes,
        "likes": likes,
        "posts": posts,
    };
}
